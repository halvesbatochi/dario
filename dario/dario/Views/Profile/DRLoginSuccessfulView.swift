//
//  DRLoginSuccess.swift
//  dario
//
//  Created by Henrique Alves Batochi on 20/11/23.
//

import UIKit

protocol DRLoginSuccessfulViewDelegate: AnyObject {
    func navigateToPreferences()
}

/// View that handles showing Login Successful view elements
final class DRLoginSuccessfulView: UIView {
    
    public weak var delegate: DRLoginSuccessfulViewDelegate?
    
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
    
    private lazy var preferencesButton: UIButton = {
        let btn = UIButton()
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Preferências", for: .normal)
        btn.backgroundColor = UIColor(named: "DRPrimaryColor")
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 10.0
        btn.addTarget(self, action: #selector(btnTapped), for: .touchUpInside)
        
        return btn
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
        
        addSubviews(iconSuccess, messageLabel, preferencesButton)
        
        addConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Private Methods
    
    @objc
    private func btnTapped() {
        delegate?.navigateToPreferences()
    }
    
    private func addConstraint() {
        NSLayoutConstraint.activate([
            iconSuccess.heightAnchor.constraint(equalToConstant: 100),
            iconSuccess.widthAnchor.constraint(equalToConstant: 100),
            iconSuccess.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconSuccess.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            messageLabel.topAnchor.constraint(equalTo: iconSuccess.bottomAnchor, constant: 5),
            messageLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            messageLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            
            preferencesButton.heightAnchor.constraint(equalToConstant: 40),
            preferencesButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            preferencesButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            preferencesButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
        ])
    }
}
