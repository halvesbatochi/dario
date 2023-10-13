//
//  DRCalibrationAlgorithmViewViewModel.swift
//  dario
//
//  Created by Henrique Alves Batochi on 08/10/23.
//

import UIKit

protocol DRPreferenceViewViewModelDelegate: AnyObject {
    func didSelectCategory(_ index: Int)
}

final class DRPreferenceViewViewModel: NSObject {
    
    public weak var delegate: DRPreferenceViewViewModelDelegate?
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate, UICallectionViewDelegateFlowLayout
extension DRPreferenceViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DRPreferenceViewCollectionViewCell.cellIdentifier,
                                                            for: indexPath) as? DRPreferenceViewCollectionViewCell else {
            fatalError("Unsupported cell")
        }
        
        // TODO: Carregando localmente apenas para visualizar durante o desenvolvimento - Apagar depois!
        guard let image = UIImage(named: "DogIcon") else {
            fatalError("Icon Category not found")
        }
        let viewModel = DRPreferenceViewCollectionViewCellViewModel(iconCategory: image)
        
        cell.configure(with: viewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let bounds = UIScreen.main.bounds
        let width = (bounds.width - 30) / 2
        let height = width * 0.75
        
        return CGSize(width: width,
                      height: height )
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectCategory(indexPath.item)
    }
}
