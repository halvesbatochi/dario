//
//  DRInstitutionViewViewModel.swift
//  dario
//
//  Created by Henrique Alves Batochi on 13/10/23.
//

import Foundation

protocol DRInstitutionViewViewModelDelegate: AnyObject {
    func drDidFetchInitialInstitutions()
}

final class DRInstitutionViewViewModel: NSObject {
    
    weak var delegate: DRInstitutionViewViewModelDelegate?
    
    private var institutions: [DRInstitution] = [] {
        didSet {
            for institution in institutions {
                let cellViewModel = DRInstitutionTableViewCellViewModel(institution: institution)
                if !cellViewModels.contains(cellViewModel) {
                    cellViewModels.append(cellViewModel)
                }
            }
        }
    }
    
    public private(set) var cellViewModels: [DRInstitutionTableViewCellViewModel] = []
    
    // MARK: - Init
    override init() {}
    
    // MARK: - Public methods
    
    public func institution(at index: Int) -> DRInstitution? {
        guard index < institutions.count, index >= 0 else {
            return nil
        }
        return self.institutions[index]
    }
    
    public func loadCellModel(_ indexPath: IndexPath) -> DRInstitutionTableViewCellViewModel {
        return cellViewModels[indexPath.row]
    }
    
    public func fetchInstitution() {
        
        let temp1 = DRInstitution(id: 1, name: "Fundação Caramelo", district: "Rebouças", city: "Curitiba")
        let temp2 = DRInstitution(id: 2, name: "ONG 4Patas", district: "Centro", city: "Curitiba")
        let temp3 = DRInstitution(id: 3, name: "Céu Vivo", district: "Batel", city: "Curitiba")
        let temp4 = DRInstitution(id: 4, name: "Pegada Fofinha", district: "Bigorrilho", city: "Curitiba")
        let temp5 = DRInstitution(id: 5, name: "MST", district: "Água Verde", city: "Curitiba")
        let temp6 = DRInstitution(id: 6, name: "ONG Rua Solidária", district: "Centro", city: "Curitiba")
        let temp7 = DRInstitution(id: 7, name: "ONG Pescadores Paraná", district: "Boqueirão", city: "Curitiba")
        let temp8 = DRInstitution(id: 8, name: "Asilo São Vicente de Paula", district: "Cajuru", city: "Curitiba")
        let temp9 = DRInstitution(id: 9, name: "Lar dos Idosos", district: "Pinheirinho", city: "Curitiba")
        
        institutions.append(temp1)
        institutions.append(temp2)
        institutions.append(temp3)
        institutions.append(temp4)
        institutions.append(temp5)
        institutions.append(temp6)
        institutions.append(temp7)
        institutions.append(temp8)
        institutions.append(temp9)
        
        delegate?.drDidFetchInitialInstitutions()
    }
}
