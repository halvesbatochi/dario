//
//  HistoryViewController.swift
//  dario
//
//  Created by Henrique Alves Batochi on 19/04/23.
//

import UIKit

/// Controller to show TimeLine
final class TimeLineViewController: UIViewController {
    
    private let timeLineView = DRTimeLineView()
    private let viewModel = DRTimeLineViewViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Histórico"
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.systemGray]
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.systemGray]
        
        view.addSubview(timeLineView)
        timeLineView.viewModel = viewModel
        viewModel.delegate = self
        
        setUpView()
        
        guard let id = UserDefaults.standard.string(forKey: "idUser") else {
            return
        }
        
        if let idInt = Int(id) {
            viewModel.fetchEventsTable(id: idInt)
        }
    }
    
    // MARK: - Private Methods
    
    private func setUpView() {
        NSLayoutConstraint.activate([
            timeLineView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            timeLineView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            timeLineView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            timeLineView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}


// MARK: - DREventViewViewModelDelegate
extension TimeLineViewController: DRTimeLineViewViewModelDelegate {
    func drDidFetchInitialEvents() {
        timeLineView.configure(with: viewModel)
    }
}
