//
//  DREventHomeSheetViewController.swift
//  dario
//
//  Created by Henrique Alves Batochi on 16/09/23.
//

import UIKit

protocol drEventHomeSheetViewDelegate {
    func navigateToSubscription()
}

final class DREventHomeSheetViewController: UIViewController {
    
    private let eventSheetView = DREventHomeSheetView()
    var delegate: drEventHomeSheetViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(eventSheetView)
        eventSheetView.delegate = self
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

// MARK: - DREventHomeSheetViewDelegate
extension DREventHomeSheetViewController: DREventHomeSheetViewDelegate {
    func clickedParticipationButton(_ sender: UIButton) {
        dismiss(animated: true)
        delegate?.navigateToSubscription()
    }
}
