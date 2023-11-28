//
//  ProfileViewController.swift
//  dario
//
//  Created by Henrique Alves Batochi on 19/04/23.
//

import UIKit

/// Controller to show Profile
final class DRProfileViewController: UIViewController {
    
    private let loginView = DRLoginView()
    private let successfulLoginView = DRLoginSuccessfulView()
    private let viewModel = DRProfileViewViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        //title = "Login"
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.systemGray]
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.systemGray]
        
        view.addSubviews(loginView, successfulLoginView)
        
        setUpView()
        loginView.delegate = self
        successfulLoginView.delegate = self
        viewModel.delegate = self
        
        guard UserDefaults.standard.string(forKey: "idUser") != nil else {
            loginView.isHidden = false
            successfulLoginView.isHidden = true
            return
        }
        
        loginView.isHidden = true
        successfulLoginView.isHidden = false
        
    }
    
    // MARK: - Private Methods
    
    private func setUpView() {
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            loginView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            loginView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            loginView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            successfulLoginView.topAnchor.constraint(equalTo: loginView.topAnchor),
            successfulLoginView.leftAnchor.constraint(equalTo: loginView.leftAnchor),
            successfulLoginView.rightAnchor.constraint(equalTo: loginView.rightAnchor),
            successfulLoginView.bottomAnchor.constraint(equalTo: loginView.bottomAnchor),
        ])
    }
}

extension DRProfileViewController: DRLoginSuccessfulViewDelegate {
    func navigateToPreferences() {
        let vc = DRPreferenceViewController()
        vc.navigationController?.navigationBar.prefersLargeTitles = true
        vc.navigationItem.largeTitleDisplayMode = .always
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension DRProfileViewController: DRLoginViewDelegate {
    func loginBtnTapped(_ drLoginView: DRLoginView, _ sender: UIButton, _ user: String, _ senha: String) {
        viewModel.login(user: user, password: senha)
    }
}

extension DRProfileViewController: DRProfileViewViewModelDelegate {
    func drLoginFail() {
        self.loginView.eraseLabels()
    }
    
    func drLoginSuccess() {
        DispatchQueue.main.async {
            self.loginView.isHidden = true
            self.successfulLoginView.isHidden = false
        }
    }
}
