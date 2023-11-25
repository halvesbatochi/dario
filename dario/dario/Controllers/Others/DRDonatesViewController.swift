//
//  DRDonatesViewController.swift
//  dario
//
//  Created by Henrique Alves Batochi on 15/09/23.
//

import UIKit

class DRDonateViewController: UIViewController {
    
    private let donateView = DRDonateView()
    private let viewModel = DRDonateViewViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Doações"
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.systemGray]
        
        view.addSubview(donateView)
        
        viewModel.delegate = self
        donateView.delegate = self
        
        addConstraints()
        
        viewModel.fetchDonate()
    }
    
    // MARK: - Private Methods
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            donateView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            donateView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            donateView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            donateView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

// MARK: - DRDonateViewViewModelDelegate
extension DRDonateViewController: DRDonateViewViewModelDelegate {
    func drDidFetchInitialDonates() {
        donateView.configure(with: viewModel)
        donateView.donateTableView.reloadData()
    }
}

// MARK: - DRDonateViewDelegate
extension DRDonateViewController: DRDonateViewDelegate {
    func drDonateView(_ donateView: DRDonateView, didSelect donate: DRDonate) {
        let viewModel = DRDetailsDonateViewViewModel(donate: donate)
        let vc = DRDetailsDonateViewController(viewModel: viewModel)
        vc.navigationController?.navigationBar.prefersLargeTitles = false
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
}
