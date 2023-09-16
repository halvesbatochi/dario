//
//  DRInstitutionView.swift
//  dario
//
//  Created by Henrique Alves Batochi on 12/09/23.
//

import UIKit

class DRInstitutionsView: UIView {
    
    private let institutionHeader: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        
        return view
    }()
    
    private let institutionHeaderImage: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "InstitutionHeaderImage")
        
        return imageView
    }()
    
    private let institutionHeaderLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let attrs1 = [NSAttributedString.Key.foregroundColor : UIColor.secondaryLabel]
        let attrs2 = [NSAttributedString.Key.foregroundColor : UIColor(red: 39/255,
                                                                       green: 222/255,
                                                                       blue: 191/255,
                                                                       alpha: 1.0)]
        
        let attributedString1 = NSMutableAttributedString(string: "São tantos caminhos,\ntantas ",
                                                          attributes: attrs1)
        let attributedString2 = NSMutableAttributedString(string: "possibilidades",
                                                          attributes: attrs2)
        let attributedString3 = NSMutableAttributedString(string: " para\nexpressar sua generosidade\nEncontre o ",
                                                          attributes: attrs1)
        let attributedString4 = NSMutableAttributedString(string: "o seu caminho\n",
                                                          attributes: attrs2)
        let attributedString5 = NSMutableAttributedString(string: "para escrever a história\nda ",
                                                          attributes: attrs1)
        let attributedString6 = NSMutableAttributedString(string: "sua solidariedade",
                                                          attributes: attrs2)
        attributedString1.append(attributedString2)
        attributedString1.append(attributedString3)
        attributedString1.append(attributedString4)
        attributedString1.append(attributedString5)
        attributedString1.append(attributedString6)
        
        label.attributedText = attributedString1
        label.numberOfLines = 0
        
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemTeal
        addSubview(institutionHeader)
        
        institutionHeader.addSubviews(institutionHeaderImage,
                                      institutionHeaderLabel)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    // MARK: - Private Methods
    private func addConstraints() {
        NSLayoutConstraint.activate([
            institutionHeader.heightAnchor.constraint(equalToConstant: 150),
            institutionHeader.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            institutionHeader.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            institutionHeader.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            
            institutionHeaderImage.heightAnchor.constraint(equalToConstant: 120),
            institutionHeaderImage.widthAnchor.constraint(equalToConstant: 120),
            institutionHeaderImage.topAnchor.constraint(equalTo: institutionHeader.topAnchor, constant: 15),
            institutionHeaderImage.leftAnchor.constraint(equalTo: institutionHeader.leftAnchor, constant: 30),
            
            institutionHeaderLabel.topAnchor.constraint(equalTo: institutionHeader.topAnchor, constant: 10),
            institutionHeaderLabel.leftAnchor.constraint(equalTo: institutionHeaderImage.rightAnchor, constant: 15),
            institutionHeaderLabel.rightAnchor.constraint(equalTo: institutionHeader.rightAnchor, constant: -5),
            
        ])
    }
    
    
}
