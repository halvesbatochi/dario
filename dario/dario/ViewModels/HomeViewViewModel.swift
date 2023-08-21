//
//  HomeViewViewModel.swift
//  dario
//
//  Created by Henrique Alves Batochi on 20/08/23.
//

import UIKit

final class HomeViewViewModel: NSObject {
    
}

extension HomeViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .systemMint
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
