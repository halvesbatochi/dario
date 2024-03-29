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
        let request = DRRequest(endpoint: .institution)
        
        DRService.shared.execute(request,
                                 expecting: [DRInstitution].self) { [weak self] result in
            switch result {
            case .success(let resultModel):
                self?.institutions = resultModel
                DispatchQueue.main.async {
                    self?.delegate?.drDidFetchInitialInstitutions()
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}
