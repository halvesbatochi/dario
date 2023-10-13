//
//  DRCalibrationAlgorithmViewCollectionViewCell.swift
//  dario
//
//  Created by Henrique Alves Batochi on 08/10/23.
//

import UIKit

class DRPreferenceViewCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "DRPreferenceViewCollectionViewCell"
    
    private let categoryIconView: UIImageView = {
        let imageView = UIImageView()

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        
        return imageView
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .systemPink
        contentView.layer.cornerRadius = 10
        contentView.addSubview(categoryIconView)
        
        addConstraint()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    // MARK: - Private methods
    private func addConstraint() {
        NSLayoutConstraint.activate([
            categoryIconView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            categoryIconView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

    
    // MARK: - Public methods
    
    override func prepareForReuse() {
        super.prepareForReuse()
        categoryIconView.image = nil
    }
    
    public func configure(with viewModel: DRPreferenceViewCollectionViewCellViewModel) {
        categoryIconView.image = viewModel.iconCategory
    }
}
