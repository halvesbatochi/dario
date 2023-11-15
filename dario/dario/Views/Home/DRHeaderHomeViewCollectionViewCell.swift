//
//  DRHeaderHomeViewCollectionViewCell.swift
//  dario
//
//  Created by Henrique Alves Batochi on 20/08/23.
//

import UIKit

/// Single cell for a Event Home
final class DRHeaderHomeViewCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "DRHeaderHomeViewCollectionViewCell"
    
    private let coverView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Teleton2")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10

        
        return imageView
    }()
    
    private let layerView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(white: 1, alpha: 0.8)
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
        view.layer.maskedCorners = [.layerMinXMaxYCorner,
                                    .layerMinXMinYCorner]
        return view
    }()
    
    private let eventLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 18,
                                 weight: .medium)
        
        return label
    }()
    
    private let institutionLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray2
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 12,
                                 weight: .regular)

        return label
    }()

    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .systemBackground
        contentView.layer.cornerRadius = 10
        contentView.addSubviews(coverView,
                                layerView,
                                eventLabel,
                                institutionLabel)
        
        addConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    // MARK: - Private Methods
    
    private func addConstraint() {
        NSLayoutConstraint.activate([
            
            coverView.topAnchor.constraint(equalTo: contentView.topAnchor),
            coverView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            coverView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            coverView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            layerView.heightAnchor.constraint(equalToConstant: 45),
            layerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            layerView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 150),
            layerView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0),
            
            eventLabel.heightAnchor.constraint(equalToConstant: 20),
            eventLabel.topAnchor.constraint(equalTo: layerView.topAnchor, constant: 5),
            eventLabel.leftAnchor.constraint(equalTo: layerView.leftAnchor, constant: 5),
            eventLabel.rightAnchor.constraint(equalTo: layerView.rightAnchor, constant: -5),
            
            institutionLabel.heightAnchor.constraint(equalToConstant: 10),
            institutionLabel.topAnchor.constraint(equalTo: eventLabel.bottomAnchor, constant: 3),
            institutionLabel.leftAnchor.constraint(equalTo: layerView.leftAnchor, constant: 5),
            institutionLabel.rightAnchor.constraint(equalTo: layerView.rightAnchor, constant: -5),

            
        ])
    }
    
    // MARK: - Public Methods
    
    override func prepareForReuse() {
        super.prepareForReuse()
        coverView.image = nil
        eventLabel.text = nil
        institutionLabel.text = nil
    }
    
    public func configure(with viewModel: DRHeaderHomeViewCollectionViewCellViewModel) {
        eventLabel.text = viewModel.eventName
        institutionLabel.text = viewModel.institutionName

      /*  viewModel.fetchImage { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.coverView.image = image
                }
            case .failure(let error):
                print(String(describing: error))
                break
            }
        } */
    }
}
