//
//  DRCalibrationView.swift
//  dario
//
//  Created by Henrique Alves Batochi on 08/10/23.
//

import UIKit

class DRPreferenceView: UIView {
    
    private let viewModel = DRPreferenceViewViewModel()
    
    private let calibrationHeaderView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        
        return view
    }()
    
    private let calibrationHeaderImage: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "PreferenceHeaderImage")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private let calibrationHeaderLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let attrs1 = [NSAttributedString.Key.foregroundColor : UIColor.secondaryLabel]
        let attrs2 = [NSAttributedString.Key.foregroundColor : UIColor(red: 48/255,
                                                                       green: 176/255,
                                                                       blue: 199/255,
                                                                       alpha: 1.0)]
        
        let attributedString1 = NSMutableAttributedString(string: "Informe suas preferências\n", 
                                                          attributes: attrs2)
        let attributedString2 = NSMutableAttributedString(string: "Fornecendo suas preferências\nnossos algoritmos melhoram\nas indicações de eventos\npara você!",
                                                          attributes: attrs1)
        
        attributedString1.append(attributedString2)
        
        label.attributedText = attributedString1
        label.numberOfLines = 0
        
        return label
    }()
    
    private let instructionLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let attrs1 = [NSAttributedString.Key.foregroundColor : UIColor.secondaryLabel]
        let attrs2 = [NSAttributedString.Key.foregroundColor : UIColor(named: "DRPrimaryColor")]
        
        let attributedString1 = NSMutableAttributedString(string: "Qual dessas áreas você\n",
                                                          attributes: attrs1)
        let attributedString2 = NSMutableAttributedString(string: "prefere atuar",
                                                          attributes: attrs2 as [NSAttributedString.Key : Any])
        let attributedString3 = NSMutableAttributedString(string: "?",
                                                          attributes: attrs1)
        
        attributedString1.append(attributedString2)
        attributedString1.append(attributedString3)
        
        label.attributedText = attributedString1
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 30,
                                  weight: .semibold)
        
        return label
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = .init(top: 0,
                                    left: 0,
                                    bottom: 0,
                                    right: 0)
        
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .secondarySystemBackground
        collectionView.register(DRPreferenceViewCollectionViewCell.self,
                                forCellWithReuseIdentifier: DRPreferenceViewCollectionViewCell.cellIdentifier)
        
        return collectionView
    }()

    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .secondarySystemBackground
        viewModel.delegate = self
        
        addSubviews(calibrationHeaderView,
                    instructionLabel,
                    collectionView)
        
        calibrationHeaderView.addSubviews(calibrationHeaderImage,
                                          calibrationHeaderLabel)
        
        addConstraints()
        setUpCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    // MARK: - Private methods
    private func addConstraints() {
        NSLayoutConstraint.activate([
            calibrationHeaderView.heightAnchor.constraint(equalToConstant: 150),
            calibrationHeaderView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            calibrationHeaderView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            calibrationHeaderView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            
            calibrationHeaderLabel.topAnchor.constraint(equalTo: calibrationHeaderView.topAnchor, constant: 10),
            calibrationHeaderLabel.leftAnchor.constraint(equalTo: calibrationHeaderView.leftAnchor, constant: 15),
            calibrationHeaderLabel.rightAnchor.constraint(equalTo: calibrationHeaderImage.leftAnchor, constant: -5),
            
            calibrationHeaderImage.heightAnchor.constraint(equalToConstant: 130),
            calibrationHeaderImage.widthAnchor.constraint(equalToConstant: 130),
            calibrationHeaderImage.topAnchor.constraint(equalTo: calibrationHeaderView.topAnchor, constant: 5),
            calibrationHeaderImage.rightAnchor.constraint(equalTo: calibrationHeaderView.rightAnchor, constant: -10),
            
            instructionLabel.topAnchor.constraint(equalTo: calibrationHeaderView.bottomAnchor, constant: 25),
            instructionLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            instructionLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            
            collectionView.topAnchor.constraint(equalTo: instructionLabel.bottomAnchor, constant: 15),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
    }
    
    private func setUpCollectionView() {
        collectionView.dataSource = viewModel
        collectionView.delegate = viewModel
    }
}

// MARK: - DRCalibrationAlgorithmViewViewModelDelegate
extension DRPreferenceView: DRPreferenceViewViewModelDelegate {
    func didSelectPreference(_ index: IndexPath) {
        
        collectionView.visibleCells.forEach { cell in
            cell.contentView.backgroundColor = .white
            cell.contentView.alpha = 1.0
        }
        
        collectionView.cellForItem(at: index)?.contentView.backgroundColor = .systemMint
        collectionView.cellForItem(at: index)?.contentView.alpha = 0.4
    }
}
