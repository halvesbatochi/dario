//
//  DRTimeLineView.swift
//  dario
//
//  Created by Henrique Alves Batochi on 27/11/23.
//

import UIKit

class DRTimeLineView: UIView {
    private var viewModel: DRTimeLineViewViewModel?

    private let calibrationHeaderView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        
        return view
    }()
    
    private let calibrationHeaderImage: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "PreferenceHeaderImage")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private let calibrationHeaderLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let attrs1 = [NSAttributedString.Key.foregroundColor : UIColor.secondaryLabel]
        let attrs2 = [NSAttributedString.Key.foregroundColor : UIColor(red: 48/255,
                                                                       green: 176/255,
                                                                       blue: 199/255,
                                                                       alpha: 1.0)]
        
        let attributedString1 = NSMutableAttributedString(string: "Veja os eventos inscritos!\n",
                                                          attributes: attrs2)
        let attributedString2 = NSMutableAttributedString(string: "Acompanhe os eventos inscritos",
                                                          attributes: attrs1)
        
        attributedString1.append(attributedString2)
        
        label.attributedText = attributedString1
        label.numberOfLines = 0
        
        return label
    }()
    
    public let eventsTableView: UITableView = {
        let tableView = UITableView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemBackground
        tableView.register(DREventTableViewCell.self,
                           forCellReuseIdentifier: DREventTableViewCell.cellIdentifier)
        
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .secondarySystemBackground
        
        addSubviews(calibrationHeaderView,
                    eventsTableView)
        
        calibrationHeaderView.addSubviews(calibrationHeaderImage,
                                          calibrationHeaderLabel)
        
        addConstraints()
        setUpTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func setUpTableView() {
        eventsTableView.delegate = self
        eventsTableView.dataSource = self
    }
    
    // MARK: - Private methods
    private func addConstraints() {
        NSLayoutConstraint.activate([
            calibrationHeaderView.heightAnchor.constraint(equalToConstant: 150),
            calibrationHeaderView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            calibrationHeaderView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            calibrationHeaderView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            
            calibrationHeaderLabel.topAnchor.constraint(equalTo: calibrationHeaderView.topAnchor, constant: 10),
            calibrationHeaderLabel.leftAnchor.constraint(equalTo: calibrationHeaderView.leftAnchor, constant: 15),
            calibrationHeaderLabel.rightAnchor.constraint(equalTo: calibrationHeaderImage.leftAnchor, constant: -5),
            
            calibrationHeaderImage.heightAnchor.constraint(equalToConstant: 130),
            calibrationHeaderImage.widthAnchor.constraint(equalToConstant: 130),
            calibrationHeaderImage.topAnchor.constraint(equalTo: calibrationHeaderView.topAnchor, constant: 5),
            calibrationHeaderImage.rightAnchor.constraint(equalTo: calibrationHeaderView.rightAnchor, constant: -10),
            
            eventsTableView.topAnchor.constraint(equalTo: calibrationHeaderView.bottomAnchor),
            eventsTableView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            eventsTableView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            eventsTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    // MARK: - Public methods
    
    public func configure(with viewModel: DRTimeLineViewViewModel) {
        self.viewModel = viewModel
        self.eventsTableView.reloadData()
    }

}

// MARK: - UITableViewDelegate
extension DRTimeLineView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

// MARK: - UITableViewDataSource
extension DRTimeLineView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.cellViewModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: DREventTableViewCell.cellIdentifier,
            for: indexPath
        ) as? DREventTableViewCell else {
            fatalError()
        }
        
        guard let model = viewModel?.cellViewModels[indexPath.row] else {
            fatalError()
        }
        
        cell.accessoryType = .none
        cell.configure(with: model)

        return cell
    }
}
