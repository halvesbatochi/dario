//
//  HomeViewController.swift
//  dario
//
//  Created by Henrique Alves Batochi on 19/04/23.
//

import UIKit

/// Controller to show Home
final class HomeViewController: UIViewController {
    
    private let homeView = DRHomeView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        view.addSubview(homeView)
        
        setUpView()
    }
    
    private func setUpView() {
        NSLayoutConstraint.activate([
            homeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            homeView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            homeView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            homeView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
