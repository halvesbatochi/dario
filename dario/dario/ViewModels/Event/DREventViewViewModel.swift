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
        
        let temp1 = DREvent(ad001_vc_nfanta: "Teste", ev001_it_id: 1, ev001_it_inst: 1, ev001_vc_end: "Ola", ev001_it_num: "1", ev001_vc_compl: "Apto91", ev001_vc_bairro: "Centro", ev001_vc_cidade: "Curitiba", ev001_vc_estado: "PR", ev001_vc_pais: "BR", ev001_vc_titulo: "Show de Doações", ev001_dt_inic: "20231111", ev001_hr_inic: "0900", ev001_dt_fim: "20231111", ev001_hr_fim: "1200", ev001_it_npart: "100", ev001_vc_fmsg1: "Ola", ev001_vc_fmsg2: "Ola", ev001_vc_fmsg3: "Ola", ev001_vc_fmsg4: "Ola", ev001_vc_fmsg5: "Ola", ev001_vc_pmsg1: "Ola", ev001_vc_pmsg2: "Ola", ev001_vc_img1: "Ola", ev001_vc_img2: "Ola", ev001_it_atv1: 1, ev001_it_atv2: 2, ev001_it_atv3: 3, ev001_it_situac: "1", ev001_dt_ultatu: "2023", ev001_dt_inclus: "2023")
        let temp2 = DREvent(ad001_vc_nfanta: "Teste", ev001_it_id: 1, ev001_it_inst: 1, ev001_vc_end: "Ola", ev001_it_num: "1", ev001_vc_compl: "Apto91", ev001_vc_bairro: "Centro", ev001_vc_cidade: "Curitiba", ev001_vc_estado: "PR", ev001_vc_pais: "BR", ev001_vc_titulo: "Show de Doações", ev001_dt_inic: "20231111", ev001_hr_inic: "0900", ev001_dt_fim: "20231111", ev001_hr_fim: "1200", ev001_it_npart: "100", ev001_vc_fmsg1: "Ola", ev001_vc_fmsg2: "Ola", ev001_vc_fmsg3: "Ola", ev001_vc_fmsg4: "Ola", ev001_vc_fmsg5: "Ola", ev001_vc_pmsg1: "Ola", ev001_vc_pmsg2: "Ola", ev001_vc_img1: "Ola", ev001_vc_img2: "Ola", ev001_it_atv1: 1, ev001_it_atv2: 2, ev001_it_atv3: 3, ev001_it_situac: "1", ev001_dt_ultatu: "2023", ev001_dt_inclus: "2023")
        let temp3 = DREvent(ad001_vc_nfanta: "Teste", ev001_it_id: 1, ev001_it_inst: 1, ev001_vc_end: "Ola", ev001_it_num: "1", ev001_vc_compl: "Apto91", ev001_vc_bairro: "Centro", ev001_vc_cidade: "Curitiba", ev001_vc_estado: "PR", ev001_vc_pais: "BR", ev001_vc_titulo: "Show de Doações", ev001_dt_inic: "20231111", ev001_hr_inic: "0900", ev001_dt_fim: "20231111", ev001_hr_fim: "1200", ev001_it_npart: "100", ev001_vc_fmsg1: "Ola", ev001_vc_fmsg2: "Ola", ev001_vc_fmsg3: "Ola", ev001_vc_fmsg4: "Ola", ev001_vc_fmsg5: "Ola", ev001_vc_pmsg1: "Ola", ev001_vc_pmsg2: "Ola", ev001_vc_img1: "Ola", ev001_vc_img2: "Ola", ev001_it_atv1: 1, ev001_it_atv2: 2, ev001_it_atv3: 3, ev001_it_situac: "1", ev001_dt_ultatu: "2023", ev001_dt_inclus: "2023")
        events.append(temp1)
        events.append(temp2)
        events.append(temp3)

        
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
                                                                      eventName: "Show de Doações",
                                                                      eventInstitutionName: "AACD",
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
