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
    
    public let eventsTableView: UITableView = {
        let tableView = UITableView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemBackground
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
        
        refreshDataGestureConfig()
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
        self.eventsTableView.reloadData()
    }
    
    private func refreshDataGestureConfig() {
        let gesture = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe))
        gesture.direction = .down
        
        addGestureRecognizer(gesture)
    }
    
    @objc
    private func didSwipe() {
        viewModel?.fetchEventsHeader()
    }
}

// MARK: - UITableViewDelegate
extension DREventView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let eventModel = viewModel?.event(at: indexPath) else {
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
        guard let sections = viewModel?.countSections() else {
            return 0
        }
        return sections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let rowsInSection = viewModel?.countRowsInSection(section) else {
            return 0
        }
            
        return rowsInSection
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, 
                                        y: 0,
                                        width: tableView.frame.width,
                                        height: 40))
        
        view.backgroundColor = .systemBackground.withAlphaComponent(0.8)
             
        let label = UILabel(frame: CGRect(x: 15,
                                          y: 0,
                                          width: view.frame.width - 15,
                                          height: 20))
        
        label.font = UIFont.systemFont(ofSize: 20,
                                       weight: .medium)
        label.textColor = .secondaryLabel
        label.text = viewModel?.fetchSectionName(section)
            
        view.addSubview(label)
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: DREventTableViewCell.cellIdentifier,
            for: indexPath
        ) as? DREventTableViewCell else {
            fatalError()
        }
        
        guard let model = viewModel?.loadCellModel(indexPath) else {
            fatalError()
        }
            
        cell.configure(with: model)

        return cell
    }
}

// MARK: - UIScrollViewDelegate
extension DREventView: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("Scrollando")
    }
}

