//
//  DREventsViewController.swift
//  dario
//
//  Created by Henrique Alves Batochi on 15/09/23.
//

import UIKit

class DREventViewController: UIViewController {
    
    private let eventView = DREventView()
    
    private let viewModel = DREventViewViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        preventLargeTitleCollapsing()

        title = "Eventos"
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.systemGray]
        
        view.addSubview(eventView)
        
        addConstraints()
        viewModel.delegate = self
        eventView.delegate = self
        viewModel.fetchEvents()
    }
    
    // MARK: - Private Methods
    
    private func preventLargeTitleCollapsing() {
        let dummyView = UIView()
        view.addSubview(dummyView)
        view.sendSubviewToBack(dummyView)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            eventView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            eventView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            eventView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            eventView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

// MARK: - DREventViewViewModelDelegate
extension DREventViewController: DREventViewViewModelDelegate {
    func drDidSelectEventHeader(_ index: Int) {
        let event = DREvent(ev001_it_id: 1, ev001_it_inst: 1, ev001_vc_end: "Ola", ev001_it_num: "1", ev001_vc_compl: "Apto91", ev001_vc_bairro: "Centro", ev001_vc_cidade: "Curitiba", ev001_vc_estado: "PR", ev001_vc_pais: "BR", ev001_vc_titulo: "Show de Doações", ev001_dt_inic: "20231111", ev001_hr_inic: "0900", ev001_dt_fim: "20231111", ev001_hr_fim: "1200", ev001_it_npart: "100", ev001_vc_fmsg1: "Ola", ev001_vc_fmsg2: "Ola", ev001_vc_fmsg3: "Ola", ev001_vc_fmsg4: "Ola", ev001_vc_fmsg5: "Ola", ev001_vc_pmsg1: "Ola", ev001_vc_pmsg2: "Ola", ev001_vc_img1: "Ola", ev001_vc_img2: "Ola", ev001_it_atv1: 1, ev001_it_atv2: 2, ev001_it_atv3: 3, ev001_it_situac: "1", ev001_dt_ultatu: "2023", ev001_dt_inclus: "2023")
        let viewModel = DRSubscriptionEventViewViewModel(event: event)
        let vc = DRSubscriptionEventViewController(viewModel: viewModel)
        vc.navigationController?.navigationBar.prefersLargeTitles = true
        vc.navigationItem.largeTitleDisplayMode = .always
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func drDidFetchInitialEvents() {
        eventView.configure(with: viewModel)
    }
}

// MARK: - DREventViewDelegate
extension DREventViewController: DREventViewDelegate {
    func drEventView(_ eventView: DREventView, didSelect event: DREvent) {
        let viewModel = DRSubscriptionEventViewViewModel(event: event)
        let vc = DRSubscriptionEventViewController(viewModel: viewModel)
        vc.navigationController?.navigationBar.prefersLargeTitles = true
        vc.navigationItem.largeTitleDisplayMode = .always
        navigationController?.pushViewController(vc, animated: true)
    }
}
