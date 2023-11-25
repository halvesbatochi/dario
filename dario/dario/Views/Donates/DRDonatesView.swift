//
//  DRDonatesView.swift
//  dario
//
//  Created by Henrique Alves Batochi on 15/09/23.
//

import UIKit

///Interface to realy donate view events
protocol DRDonateViewDelegate: AnyObject {
    func drDonateView(_ donateView: DRDonateView, didSelect donate: DRDonate)
}

/// View to relay donate view events
final class DRDonateView: UIView {
    
    public weak var delegate: DRDonateViewDelegate?
    
    private var viewModel: DRDonateViewViewModel?
    
    private let donateHeaderView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        
        return view
    }()
    
    private let donateHeaderImage: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "DonatesHeaderImage")
        
        return imageView
    }()
    
    private let donateHeaderLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let attrs1 = [NSAttributedString.Key.foregroundColor : UIColor.secondaryLabel]
        let attrs2 = [NSAttributedString.Key.foregroundColor : UIColor(red: 249/255,
                                                                       green: 201/255,
                                                                       blue: 116/255,
                                                                       alpha: 1.0)]
        
        let attributedString1 = NSMutableAttributedString(string: "Na ",
                                                          attributes: attrs1)
        let attributedString2 = NSMutableAttributedString(string: "ausência de tempo\n",
                                                          attributes: attrs2)
        let attributedString3 = NSMutableAttributedString(string: "outras formas de ajudar\nsão possíveis!\nNão existe pouco quando\nse trata de ",
                                                          attributes: attrs1)
        let attributedString4 = NSMutableAttributedString(string: "solidariedade",
                                                          attributes: attrs2)
        
        attributedString1.append(attributedString2)
        attributedString1.append(attributedString3)
        attributedString1.append(attributedString4)
        
        label.attributedText = attributedString1
        label.numberOfLines = 0
        
        return label
    }()
    
    public let donateTableView: UITableView = {
        let tableView = UITableView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemBackground
        tableView.register(DRDonateTableViewCell.self,
                           forCellReuseIdentifier: DRDonateTableViewCell.cellIdentifier)
        
        return tableView
    }()
    
    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemMint
        addSubviews(donateHeaderView,
                   donateTableView)
        
        donateHeaderView.addSubviews(donateHeaderImage,
                                      donateHeaderLabel)
        addConstraints()
        setUpTable()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    // MARK: - Private Methods
    
    func setUpTable() {
        donateTableView.delegate = self
        donateTableView.dataSource = self
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            donateHeaderView.heightAnchor.constraint(equalToConstant: 150),
            donateHeaderView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            donateHeaderView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            donateHeaderView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            
            donateHeaderImage.heightAnchor.constraint(equalToConstant: 120),
            donateHeaderImage.widthAnchor.constraint(equalToConstant: 150),
            donateHeaderImage.topAnchor.constraint(equalTo: donateHeaderView.topAnchor, constant: 15),
            donateHeaderImage.rightAnchor.constraint(equalTo: donateHeaderView.rightAnchor, constant: -10),
            
            donateHeaderLabel.topAnchor.constraint(equalTo: donateHeaderView.topAnchor, constant: 10),
            donateHeaderLabel.leftAnchor.constraint(equalTo: donateHeaderView.leftAnchor, constant: 15),
            donateHeaderLabel.rightAnchor.constraint(equalTo: donateHeaderImage.leftAnchor, constant: -5),
            
            donateTableView.topAnchor.constraint(equalTo: donateHeaderView.bottomAnchor),
            donateTableView.leftAnchor.constraint(equalTo: leftAnchor),
            donateTableView.rightAnchor.constraint(equalTo: rightAnchor),
            donateTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    // MARK: - Public methods
    public func configure(with viewModel: DRDonateViewViewModel) {
        self.viewModel = viewModel
    }
}

// MARK: - UITableViewDelegate
extension DRDonateView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let donateModel = viewModel?.donate(at: indexPath.row) else {
            return
        }
        
        delegate?.drDonateView(self, didSelect: donateModel)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

// MARK: - UITableViewDataSource
extension DRDonateView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.cellViewModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: DRDonateTableViewCell.cellIdentifier,
            for: indexPath
        ) as? DRDonateTableViewCell else {
            fatalError()
        }
        guard let viewModel = viewModel?.cellViewModels[indexPath.row] else {
            fatalError()
        }
        
        cell.configure(with: viewModel)
        return cell
    }
}

// MARK: - UIScrollViewDelegate
extension DRDonateView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("Scroolando - Doações")
    }
}
