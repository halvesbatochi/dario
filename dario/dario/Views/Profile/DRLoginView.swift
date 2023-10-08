//
//  DRLoginView.swift
//  dario
//
//  Created by Henrique Alves Batochi on 26/09/23.
//

import UIKit

class DRLoginView: UIView {
    
    private let logoLogin: UIImageView = {
        let logoImage = UIImageView()
        
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.image = UIImage(named: "Login_logo")
        
        return logoImage
    }()
    
    private let userLoginTxt: UITextField = {
        let text = UITextField()
        
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = "Usuário"
        text.textColor = UIColor(named: "DRPrimaryColor")
        text.keyboardType = .default
        text.returnKeyType = .next
        text.clearButtonMode = .whileEditing
        
        return text
    }()
    
    private let passwordLoginTxt: UITextField = {
        let text = UITextField()
        
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = "Senha"
        text.textColor = UIColor(named: "DRPrimaryColor")
        text.isSecureTextEntry = true
        text.autocorrectionType = .no
        text.keyboardType = .default
        text.returnKeyType = .done
        text.clearButtonMode = .whileEditing
        
        return text
    }()
    
    private let loginButton: UIButton = {
        let btn = UIButton()
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Entrar", for: .normal)
        btn.backgroundColor = UIColor(named: "DRPrimaryColor")
        btn.setTitleColor(.white, for: .normal)
        btn.addTarget(self, action: #selector(btnTapped), for: .touchUpInside)
        
        return btn
    }()

    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
        
        userLoginTxt.delegate = self
        passwordLoginTxt.delegate = self
        
        addSubviews(logoLogin,
                    userLoginTxt,
                    passwordLoginTxt,
                    loginButton)

        addConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        endEditing(true)
    }
    
    //MARK: - Private Methods
    @objc private func btnTapped(sender: UIButton) {
        print("Entrar")
    }
    
    private func addConstraint() {
        NSLayoutConstraint.activate([
            logoLogin.heightAnchor.constraint(equalToConstant: 250),
            logoLogin.widthAnchor.constraint(equalToConstant: 250),
            logoLogin.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            logoLogin.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            userLoginTxt.topAnchor.constraint(equalTo: logoLogin.bottomAnchor, constant: 30),
            userLoginTxt.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            userLoginTxt.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            
            passwordLoginTxt.topAnchor.constraint(equalTo: userLoginTxt.bottomAnchor, constant: 25),
            passwordLoginTxt.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            passwordLoginTxt.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            
            loginButton.topAnchor.constraint(equalTo: passwordLoginTxt.bottomAnchor, constant: 30),
            loginButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            loginButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            
        ])
    }
}

extension DRLoginView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Return key")
        return true
    }
}
