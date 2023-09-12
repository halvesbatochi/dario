//
//  HomeViewViewModel.swift
//  dario
//
//  Created by Henrique Alves Batochi on 20/08/23.
//

import UIKit

final class DRHomeViewViewModel: NSObject {
    
}

extension DRHomeViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: DRHeaderHomeEventCollectionViewCell.cellIdentifier,
            for: indexPath
        ) as? DRHeaderHomeEventCollectionViewCell else {
            fatalError("Unsupported cell ")
        }
        let viewModel = DRHeaderHomeEventCollectionViewCellViewModel(eventName: "Churrasco Legal",
                                                                     institutionName: "PetCare",
                                                                     eventImageURL: nil)
        cell.configure(with: viewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = bounds.width - 30
        let height = 200.0
        return CGSize(
            width: width,
            height: height
        )
    }
}
