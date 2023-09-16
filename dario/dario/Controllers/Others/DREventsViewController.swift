//
//  DREventsViewController.swift
//  dario
//
//  Created by Henrique Alves Batochi on 15/09/23.
//

import UIKit

class DREventsViewController: UIViewController {
    
    private let eventsView = DREventsView()

    override func viewDidLoad() {
        super.viewDidLoad()
        preventLargeTitleCollapsing()

        title = "Eventos"
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.systemGray]
        
        view.addSubview(eventsView)
        
        setUpView()
    }
    
    // MARK: - Private Methods
    
    private func preventLargeTitleCollapsing() {
        let dummyView = UIView()
        view.addSubview(dummyView)
        view.sendSubviewToBack(dummyView)
    }
    
    private func setUpView() {
        NSLayoutConstraint.activate([
            eventsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            eventsView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            eventsView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            eventsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
