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
        
        let request = DRRequest(endpoint: .donate)
        
        DRService.shared.execute(request,
                                 expecting: [DRDonate].self) { [weak self] result in
            switch result {
            case .success(let resultModel):
                self?.donates = resultModel
                DispatchQueue.main.async {
                    self?.delegate?.drDidFetchInitialDonates()
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
}
