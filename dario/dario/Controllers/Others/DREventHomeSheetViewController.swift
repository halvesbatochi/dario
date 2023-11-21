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
    
    private let eventSheetView: DREventHomeSheetView
    private let eventSheetViewViewModel: DREventHomeSheetViewViewModel
    var delegate: drEventHomeSheetViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(eventSheetView)
        eventSheetView.delegate = self
        setUpView()
    }
    
    init(event: DREvent) {
        self.eventSheetViewViewModel = DREventHomeSheetViewViewModel(event: event)
        self.eventSheetView = DREventHomeSheetView(frame: .zero, viewModel: self.eventSheetViewViewModel)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
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
