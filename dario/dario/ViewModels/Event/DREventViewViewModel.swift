//
//  DREventsViewViewModel.swift
//  dario
//
//  Created by Henrique Alves Batochi on 16/09/23.
//

import UIKit

protocol DREventViewViewModelDelegate: AnyObject {
    func didFetchInitialEvents()
}

final class DREventViewViewModel: NSObject{
    
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
    
    override init() {
        
    }

    
    // MARK: - Public methods
    public func event(at index: Int) -> DREvent? {
        guard index < events.count, index >= 0 else {
            return nil
        }
        return self.events[index]
    }
    
    public func fetchEvents() {
        
        let temp = DREvent(id: 1, title: "Ola", subtit: "Teste")
        let temp2 = DREvent(id: 2, title: "Hi", subtit: "Test")
        let temp3 = DREvent(id: 3, title: "Ola", subtit: "Teste")
        let temp4 = DREvent(id: 4, title: "Hi", subtit: "Test")
        let temp5 = DREvent(id: 5, title: "Ola", subtit: "Teste")
        let temp6 = DREvent(id: 6, title: "Hi", subtit: "Test")
        let temp7 = DREvent(id: 7, title: "Ola", subtit: "Teste")
        let temp8 = DREvent(id: 8, title: "Hi", subtit: "Test")
        events.append(temp)
        events.append(temp2)
        events.append(temp3)
        events.append(temp4)
        events.append(temp5)
        events.append(temp6)
        events.append(temp7)
        events.append(temp8)
        
        delegate?.didFetchInitialEvents()
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
}
