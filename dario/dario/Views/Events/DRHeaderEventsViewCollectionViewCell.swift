//
//  DRHeaderEventsViewCollectionViewCell.swift
//  dario
//
//  Created by Henrique Alves Batochi on 16/09/23.
//

import UIKit

final class DRHeaderEventsViewCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "DRHeaderEventsViewCollectionViewCell"
    
    private let eventDateLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let eventNameLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let eventInstitutionNameLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let eventDistanceLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let eventCoverView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private let eventInstitutionLogoView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .systemMint
        
        contentView.addSubviews(eventDateLabel)
        
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    // MARK: - Private Methods
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
        
            eventDateLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            eventDateLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            eventDateLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            
        ])
    }
    
    // MARK: - Public Methods
    
    override func prepareForReuse() {
        super.prepareForReuse()
        eventDateLabel.text = nil
        eventNameLabel.text = nil
        eventInstitutionNameLabel.text = nil
        eventDistanceLabel.text = nil
        eventCoverView.image = nil
        eventInstitutionLogoView.image = nil
    }
    
    public func configure(with viewModel: DRHeaderEventsViewCollectionViewCellViewModel) {
        eventDateLabel.text = viewModel.eventDate + " " + viewModel.eventHour
        eventNameLabel.text = viewModel.eventName
        eventInstitutionNameLabel.text = viewModel.eventInstitutionName
        eventDistanceLabel.text = String(viewModel.eventDistance)
        eventCoverView.image = nil
        eventInstitutionLogoView.image = nil
    }
}
