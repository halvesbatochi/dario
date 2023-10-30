//
//  DREventsViewViewModel.swift
//  dario
//
//  Created by Henrique Alves Batochi on 16/09/23.
//

import UIKit
protocol DREventViewViewModelDelegate: AnyObject {
    func drDidFetchInitialEvents()
    func drDidSelectEventHeader(_ index: Int)
}

final class DREventViewViewModel: NSObject {
    
    weak var delegate: DREventViewViewModelDelegate?
    
    private var events: [DREvent] = [] {
        didSet {
            for event in events {
                let cellViewModel = DREventTableViewCellViewModel(event: event)
                if !cellViewModels.contains(cellViewModel) {
                    cellViewModels.append(cellViewModel)
                }
            }
        }
    }
    
    public private(set) var cellViewModels: [DREventTableViewCellViewModel] = []
    
    // MARK: - Init
    override init() {}

    
    // MARK: - Public methods
    
    public func event(at index: Int) -> DREvent? {
        guard index < events.count, index >= 0 else {
            return nil
        }
        return self.events[index]
    }
    
    public func countSections() -> Int {
        let sections = cellViewModels.reduce(into: Set<Int>(), {$0.insert($1.category)})
        return sections.count
    }
    
    public func countRowsInSection(_ section: Int) -> Int {
        let sections = cellViewModels.filter { $0.category == (section+1)}
        return sections.count
    }
    
    public func loadCellModel(_ indexPath: IndexPath) -> DREventTableViewCellViewModel {
        let sections = Array(cellViewModels.reduce(into: Set<Int>(), {$0.insert($1.category)}))
        var i = indexPath.section
        var quantity = 0
        if indexPath.section > 0 {
            repeat {
                quantity += sections[i]
                i -= 1
            } while(i > 0)
        }


        let index = quantity + indexPath.row
        return cellViewModels[index]
    }
    
    public func fetchEvents() {
        
        let temp1 = DREvent(id: 1, category: 1, title: "Cão Amigo", subtit: "Fundação Caramelo")
        let temp2 = DREvent(id: 2, category: 1, title: "Gatos legais", subtit: "ONG 4Patas")
        let temp3 = DREvent(id: 3, category: 1, title: "Passsarinhos Voadores", subtit: "Céu Vivo")
        let temp4 = DREvent(id: 4, category: 2, title: "Coelhos fofinhos", subtit: "Pegada Fofinha")
        let temp5 = DREvent(id: 5, category: 2, title: "Abelhas Voadoras", subtit: "MST")
        let temp6 = DREvent(id: 6, category: 2, title: "Quatro Patas", subtit: "ONG Rua Solidária")
        let temp7 = DREvent(id: 7, category: 2, title: "Caramelo Solidário", subtit: "ONG Rua Solidária")
        let temp8 = DREvent(id: 8, category: 3, title: "Peixes molhados", subtit: "ONG Pescadores Paraná")
        events.append(temp1)
        events.append(temp2)
        events.append(temp3)
        events.append(temp4)
        events.append(temp5)
        events.append(temp6)
        events.append(temp7)
        events.append(temp8)
        
        delegate?.drDidFetchInitialEvents()
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
extension DREventViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DRHeaderEventViewCollectionViewCell.cellIdentifier,
                                                            for: indexPath
        ) as? DRHeaderEventViewCollectionViewCell else {
            fatalError("Unsupported cell")
        }
        
        // TODO: Carregando localmente apenas para visualizar durante desenvolvimento - Apagar depois!
        let viewModel = DRHeaderEventViewCollectionViewCellViewModel(eventDate: "Amanhã",
                                                                      eventHour: "09:00",
                                                                      eventName: "Sabadaço da Adoção",
                                                                      eventInstitutionName: "Cão Amigo",
                                                                      eventDistance: 900,
                                                                      eventCoverURL: nil,
                                                                      eventInstitutionLogoURL: nil)
        cell.configure(with: viewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = bounds.width - 30
        let height = 200.0
        return CGSize(width: width,
                      height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.drDidSelectEventHeader(indexPath.item)
    }
}
