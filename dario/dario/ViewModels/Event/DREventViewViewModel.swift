//
//  DREventsViewViewModel.swift
//  dario
//
//  Created by Henrique Alves Batochi on 16/09/23.
//

import UIKit
protocol DREventViewViewModelDelegate: AnyObject {
    func drDidFetchInitialEvents()
    func drDidSelectEventHeader(_ event: DREvent)
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
    
    private var eventsHeader: [DREvent] = [] {
        didSet {
            for event in eventsHeader {
                let cellViewModel = DRHeaderEventViewCollectionViewCellViewModel(event: event)
                if !cellViewModelsHeader.contains(cellViewModel) {
                    cellViewModelsHeader.append(cellViewModel)
                }
            }
        }
    }
    public private(set) var cellViewModelsHeader: [DRHeaderEventViewCollectionViewCellViewModel] = []
    
    
    // MARK: - Init
    override init() {}

    
    // MARK: - Public methods
    
    public func event(at indexPath: IndexPath) -> DREvent? {
        let sections = cellViewModels.reduce(into: [Int](), {
            if (!$0.contains($1.category)) {
                $0.append($1.category)
            }
        })
        
        let rows = cellViewModels.filter { $0.category == sections[indexPath.section] }
        let model = rows[indexPath.row]
        return model.eventData
    }
 
    public func countSections() -> Int {
        let sections = cellViewModels.reduce(into: Set<Int>(), {$0.insert($1.category)})
        return sections.count
    }
    
    public func fetchSectionName(_ section: Int) -> String {
        let sections = cellViewModels.reduce(into: [String](), {
            if (!$0.contains($1.categoryDesc)) {
                $0.append($1.categoryDesc)
            }
        })
        return sections[section]
    }
    
    public func countRowsInSection(_ section: Int) -> Int {
        let sections = cellViewModels.reduce(into: [Int](), {
            if (!$0.contains($1.category)) {
                $0.append($1.category)
            }
        })
        
        let rows = cellViewModels.filter { $0.category == sections[section]}
        return rows.count
    }
    
    public func loadCellModel(_ indexPath: IndexPath) -> DREventTableViewCellViewModel {
        let sections = cellViewModels.reduce(into: [Int](), {
            if (!$0.contains($1.category)) {
                $0.append($1.category)
            }
        })
        
        let rows = cellViewModels.filter { $0.category == sections[indexPath.section] }
        
        let model = rows[indexPath.row]
        
        return model
    }
    
    public func fetchEventsHeader() {
        let request = DRRequest(endpoint: .cosine, pathComponents: ["1"])
        
        DRService.shared.execute(request,
                                 expecting: [DREvent].self) { [weak self] result in
            switch result {
            case .success(let resultModel):
                self?.eventsHeader = resultModel
                self?.fetchEventsTable()
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
    public func fetchEventsTable() {
        let request = DRRequest(endpoint: .event)
        
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

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
extension DREventViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModelsHeader.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DRHeaderEventViewCollectionViewCell.cellIdentifier,
                                                            for: indexPath
        ) as? DRHeaderEventViewCollectionViewCell else {
            fatalError("Unsupported cell")
        }

        cell.configure(with: cellViewModelsHeader[indexPath.row])
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
        delegate?.drDidSelectEventHeader(eventsHeader[indexPath.row])
    }
}
