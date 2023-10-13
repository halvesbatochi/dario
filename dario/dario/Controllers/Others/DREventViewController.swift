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
    func drDidFetchInitialEvents() {
        eventView.configure(with: viewModel)
    }
}

// MARK: - DREventViewDelegate
extension DREventViewController: DREventViewDelegate {
    func drEventView(_ eventView: DREventView, didSelect event: DREvent) {
        print("Selecionou Evento!")
    }
}
