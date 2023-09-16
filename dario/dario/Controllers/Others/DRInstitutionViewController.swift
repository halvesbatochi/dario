//
//  DRInstitutionViewController.swift
//  dario
//
//  Created by Henrique Alves Batochi on 12/09/23.
//

import UIKit

class DRInstitutionViewController: UIViewController {
    
    private let institutionView = DRInstitutionsView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Instituições"
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.systemGray]
        
        view.addSubview(institutionView)
        
        addConstraints()
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            institutionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            institutionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            institutionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            institutionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
