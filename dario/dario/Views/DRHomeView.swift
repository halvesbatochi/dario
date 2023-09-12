//
//  HomeView.swift
//  dario
//
//  Created by Henrique Alves Batochi on 20/08/23.
//

import UIKit

/// View that handles showing home elements, loader and etc.
final class DRHomeView: UIView {
    
    private let viewModel = DRHomeViewViewModel()
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isHidden = true
        collectionView.alpha = 0
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(DRHeaderHomeEventCollectionViewCell.self,
                                forCellWithReuseIdentifier: DRHeaderHomeEventCollectionViewCell.cellIdentifier)
        return collectionView
    }()
    
    private let eventsCard: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemTeal
        
        return view
    }()
    
    private let institutionCard: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemMint
        
        return view
    }()
    
    private let donateCard: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemPink
        
        return view
    }()
    
    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews(collectionView,
                    spinner,
                    eventsCard,
                    institutionCard,
                    donateCard)

        addConstraints()
        setUpCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 210),
            
            eventsCard.heightAnchor.constraint(equalToConstant: 110),
            eventsCard.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20),
            eventsCard.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            eventsCard.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
            
            institutionCard.heightAnchor.constraint(equalToConstant: 110),
            institutionCard.topAnchor.constraint(equalTo: eventsCard.bottomAnchor, constant: 20),
            institutionCard.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            institutionCard.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
            
            donateCard.heightAnchor.constraint(equalToConstant: 110),
            donateCard.topAnchor.constraint(equalTo: institutionCard.bottomAnchor, constant: 20),
            donateCard.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            donateCard.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
            
        ])
    }
    
    private func setUpCollectionView() {
        collectionView.dataSource = viewModel
        collectionView.delegate = viewModel
        
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
            self.collectionView.isHidden = false
            UIView.animate(withDuration: 0.4) {
                self.collectionView.alpha = 1
            }
        })
    }
}
