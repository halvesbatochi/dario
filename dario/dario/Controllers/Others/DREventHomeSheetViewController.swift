//
//  DREventHomeSheetViewController.swift
//  dario
//
//  Created by Henrique Alves Batochi on 16/09/23.
//

import UIKit

class DREventHomeSheetViewController: UIViewController {
    
    private let eventSheetView = DREventHomeSheetView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(eventSheetView)
        
        setUpView()
    }
    
    // MARK: - Private Methods

    private func setUpView() {
        NSLayoutConstraint.activate([
            eventSheetView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            eventSheetView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            eventSheetView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            eventSheetView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
