//
//  DRInstitutionView.swift
//  dario
//
//  Created by Henrique Alves Batochi on 12/09/23.
//

import UIKit

/// Interface to realy institution view events
protocol DRInstitutionViewDelegate: AnyObject {
    func drInstitutionView(_ institutionView: DRInstitutionView, didSelect institution: DRInstitution)
}

/// View to relay institution view events
final class DRInstitutionView: UIView {
    
    public weak var delegate: DRInstitutionViewDelegate?
    
    private var viewModel: DRInstitutionViewViewModel?
    
    private let institutionHeader: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        
        return view
    }()
    
    private let institutionHeaderImage: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "InstitutionHeaderImage")
        
        return imageView
    }()
    
    private let institutionHeaderLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let attrs1 = [NSAttributedString.Key.foregroundColor : UIColor.secondaryLabel]
        let attrs2 = [NSAttributedString.Key.foregroundColor : UIColor(red: 39/255,
                                                                       green: 222/255,
                                                                       blue: 191/255,
                                                                       alpha: 1.0)]
        
        let attributedString1 = NSMutableAttributedString(string: "São tantos caminhos,\ntantas ",
                                                          attributes: attrs1)
        let attributedString2 = NSMutableAttributedString(string: "possibilidades",
                                                          attributes: attrs2)
        let attributedString3 = NSMutableAttributedString(string: " para\nexpressar sua generosidade\nEncontre o ",
                                                          attributes: attrs1)
        let attributedString4 = NSMutableAttributedString(string: "o seu caminho\n",
                                                          attributes: attrs2)
        let attributedString5 = NSMutableAttributedString(string: "para escrever a história\nda ",
                                                          attributes: attrs1)
        let attributedString6 = NSMutableAttributedString(string: "sua solidariedade",
                                                          attributes: attrs2)
        attributedString1.append(attributedString2)
        attributedString1.append(attributedString3)
        attributedString1.append(attributedString4)
        attributedString1.append(attributedString5)
        attributedString1.append(attributedString6)
        
        label.attributedText = attributedString1
        label.numberOfLines = 0
        
        return label
    }()
    
    private let institutionsTableView: UITableView = {
        let tableView = UITableView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .systemBackground
        tableView.register(DRInstitutionTableViewCell.self,
                           forCellReuseIdentifier: DRInstitutionTableViewCell.cellIdentifier)
        
        return tableView
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
        addSubviews(institutionHeader,
                    institutionsTableView)
        
        institutionHeader.addSubviews(institutionHeaderImage,
                                      institutionHeaderLabel)
        addConstraints()
        setUpTable()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    // MARK: - Private Methods
    private func setUpTable() {
        institutionsTableView.delegate = self
        institutionsTableView.dataSource = self
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            institutionHeader.heightAnchor.constraint(equalToConstant: 150),
            institutionHeader.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            institutionHeader.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            institutionHeader.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            
            institutionHeaderImage.heightAnchor.constraint(equalToConstant: 120),
            institutionHeaderImage.widthAnchor.constraint(equalToConstant: 120),
            institutionHeaderImage.topAnchor.constraint(equalTo: institutionHeader.topAnchor, constant: 15),
            institutionHeaderImage.leftAnchor.constraint(equalTo: institutionHeader.leftAnchor, constant: 30),
            
            institutionHeaderLabel.topAnchor.constraint(equalTo: institutionHeader.topAnchor, constant: 10),
            institutionHeaderLabel.leftAnchor.constraint(equalTo: institutionHeaderImage.rightAnchor, constant: 15),
            institutionHeaderLabel.rightAnchor.constraint(equalTo: institutionHeader.rightAnchor, constant: -5),
            
            institutionsTableView.topAnchor.constraint(equalTo: institutionHeader.bottomAnchor),
            institutionsTableView.leftAnchor.constraint(equalTo: leftAnchor),
            institutionsTableView.rightAnchor.constraint(equalTo: rightAnchor),
            institutionsTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    // MARK: - Public methods
    
    public func configure(with viewModel: DRInstitutionViewViewModel) {
        self.viewModel = viewModel
    }
}

// MARK: - UITableViewDelegate
extension DRInstitutionView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let institutionModel = viewModel?.institution(at: indexPath.row) else {
            return
        }
        delegate?.drInstitutionView(self, didSelect: institutionModel)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

// MARK: - UITableViewDataSource
extension DRInstitutionView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
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
        label.text = "Crianças"
        
        view.addSubview(label)
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: DRInstitutionTableViewCell.cellIdentifier,
            for: indexPath
        ) as? DRInstitutionTableViewCell else {
            fatalError()
        }
        
        guard let cellViewModel = viewModel?.loadCellModel(indexPath) else {
            fatalError()
        }
        
        cell.configure(with: cellViewModel)
        return cell
    }
}

// MARK: - UIScrollViewDelegate
extension DRInstitutionView: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("Scrollando - Instituições")
    }
}
