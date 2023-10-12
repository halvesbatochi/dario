//
//  DREventsView.swift
//  dario
//
//  Created by Henrique Alves Batochi on 15/09/23.
//

import UIKit

/// Interface to realy event view events
protocol DREventViewDelegate: AnyObject {
    func drEventView(_ eventView: DREventView, didSelect event: DREvent)
}

///View that handles showing Events
final class DREventView: UIView {
    
    public weak var delegate: DREventViewDelegate?
    
    private var viewModel: DREventViewViewModel?
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0,
                                           left: 10,
                                           bottom: 0,
                                           right: 10)
        
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        
        collectionView.register(DRHeaderEventViewCollectionViewCell.self,
                                forCellWithReuseIdentifier: DRHeaderEventViewCollectionViewCell.cellIdentifier)
        collectionView.isHidden = true
        collectionView.alpha = 0
        collectionView.backgroundColor = .systemBackground
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        return collectionView
    }()
    
    private let eventsTableView: UITableView = {
        let tableView = UITableView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemBackground
        tableView.tableFooterView = UIView()
        tableView.register(DREventTableViewCell.self,
                           forCellReuseIdentifier: DREventTableViewCell.cellIdentifier)
        
        return tableView
    }()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews(collectionView,
                    eventsTableView)
        
        addConstraints()
        setUpCollectionView()
        setUpTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    // MARK: - Privates Methods
    
    private func setUpCollectionView() {
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
            self.collectionView.dataSource = self.viewModel
            self.collectionView.delegate = self.viewModel
            self.collectionView.isHidden = false

            UIView.animate(withDuration: 0.4) {
                self.collectionView.alpha = 1
            }
        }
    }
    
    private func setUpTableView() {
        eventsTableView.delegate = self
        eventsTableView.dataSource = self
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            collectionView.heightAnchor.constraint(equalToConstant: 210),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            
            eventsTableView.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            eventsTableView.leftAnchor.constraint(equalTo: leftAnchor),
            eventsTableView.rightAnchor.constraint(equalTo: rightAnchor),
            eventsTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    // MARK: - Public methods
    
    public func configure(with viewModel: DREventViewViewModel) {
        self.viewModel = viewModel
    }
}

// MARK: - UITableViewDelegate
extension DREventView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        eventsTableView.deselectRow(at: indexPath, animated: true)
        guard let eventModel = viewModel?.event(at: indexPath.row) else {
            return
        }
        delegate?.drEventView(self, didSelect: eventModel)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}

// MARK: - UITableViewDataSource
extension DREventView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.cellViewModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        guard let cellViewModels = viewModel?.cellViewModels else {
            fatalError()
        }
        
        guard let cell = eventsTableView.dequeueReusableCell(
            withIdentifier: DREventTableViewCell.cellIdentifier,
            for: indexPath
        ) as? DREventTableViewCell else {
            fatalError()
        }
        
        let cellViewModel = cellViewModels[indexPath.row]
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = .systemMint
        }
        cell.configure(with: cellViewModel)
        return cell
    }
}

// MARK: - UIScrollViewDelegate
extension DREventView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("Scrollando")
    }
}
