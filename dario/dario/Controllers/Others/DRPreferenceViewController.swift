//
//  DRCalibrationAlgorithmViewController.swift
//  dario
//
//  Created by Henrique Alves Batochi on 08/10/23.
//

import UIKit

final class DRPreferenceViewController: UIViewController {
    
    private let preferencesView = DRPreferenceView()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Preferências"
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.systemGray]
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.systemGray]
        
        view.addSubview(preferencesView)
        
        setUpView()
    }
    
    // MARK: - Private Methods
    
    private func setUpView() {
        NSLayoutConstraint.activate([
            preferencesView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            preferencesView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            preferencesView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            preferencesView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
