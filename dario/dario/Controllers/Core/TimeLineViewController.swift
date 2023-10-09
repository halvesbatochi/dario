//
//  HistoryViewController.swift
//  dario
//
//  Created by Henrique Alves Batochi on 19/04/23.
//

import UIKit

/// Controller to show TimeLine
final class TimeLineViewController: UIViewController {
    
    private let calibrationView = DRCalibrationView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Calibração"
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.systemGray]
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.systemGray]
        
        view.addSubview(calibrationView)
        
        setUpView()
    }
    
    // MARK: - Private Methods
    
    private func setUpView() {
        NSLayoutConstraint.activate([
            calibrationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            calibrationView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            calibrationView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            calibrationView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
