//
//  DRLoginSuccess.swift
//  dario
//
//  Created by Henrique Alves Batochi on 20/11/23.
//

import UIKit

/// View that handles showing Login Successful view elements
final class DRLoginSuccessfulView: UIView {
    
    private let iconSuccess: UIImageView = {
        let iconImage = UIImageView()
        
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        iconImage.image = UIImage(systemName: "checkmark.shield")
        iconImage.contentMode = .scaleAspectFill
        iconImage.clipsToBounds = true
        
        
        return iconImage
    }()
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Usuário autenticado!"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 22,
                                 weight: .regular)
        
        
        return label
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
        
        addSubviews(iconSuccess, messageLabel)
        
        addConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Private Methods
    
    private func addConstraint() {
        NSLayoutConstraint.activate([
            iconSuccess.heightAnchor.constraint(equalToConstant: 100),
            iconSuccess.widthAnchor.constraint(equalToConstant: 100),
            iconSuccess.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconSuccess.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            messageLabel.topAnchor.constraint(equalTo: iconSuccess.bottomAnchor, constant: 5),
            messageLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            messageLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
        ])
    }
}
