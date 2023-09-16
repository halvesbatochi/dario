//
//  DREventsView.swift
//  dario
//
//  Created by Henrique Alves Batochi on 15/09/23.
//

import UIKit

///View that handles showing Events
class DREventsView: UIView {
    
    private let viewModel = DREventsViewViewModel()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0,
                                           left: 10,
                                           bottom: 0,
                                           right: 10)
        
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionView.isHidden = true
        collectionView.alpha = 0
        collectionView.backgroundColor = .systemBackground
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(DRHeaderEventsViewCollectionViewCell.self,
                                forCellWithReuseIdentifier: DRHeaderEventsViewCollectionViewCell.cellIdentifier)
        return collectionView
    }()

    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBlue
        addSubviews(collectionView)
        
        addConstraints()
        setUpCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    // MARK: - Privates Methods
    
    private func setUpCollectionView() {
        collectionView.dataSource = viewModel
        collectionView.delegate = viewModel
        
        DispatchQueue.main.asyncAfter(deadline: .now()+1, execute: {
            self.collectionView.isHidden = false
            UIView.animate(withDuration: 0.4) {
                self.collectionView.alpha = 1
            }
        })
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            collectionView.heightAnchor.constraint(equalToConstant: 210),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
        ])
    }
}
