//
//  DRDetailsDonateViewController.swift
//  dario
//
//  Created by Henrique Alves Batochi on 22/10/23.
//

import UIKit

final class DRDetailsDonateViewController: UIViewController {
    
    private let detailsDonateView: DRDetailsDonateView
    private let viewModel: DRDetailsDonateViewViewModel
    
    // MARK: - Init
    init(viewModel: DRDetailsDonateViewViewModel) {
        self.viewModel = viewModel
        self.detailsDonateView = DRDetailsDonateView(frame: .zero, viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Detalhes"
        view.backgroundColor = .systemBackground
        view.addSubview(detailsDonateView)
        addConstraints()
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
}
