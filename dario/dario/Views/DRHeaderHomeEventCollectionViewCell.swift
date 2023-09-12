//
//  DRHeaderHomeEventsCollectionViewCell.swift
//  dario
//
//  Created by Henrique Alves Batochi on 20/08/23.
//

import UIKit

/// Single cell for a Event Home
final class DRHeaderHomeEventCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "DRHeaderHomeEventCollectionViewCell"
    
    private let coverView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let layerView: UIView = {
        let view = UIView()
        
        view.backgroundColor = UIColor(white: 1, alpha: 0.8)
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let eventLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray2
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 18,
                                 weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let institutionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 12,
                                 weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .cyan
        contentView.addSubviews(coverView,
                                layerView,
                                eventLabel,
                                institutionLabel)
        
        addConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func addConstraint() {
        NSLayoutConstraint.activate([
            
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        coverView.image = nil
        eventLabel.text = nil
        institutionLabel.text = nil
    }
    
    public func configure(with viewModel: DRHeaderHomeEventCollectionViewCellViewModel) {
        eventLabel.text = viewModel.eventName
        institutionLabel.text = viewModel.institutionName

        viewModel.fetchImage { [weak self] result in
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
        }
    }
}
