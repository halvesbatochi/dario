//
//  DRDonatesViewController.swift
//  dario
//
//  Created by Henrique Alves Batochi on 15/09/23.
//

import UIKit

class DRDonatesViewController: UIViewController {
    
    private let donatesView = DRDonatesView()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Doações"
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.systemGray]
        
        view.addSubview(donatesView)
        
        setUpView()
    }
    
    // MARK: - Private Methods
    
    private func setUpView() {
        NSLayoutConstraint.activate([
            donatesView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            donatesView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            donatesView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            donatesView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
