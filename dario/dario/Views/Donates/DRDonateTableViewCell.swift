//
//  DRDonateTableViewCell.swift
//  dario
//
//  Created by Henrique Alves Batochi on 19/10/23.
//

import UIKit

class DRDonateTableViewCell: UITableViewCell {
    static let cellIdentifier = "DRDonateTableViewCell"
    
    private let logoInstitution: UIImageView = {
        let logoImage = UIImageView()
        
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.backgroundColor = .systemBackground
        logoImage.contentMode = .scaleToFill
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
    
    private let methodLabel: UILabel = {
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
        contentView.addSubviews(logoInstitution,
                               institutionLabel,
                               methodLabel)
        
        self.accessoryType = .disclosureIndicator
        addConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    // MARK: - Private methods
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            logoInstitution.heightAnchor.constraint(equalToConstant: 80),
            logoInstitution.widthAnchor.constraint(equalToConstant: 80),
            logoInstitution.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            logoInstitution.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            
            institutionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 45),
            institutionLabel.leftAnchor.constraint(equalTo: logoInstitution.rightAnchor, constant: 5),
            institutionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            
            methodLabel.topAnchor.constraint(equalTo: institutionLabel.bottomAnchor, constant: 2),
            methodLabel.leftAnchor.constraint(equalTo: institutionLabel.leftAnchor),
            methodLabel.rightAnchor.constraint(equalTo: institutionLabel.rightAnchor)
        ])
    }
    
    override func prepareForReuse() {
        logoInstitution.image = nil
        institutionLabel.text = nil
        methodLabel.text = nil
        
    }
    
    // MARK: - Public methods
    public func configure(with viewModel: DRDonateTableViewCellViewModel) {
        institutionLabel.text = viewModel.institution
        methodLabel.text = viewModel.method
        
        viewModel.fetchImage { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.logoInstitution.image = image
                }
            case .failure(let error):
                print(String(describing: error))
                break
            }
        }
    }
}
