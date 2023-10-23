//
//  DRDonateViewViewModel.swift
//  dario
//
//  Created by Henrique Alves Batochi on 19/10/23.
//

import Foundation

protocol DRDonateViewViewModelDelegate: AnyObject {
    func drDidFetchInitialDonates()
}

final class DRDonateViewViewModel: NSObject {
    
    weak var delegate: DRDonateViewViewModelDelegate?
    
    private var donates: [DRDonate] = [] {
        didSet {
            for donate in donates {
                let cellViewModel = DRDonateTableViewCellViewModel(donate: donate)
                if !cellViewModels.contains(cellViewModel) {
                    cellViewModels.append(cellViewModel)
                }
            }
        }
    }
    
    public private(set) var cellViewModels: [DRDonateTableViewCellViewModel] = []
    
    // MARK: - Init
    override init() {}
    
    // MARK: - Public methods
    public func donate(at index: Int) -> DRDonate? {
        guard index < donates.count, index >= 0 else {
            return nil
        }
        return self.donates[index]
    }
    
    public func loadCellModel(_ indexPath: IndexPath) -> DRDonateTableViewCellViewModel {
        return cellViewModels[indexPath.row]
    }
    
    public func fetchDonate() {
        let temp1 = DRDonate(id: 1, institution: "Fundação Caramelo", method: "Pix")
        let temp2 = DRDonate(id: 2, institution: "ONG 4Patas", method: "Pix")
        let temp3 = DRDonate(id: 3, institution: "Céu Vivo", method: "Doação de Sementes")
        let temp4 = DRDonate(id: 4, institution: "Pegada Fofinha", method: "Doação de Ração")
        let temp5 = DRDonate(id: 5, institution: "MST", method: "Pix")
        let temp6 = DRDonate(id: 6, institution: "ONG Rua Solidária", method: "Pix")
        let temp7 = DRDonate(id: 7, institution: "ONG Pescadores Paraná", method: "Ração de peixe")
        let temp8 = DRDonate(id: 8, institution: "Asilo São Vicente de Paula", method: "Doação de não perecíveis")
        let temp9 = DRDonate(id: 9, institution: "Lar dos Idosos", method: "Doação de Fraldas")
        let temp10 = DRDonate(id: 10, institution: "Orfanato Criança Sempre", method: "Doação de Brinquedos")
        
        donates.append(temp1)
        donates.append(temp2)
        donates.append(temp3)
        donates.append(temp4)
        donates.append(temp5)
        donates.append(temp6)
        donates.append(temp7)
        donates.append(temp8)
        donates.append(temp9)
        donates.append(temp10)
        
        delegate?.drDidFetchInitialDonates()
    }
    
}
