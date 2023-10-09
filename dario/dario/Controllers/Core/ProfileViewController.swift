//
//  ProfileViewController.swift
//  dario
//
//  Created by Henrique Alves Batochi on 19/04/23.
//

import UIKit

/// Controller to show Profile
final class ProfileViewController: UIViewController {
    
    private let loginView = DRLoginView()

    override func viewDidLoad() {
        super.viewDidLoad()
        //title = "Login"
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.systemGray]
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.systemGray]
        
        view.addSubview(loginView)
        setUpView()
        
        loginView.delegate = self
    }
    
    // MARK: - Private Methods
    
    private func setUpView() {
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            loginView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            loginView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            loginView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension ProfileViewController: DRLoginViewDelegate {
    func loginBtnTapped(_ drLoginView: DRLoginView, _ sender: UIButton) {
        print("Buttom Tapped Login")
    }
}
