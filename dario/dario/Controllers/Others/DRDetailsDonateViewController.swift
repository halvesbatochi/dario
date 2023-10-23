//
//  DRDetailsDonateViewController.swift
//  dario
//
//  Created by Henrique Alves Batochi on 22/10/23.
//

import UIKit

class DRDetailsDonateViewController: UIViewController {
    
    private let detailsDonateView = DRDetailsDonateView()
    private let viewModel = DRDetailsDonateViewViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detalhes"
        view.backgroundColor = .systemBackground
        view.addSubview(detailsDonateView)
        addConstraints()
        setUpView()
    }
    
    // MARK: - Private methods
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            detailsDonateView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailsDonateView.leftAnchor.constraint(equalTo: view.leftAnchor),
            detailsDonateView.rightAnchor.constraint(equalTo: view.rightAnchor),
            detailsDonateView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setUpView() {
        detailsDonateView.configure(with: viewModel)
    }
    
    // MARK: - Public methods
    
    public func configure(with donate: DRDonate) {
        viewModel.configure(with: donate)
    }
}
