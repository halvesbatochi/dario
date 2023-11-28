//
//  EventSubscriptionViewController.swift
//  dario
//
//  Created by Henrique Alves Batochi on 29/10/23.
//

import UIKit

class DRSubscriptionEventViewController: UIViewController {
    
    
    private let viewModel: DRSubscriptionEventViewViewModel
    private let subscriptionView: DRSubscriptionEventView
    
    // MARK: - Init
    init(viewModel: DRSubscriptionEventViewViewModel) {
        self.viewModel = viewModel
        self.subscriptionView = DRSubscriptionEventView(frame: .zero, viewModel: viewModel)

        super.init(nibName: nil, bundle: nil)
        
        self.subscriptionView.delegate = self
        title = viewModel.event.ev001_vc_titulo
        
        view.backgroundColor = .systemBackground
        view.addSubview(subscriptionView)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Private methods
    private func addConstraints() {
        NSLayoutConstraint.activate([
            subscriptionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            subscriptionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            subscriptionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            subscriptionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - DRSubscriptionEventViewDelegate
extension DRSubscriptionEventViewController: DRSubscriptionEventViewDelegate {
    func notSignIn() {
        let alert = UIAlertController(title: "Atenção", message: "Usuário não está logado!", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        
        self.present(alert, animated: true)
    }
    
    func successSubscription() {
        let alert = UIAlertController(title: "Atenção", message: "Inscrição efetuada!", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        
        self.present(alert, animated: true)
    }
    
    func didFailSubscription(msg: String) {
        let alert = UIAlertController(title: "Atenção", message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        
        self.present(alert, animated: true)
    }
}
