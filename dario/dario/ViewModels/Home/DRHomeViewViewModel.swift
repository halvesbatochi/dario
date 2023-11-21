//
//  HomeViewViewModel.swift
//  dario
//
//  Created by Henrique Alves Batochi on 20/08/23.
//

import UIKit

protocol DRHomeViewViewModelDelegate: AnyObject {
    func didSelectEventHeaderHome(_ event: DREvent)
    func didFetchInitialEvents()
}

final class DRHomeViewViewModel: NSObject {
    
    public weak var delegate: DRHomeViewViewModelDelegate?
    
    private var events: [DREvent] = [] {
        didSet {
            for event in events {
                let viewModel = DRHeaderHomeViewCollectionViewCellViewModel(eventName: event.ev001_vc_titulo,
                                                                            institutionName: event.ev001_vc_pais,
                                                                            eventCoverURL: URL(string: event.ev001_vc_img1))
                cellHeaderViewModels.append(viewModel)
            }
        }
    }
    
    private var cellHeaderViewModels: [DRHeaderHomeViewCollectionViewCellViewModel] = []
    
    public func fetchEvents() {
        let request = DRRequest(endpoint: .eventColdStart)
        
        DRService.shared.execute(request,
                                 expecting: [DREvent].self) { [weak self] result in
            switch result {
            case .success(let resultModel):
                print("Sucesso")
                self?.events = resultModel
                DispatchQueue.main.async {
                    self?.delegate?.didFetchInitialEvents()
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
extension DRHomeViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellHeaderViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: DRHeaderHomeViewCollectionViewCell.cellIdentifier,
            for: indexPath
        ) as? DRHeaderHomeViewCollectionViewCell else {
            fatalError("Unsupported cell")
        }
        
        cell.configure(with: cellHeaderViewModels[indexPath.row])
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
        delegate?.didSelectEventHeaderHome(events[indexPath.item])
    }
}
