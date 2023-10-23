//
//  DRInstitutionViewController.swift
//  dario
//
//  Created by Henrique Alves Batochi on 12/09/23.
//

import UIKit

class DRInstitutionViewController: UIViewController {
    
    private let institutionView = DRInstitutionView()
    
    private let viewModel = DRInstitutionViewViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Instituições"
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.systemGray]
        
        view.addSubview(institutionView)
        
        viewModel.delegate = self
        institutionView.delegate = self
        
        addConstraints()
        
        viewModel.fetchInstitution()
    }
    
    // MARK: - Private methods
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            institutionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            institutionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            institutionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            institutionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - DRInstitutionViewViewModelDelegate
extension DRInstitutionViewController: DRInstitutionViewViewModelDelegate {
    func drDidFetchInitialInstitutions() {
        institutionView.configure(with: viewModel)
    }
}

// MARK: - DRInstitutionViewDelegate
extension DRInstitutionViewController: DRInstitutionViewDelegate {
    func drInstitutionView(_ institutionView: DRInstitutionView, didSelect institution: DRInstitution) {
        print("Selecionou Instituição")
    }
}
