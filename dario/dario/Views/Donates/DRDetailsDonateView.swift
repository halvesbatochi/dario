//
//  DRDetailsDonateView.swift
//  dario
//
//  Created by Henrique Alves Batochi on 22/10/23.
//

import UIKit

/// View to realy details donate view events
final class DRDetailsDonateView: UIView {
    
    private let detailsDonateHeader: UIView = {
        let view = UIView()
       
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        
        return view
    }()
    
    private let logoInstitutionView: UIImageView = {
        let logoImage = UIImageView()
        
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.backgroundColor = .systemCyan
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
        label.text = "Rebouças - Curitiba"
        
        return label
    }()
    
    private let detailDonateImage: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "DetailDonateHeader")
        
        return imageView
    }()
    
    private let detailDonateDescLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let attrs1 = [NSAttributedString.Key.foregroundColor : UIColor.secondaryLabel]
        let attrs2 = [NSAttributedString.Key.foregroundColor : UIColor(red: 255/255,
                                                                       green: 202/255,
                                                                       blue: 115/255,
                                                                       alpha: 1.0)]
        
        let attributedString1 = NSMutableAttributedString(string: "Agradecemos a sua intenção em contribuir com a ",
                                                          attributes: attrs1)
        let attributedString2 = NSMutableAttributedString(string: "nossa causa",
                                                          attributes: attrs2)
        let attributedString3 = NSMutableAttributedString(string: "!",
                                                          attributes: attrs1)
        
        attributedString1.append(attributedString2)
        attributedString1.append(attributedString3)
        
        label.attributedText = attributedString1
        label.numberOfLines = 0
        
        return label
    }()
    
    private let detailDonateDesc2Label: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let attrs1 = [NSAttributedString.Key.foregroundColor : UIColor.secondaryLabel]
        let attrs2 = [NSAttributedString.Key.foregroundColor : UIColor(red: 255/255,
                                                                       green: 202/255,
                                                                       blue: 115/255,
                                                                       alpha: 1.0)]
        
        let attributedString1 = NSMutableAttributedString(string: "Continuadamente ",
                                                          attributes: attrs1)
        let attributedString2 = NSMutableAttributedString(string: "necessitamos de doações ",
                                                          attributes: attrs2)
        let attributedString3 = NSMutableAttributedString(string: "para cobrir os gastos de nossas atividades.",
                                                          attributes: attrs1)
        
        attributedString1.append(attributedString2)
        attributedString1.append(attributedString3)
        
        label.attributedText = attributedString1
        label.numberOfLines = 0
        
        return label
    }()
    
    private let detailDonateDesc3Label: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let attrs1 = [NSAttributedString.Key.foregroundColor : UIColor.secondaryLabel]
        let attrs2 = [NSAttributedString.Key.foregroundColor : UIColor(red: 255/255,
                                                                       green: 202/255,
                                                                       blue: 115/255,
                                                                       alpha: 1.0)]
        
        let attributedString1 = NSMutableAttributedString(string: "Aceitamos doações o ano inteiro, saiba que seus recursos serão ",
                                                          attributes: attrs1)
        let attributedString2 = NSMutableAttributedString(string: "integralmente aplicados ",
                                                          attributes: attrs2)
        let attributedString3 = NSMutableAttributedString(string: "para execução das nossas atividades.",
                                                          attributes: attrs1)
        
        attributedString1.append(attributedString2)
        attributedString1.append(attributedString3)
        
        label.attributedText = attributedString1
        label.numberOfLines = 0
        
        return label
    }()
    
    private let detailDonateMethodView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        return view
    }()
    
    private let detailDonateMethodTitleLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 18,
                                 weight: .semibold)
        
        return label
    }()
    
    private let detailDonateMethodDescLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Asilo São Vicente de Paula"
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    private let detailDonateMethodDescSecLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Chave: 00.000.000/0000-00"
        label.textColor = .secondaryLabel

        return label
    }()

    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .secondarySystemBackground
        addSubviews(detailsDonateHeader,
                    detailDonateImage,
                    detailDonateDescLabel,
                    detailDonateDesc2Label,
                    detailDonateDesc3Label,
                    detailDonateMethodView)
        
        detailsDonateHeader.addSubviews(logoInstitutionView,
                                        institutionHeaderLabel,
                                        institutionAddressLabel)
        
        detailDonateMethodView.addSubviews(detailDonateMethodTitleLabel,
                                           detailDonateMethodDescLabel,
                                           detailDonateMethodDescSecLabel)
        
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    // MARK: - Private methods
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            detailsDonateHeader.heightAnchor.constraint(equalToConstant: 110),
            detailsDonateHeader.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            detailsDonateHeader.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            detailsDonateHeader.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            
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
            
            detailDonateImage.heightAnchor.constraint(equalToConstant: 160),
            detailDonateImage.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor),
            detailDonateImage.topAnchor.constraint(equalTo: detailsDonateHeader.bottomAnchor),
            
            detailDonateDescLabel.topAnchor.constraint(equalTo: detailDonateImage.bottomAnchor, constant: 10),
            detailDonateDescLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            detailDonateDescLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            
            detailDonateDesc2Label.topAnchor.constraint(equalTo: detailDonateDescLabel.bottomAnchor),
            detailDonateDesc2Label.leftAnchor.constraint(equalTo: detailDonateDescLabel.leftAnchor),
            detailDonateDesc2Label.rightAnchor.constraint(equalTo: detailDonateDescLabel.rightAnchor),
            
            detailDonateDesc3Label.topAnchor.constraint(equalTo: detailDonateDesc2Label.bottomAnchor),
            detailDonateDesc3Label.leftAnchor.constraint(equalTo: detailDonateDescLabel.leftAnchor),
            detailDonateDesc3Label.rightAnchor.constraint(equalTo: detailDonateDescLabel.rightAnchor),
            
            detailDonateMethodView.heightAnchor.constraint(equalToConstant: 100),
            detailDonateMethodView.leftAnchor.constraint(equalTo: leftAnchor),
            detailDonateMethodView.rightAnchor.constraint(equalTo: rightAnchor),
            detailDonateMethodView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
            
            detailDonateMethodTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            detailDonateMethodTitleLabel.topAnchor.constraint(equalTo: detailDonateMethodView.topAnchor, constant: 5),
            
            detailDonateMethodDescLabel.topAnchor.constraint(equalTo: detailDonateMethodTitleLabel.bottomAnchor, constant: 10),
            detailDonateMethodDescLabel.leftAnchor.constraint(equalTo: detailDonateMethodView.leftAnchor, constant: 10),
            detailDonateMethodDescLabel.rightAnchor.constraint(equalTo: detailDonateMethodView.rightAnchor, constant: -10),
            
            detailDonateMethodDescSecLabel.topAnchor.constraint(equalTo: detailDonateMethodDescLabel.bottomAnchor),
            detailDonateMethodDescSecLabel.leftAnchor.constraint(equalTo: detailDonateMethodDescLabel.leftAnchor),
            detailDonateMethodDescSecLabel.rightAnchor.constraint(equalTo: detailDonateMethodDescLabel.rightAnchor),
        ])
    }
    
    // MARK: - Public methods
    
    public func configure(with viewModel: DRDetailsDonateViewViewModel) {
        institutionHeaderLabel.text = viewModel.institutionName
        detailDonateMethodTitleLabel.text = viewModel.method
    }
}
