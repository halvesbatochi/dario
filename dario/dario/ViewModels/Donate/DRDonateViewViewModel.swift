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
        let temp1 = DRDonate(id: 1, institution: "AACD", method: "Pix", logo: "Logo6")
        let temp2 = DRDonate(id: 2, institution: "Hospital Cruz Verde", method: "Pix", logo: "Logo3")
        let temp3 = DRDonate(id: 3, institution: "Ronald McDonald", method: "Pix", logo: "Logo4")
        let temp4 = DRDonate(id: 4, institution: "Aldeias Infantis", method: "Doação de Brinquedos", logo: "Logo5")
        let temp5 = DRDonate(id: 5, institution: "Habitat", method: "Pix", logo: "Logo1")
        let temp6 = DRDonate(id: 6, institution: "Conservação Internacional", method: "Pix", logo: "Logo2")
        let temp7 = DRDonate(id: 7, institution: "ONG Pescadores Paraná", method: "Ração de peixe", logo: "Logo6")
        let temp8 = DRDonate(id: 8, institution: "Asilo São Vicente de Paula", method: "Doação de não perecíveis", logo: "Logo6")
        let temp9 = DRDonate(id: 9, institution: "Lar dos Idosos", method: "Doação de Fraldas", logo: "Logo6")
        let temp10 = DRDonate(id: 10, institution: "Orfanato Criança Sempre", method: "Doação de Brinquedos", logo: "Logo6")
        
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
