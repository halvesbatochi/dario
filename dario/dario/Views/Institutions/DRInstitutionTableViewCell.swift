//
//  DRInstitutionTableViewCell.swift
//  dario
//
//  Created by Henrique Alves Batochi on 13/10/23.
//

import UIKit

final class DRInstitutionTableViewCell: UITableViewCell {
    static let cellIdentifier = "DRInstitutionTableViewCell"
    
    private let logoImage: UIImageView = {
        let logoImage = UIImageView()
        
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.backgroundColor = .systemBackground
        logoImage.clipsToBounds = true
        logoImage.layer.cornerRadius = 10
        
        return logoImage
    }()
    
    private let institutionLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 18,
                                 weight: .regular)
        
        return label
    }()
    
    private let districtCityLabel: UILabel = {
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
                                institutionLabel,
                                districtCityLabel)
        
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
            
            institutionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 45),
            institutionLabel.leftAnchor.constraint(equalTo: logoImage.rightAnchor, constant: 5),
            institutionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            
            districtCityLabel.topAnchor.constraint(equalTo: institutionLabel.bottomAnchor, constant: 2),
            districtCityLabel.leftAnchor.constraint(equalTo: institutionLabel.leftAnchor),
            districtCityLabel.rightAnchor.constraint(equalTo: institutionLabel.rightAnchor),
        ])
    }
    
    override func prepareForReuse() {
        logoImage.image = nil
        institutionLabel.text = nil
        districtCityLabel.text = nil
    }
    
    // MARK: - Public methods
    public func configure(with viewModel: DRInstitutionTableViewCellViewModel) {
        institutionLabel.text = viewModel.name
        districtCityLabel.text = viewModel.districtAndCity
        logoImage.image = UIImage(named: viewModel.logo)
    }
}
