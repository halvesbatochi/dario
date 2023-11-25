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
    
    func didSelectEventHeaderHome(_ homeView: DRHomeView, _ event: DREvent) {
        let vc = DREventHomeSheetViewController(event: event)
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
        let event = DREvent(ad001_vc_nfanta: "Teste", ev001_it_id: 1, ev001_it_inst: 1, ev001_vc_end: "Ola", ev001_it_num: "1", ev001_vc_compl: "Apto91", ev001_vc_bairro: "Centro", ev001_vc_cidade: "Curitiba", ev001_vc_estado: "PR", ev001_vc_pais: "BR", ev001_vc_titulo: "Show de Doações", ev001_dt_inic: "20231111", ev001_hr_inic: "0900", ev001_dt_fim: "20231111", ev001_hr_fim: "1200", ev001_it_npart: "100", ev001_vc_fmsg1: "Ola", ev001_vc_fmsg2: "Ola", ev001_vc_fmsg3: "Ola", ev001_vc_fmsg4: "Ola", ev001_vc_fmsg5: "Ola", ev001_vc_pmsg1: "Ola", ev001_vc_pmsg2: "Ola", ev001_vc_img1: "Ola", ev001_vc_img2: "Ola", ev001_it_atv1: 1, ev001_it_atv2: 2, ev001_it_atv3: 3, ev001_it_situac: "1", ev001_dt_ultatu: "2023", ev001_dt_inclus: "2023")
        let viewModel = DRSubscriptionEventViewViewModel(event: event)
        let vc = DRSubscriptionEventViewController(viewModel: viewModel)
        vc.navigationController?.navigationBar.prefersLargeTitles = true
        vc.navigationItem.largeTitleDisplayMode = .always
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
