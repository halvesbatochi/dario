//
//  DRHeaderEventsViewCollectionViewCell.swift
//  dario
//
//  Created by Henrique Alves Batochi on 16/09/23.
//

import UIKit

final class DRHeaderEventViewCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "DRHeaderEventViewCollectionViewCell"
    
    private let eventDateLabel: UILabel = {
        let label = UILabel()
    
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemBlue
        label.font = .systemFont(ofSize: 15, weight: .light)
        
        return label
    }()
    
    private let eventNameLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        
        return label
    }()
    
    private let eventCoverView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        
        return imageView
    }()
    
    private let eventInstitutionLogoView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .systemBackground
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        
        return imageView
    }()
    
    private let eventInstitutionNameLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray6
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        
        return label
    }()
    
    private let eventDistanceIcone: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Location")
        imageView.isHidden = true
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private let eventDistanceLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemGray6
        
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .systemBackground
        
        contentView.addSubviews(eventDateLabel,
                                eventNameLabel,
                                eventCoverView)
        
        eventCoverView.addSubviews(eventInstitutionLogoView,
                                   eventInstitutionNameLabel,
                                   eventDistanceIcone,
                                   eventDistanceLabel)
        
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    // MARK: - Private Methods
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            eventDateLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            eventDateLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 7),
            eventDateLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            
            eventNameLabel.topAnchor.constraint(equalTo: eventDateLabel.bottomAnchor),
            eventNameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 7),
            eventNameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            
            eventCoverView.topAnchor.constraint(equalTo: eventNameLabel.bottomAnchor, constant: 5),
            eventCoverView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            eventCoverView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            eventCoverView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            eventInstitutionLogoView.heightAnchor.constraint(equalToConstant: 50),
            eventInstitutionLogoView.widthAnchor.constraint(equalToConstant: 50),
            eventInstitutionLogoView.leftAnchor.constraint(equalTo: eventCoverView.leftAnchor, constant: 5),
            eventInstitutionLogoView.bottomAnchor.constraint(equalTo: eventCoverView.bottomAnchor, constant: -5),
            
            eventInstitutionNameLabel.topAnchor.constraint(equalTo: eventCoverView.bottomAnchor, constant: -52),
            eventInstitutionNameLabel.leftAnchor.constraint(equalTo: eventInstitutionLogoView.rightAnchor, constant: 5),
            eventInstitutionNameLabel.rightAnchor.constraint(equalTo: eventCoverView.rightAnchor, constant: -5),
            
            eventDistanceIcone.heightAnchor.constraint(equalToConstant: 13),
            eventDistanceIcone.widthAnchor.constraint(equalToConstant: 11),
            eventDistanceIcone.topAnchor.constraint(equalTo: eventCoverView.bottomAnchor, constant: -26),
            eventDistanceIcone.leftAnchor.constraint(equalTo: eventInstitutionLogoView.rightAnchor, constant: 7),
            
            eventDistanceLabel.topAnchor.constraint(equalTo: eventCoverView.bottomAnchor, constant: -30),
            eventDistanceLabel.leftAnchor.constraint(equalTo: eventDistanceIcone.rightAnchor, constant: 3),
            eventDistanceLabel.rightAnchor.constraint(equalTo: eventCoverView.rightAnchor, constant: -5)
            
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
    
    public func configure(with viewModel: DRHeaderEventViewCollectionViewCellViewModel) {
        eventDateLabel.text = viewModel.dateEvent + " - " + viewModel.hourEvent
        eventNameLabel.text = viewModel.event.ev001_vc_titulo
        eventInstitutionNameLabel.text = viewModel.event.ad001_vc_nfanta

        viewModel.fetchImageCapa { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.eventCoverView.image = image
                }
            case .failure(let error):
                print(String(describing: error))
                break
            }
        }
        
        viewModel.fetchImageLogo { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.eventInstitutionLogoView.image = image
                }
            case .failure(let error):
                print(String(describing: error))
                break
            }
        }
    }
}
