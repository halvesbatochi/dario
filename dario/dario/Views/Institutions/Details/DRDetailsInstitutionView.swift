//
//  DRDetailsInstitutionView.swift
//  dario
//
//  Created by Henrique Alves Batochi on 23/10/23.
//

import UIKit

/// View for single Institution info
final class DRDetailsInstitutionView: UIView {
    
    private let viewModel: DRDetailsInstitutionViewViewModel
    
    private let detailsInstitutionHeader: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        
        return view
    }()
    
    private let logoInstitutionView: UIView = {
        let logoImage = UIImageView()
        
        logoImage.image = UIImage(named: "Logo6")
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.backgroundColor = .systemBackground
        logoImage.contentMode = .scaleAspectFill
        logoImage.clipsToBounds = true
        logoImage.layer.cornerRadius = 10
        
        return logoImage
    }()
    
    private let institutionHeaderLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 18,
                                 weight: .medium)
        
        return label
    }()
    
    private let institutionAddressLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    private let backgroundDescriptionView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .secondarySystemBackground
        
        return view
    }()
    
    private let detailsInstitutionBiographyLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        
        return label
    }()
    
    private let backgroundContactView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .secondarySystemBackground
        
        return view
    }()
    
    private let methodTitleLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryLabel
        label.text = "PIX"
        
        return label
    }()
    
    private let contactDescLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryLabel
        label.text = "Você pode entrar em contato conosco através dos seguintes canais:"
        label.numberOfLines = 0
        
        return label
    }()
    
    private let contactMethodLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryLabel
        label.text = "(11) 94311-0144"
        
        return label
    }()
    
    private let contactMethod2Label: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryLabel
        label.text = "doeteleton@aacd.org.br"
        
        return label
    }()
    
    // MARK: - Init
    init(frame: CGRect, viewModel: DRDetailsInstitutionViewViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground

        addSubviews(detailsInstitutionHeader,
                    backgroundDescriptionView,
                    backgroundContactView)
        
        detailsInstitutionHeader.addSubviews(logoInstitutionView,
                                             institutionHeaderLabel,
                                             institutionAddressLabel)
        
        backgroundDescriptionView.addSubview(detailsInstitutionBiographyLabel)
        
        backgroundContactView.addSubviews(contactDescLabel,
                                          contactMethodLabel,
                                          contactMethod2Label)
        
        addConstraints()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    // MARK: - Private methods
    private func configure() {
        institutionHeaderLabel.text = viewModel.institutionName
        institutionAddressLabel.text = viewModel.institutionAddress
        detailsInstitutionBiographyLabel.text = viewModel.institutionBiography
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            detailsInstitutionHeader.heightAnchor.constraint(equalToConstant: 110),
            detailsInstitutionHeader.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            detailsInstitutionHeader.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            detailsInstitutionHeader.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            
            logoInstitutionView.heightAnchor.constraint(equalToConstant: 80),
            logoInstitutionView.widthAnchor.constraint(equalToConstant: 80),
            logoInstitutionView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            logoInstitutionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            
            institutionHeaderLabel.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            institutionHeaderLabel.leftAnchor.constraint(equalTo: logoInstitutionView.rightAnchor, constant: 10),
            institutionHeaderLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            
            institutionAddressLabel.topAnchor.constraint(equalTo: institutionHeaderLabel.bottomAnchor),
            institutionAddressLabel.leftAnchor.constraint(equalTo: institutionHeaderLabel.leftAnchor),
            institutionAddressLabel.rightAnchor.constraint(equalTo: institutionHeaderLabel.rightAnchor),
            
            backgroundDescriptionView.heightAnchor.constraint(equalToConstant: 330),
            backgroundDescriptionView.topAnchor.constraint(equalTo: detailsInstitutionHeader.bottomAnchor),
            backgroundDescriptionView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            backgroundDescriptionView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            
            detailsInstitutionBiographyLabel.topAnchor.constraint(equalTo: backgroundDescriptionView.topAnchor, constant: 10),
            detailsInstitutionBiographyLabel.leftAnchor.constraint(equalTo: backgroundDescriptionView.leftAnchor, constant: 10),
            detailsInstitutionBiographyLabel.rightAnchor.constraint(equalTo: backgroundDescriptionView.rightAnchor, constant: -10),
            detailsInstitutionBiographyLabel.bottomAnchor.constraint(equalTo: backgroundDescriptionView.bottomAnchor, constant: -10),
            
            backgroundContactView.heightAnchor.constraint(equalToConstant: 120),
            backgroundContactView.topAnchor.constraint(equalTo: backgroundDescriptionView.bottomAnchor, constant: 20),
            backgroundContactView.leftAnchor.constraint(equalTo: backgroundDescriptionView.leftAnchor),
            backgroundContactView.rightAnchor.constraint(equalTo: backgroundDescriptionView.rightAnchor),
            
            contactDescLabel.topAnchor.constraint(equalTo: backgroundContactView.topAnchor, constant: 5),
            contactDescLabel.leftAnchor.constraint(equalTo: backgroundContactView.leftAnchor, constant: 10),
            contactDescLabel.rightAnchor.constraint(equalTo: backgroundContactView.rightAnchor, constant: -10),
            
            contactMethodLabel.topAnchor.constraint(equalTo: contactDescLabel.bottomAnchor, constant: 10),
            contactMethodLabel.leftAnchor.constraint(equalTo: backgroundContactView.leftAnchor, constant: 10),
            contactMethodLabel.rightAnchor.constraint(equalTo: backgroundContactView.rightAnchor, constant: -10),
            
            
            contactMethod2Label.topAnchor.constraint(equalTo: contactMethodLabel.bottomAnchor),
            contactMethod2Label.leftAnchor.constraint(equalTo: contactMethodLabel.leftAnchor),
            contactMethod2Label.rightAnchor.constraint(equalTo: contactMethodLabel.rightAnchor),
        ])
    }
}
