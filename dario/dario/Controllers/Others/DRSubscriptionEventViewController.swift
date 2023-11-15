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
        
        title = "Show de Doações"
        
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
