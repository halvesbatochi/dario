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
        preventLargeTitleCollapsing()
        
        title = "Home"
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.systemGray]
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.systemGray]
        
        homeView.delegate = self
        
        view.addSubview(homeView)
        
        setUpView()
    }
    
    private func preventLargeTitleCollapsing() {
        let dummyView = UIView()
        view.addSubview(dummyView)
        view.sendSubviewToBack(dummyView)
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

extension HomeViewController: DRHomeViewDelegate {
    func navigateEventsView(_ homeView: DRHomeView) {
        let vc = DREventViewController()
        vc.navigationController?.navigationBar.prefersLargeTitles = true
        vc.navigationItem.largeTitleDisplayMode = .always
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func navigateInstitutionsView(_ homeView: DRHomeView) {
        let vc = DRInstitutionViewController()
        vc.navigationController?.navigationBar.prefersLargeTitles = true
        vc.navigationItem.largeTitleDisplayMode = .always
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func navigateDonatesView(_ homeView: DRHomeView) {
        let vc = DRDonateViewController()
        vc.navigationController?.navigationBar.prefersLargeTitles = true
        vc.navigationItem.largeTitleDisplayMode = .always
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func didSelectEventHeaderHome(_ homeView: DRHomeView, _ index: Int) {
        let vc = DREventHomeSheetViewController()
        vc.delegate = self
        let nav = UINavigationController(rootViewController: vc)
        nav.isNavigationBarHidden = true
        if let sheet = vc.sheetPresentationController {
            sheet.detents = [.large()]
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 30
        }
        self.present(nav, animated: true)
    }
}

extension HomeViewController: drEventHomeSheetViewDelegate {
    func navigateToSubscription() {
        let event = DREvent(id: 1, category: 1, title: "Cão Amigo", subtit: "Fundação Caramelo")
        let viewModel = DRSubscriptionEventViewViewModel(event: event)
        let vc = DRSubscriptionEventViewController(viewModel: viewModel)
        vc.navigationController?.navigationBar.prefersLargeTitles = true
        vc.navigationItem.largeTitleDisplayMode = .always
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
