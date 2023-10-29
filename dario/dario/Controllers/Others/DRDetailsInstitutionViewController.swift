//
//  DRDetailsInstitutionViewController.swift
//  dario
//
//  Created by Henrique Alves Batochi on 23/10/23.
//

import UIKit

/// Controller to show info about single Institution
final class DRDetailsInstitutionViewController: UIViewController {
    
    private let detailsInstitutionView: DRDetailsInstitutionView
    private let viewModel: DRDetailsInstitutionViewViewModel

    // MARK: - Init
    init(viewModel: DRDetailsInstitutionViewViewModel) {
        self.viewModel = viewModel
        self.detailsInstitutionView = DRDetailsInstitutionView(frame: .zero, viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detalhes"
        view.backgroundColor = .systemBackground
        
        view.addSubview(detailsInstitutionView)
        
        addConstraints()
    }
    
    // MARK: - Private methods
    private func addConstraints() {
        NSLayoutConstraint.activate([
            detailsInstitutionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailsInstitutionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            detailsInstitutionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            detailsInstitutionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
