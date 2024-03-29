//
//  DREventsTableViewCell.swift
//  dario
//
//  Created by Henrique Alves Batochi on 10/10/23.
//

import UIKit

final class DREventTableViewCell: UITableViewCell {
    static let cellIdentifier = "DREventTableViewCell"
    
    public let logoImage: UIImageView = {
        let logoImage = UIImageView()
        
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.backgroundColor = .systemBackground
        logoImage.clipsToBounds = true
        logoImage.contentMode = .scaleToFill
        logoImage.layer.cornerRadius = 10
        
        return logoImage
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 18,
                                 weight: .regular)
        
        return label
    }()
    
    private let institutionLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 14,
                                 weight: .light)
        
        return label
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubviews(logoImage,
                                titleLabel,
                                institutionLabel)
        
        self.accessoryType = .disclosureIndicator
        
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    // MARK: - Private methods
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            
            logoImage.heightAnchor.constraint(equalToConstant: 80),
            logoImage.widthAnchor.constraint(equalToConstant: 80),
            logoImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            logoImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 45),
            titleLabel.leftAnchor.constraint(equalTo: logoImage.rightAnchor, constant: 5),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            
            institutionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            institutionLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            institutionLabel.rightAnchor.constraint(equalTo: titleLabel.rightAnchor)
        ])
    }
    
    override func prepareForReuse() {
        titleLabel.text = nil
        institutionLabel.text = nil
        logoImage.image = nil
    }
    
    // MARK: - Public methods
    
    public func configure(with viewModel: DREventTableViewCellViewModel) {
        titleLabel.text = viewModel.title
        institutionLabel.text = viewModel.subtit
        
        viewModel.fetchImage { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.logoImage.image = image
                }
            case .failure(let error):
                print(String(describing: error))
                break
            }
        }
    }
}
