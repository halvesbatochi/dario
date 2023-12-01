//
//  DRTimeLineViewViewModel.swift
//  dario
//
//  Created by Henrique Alves Batochi on 27/11/23.
//

import Foundation

protocol DRTimeLineViewViewModelDelegate: AnyObject {
    func drDidFetchInitialEvents()
}

final class DRTimeLineViewViewModel: NSObject {
    
    weak var delegate: DRTimeLineViewViewModelDelegate?
    
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
    

    
    public func fetchEventsTable(id: Int) {
        let request = DRRequest(endpoint: .historic, pathComponents: [String(id)])
        
        DRService.shared.execute(request,
                                 expecting: [DREvent].self) { [weak self] result in
            switch result {
            case .success(let resultModel):
                self?.events = resultModel
                DispatchQueue.main.async {
                    self?.delegate?.drDidFetchInitialEvents()
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
}
