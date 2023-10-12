//
//  DREventsTableViewCell.swift
//  dario
//
//  Created by Henrique Alves Batochi on 10/10/23.
//

import UIKit

final class DREventTableViewCell: UITableViewCell {
    static let cellIdentifier = "DREventTableViewCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20,
                                 weight: .medium)
        
        return label
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        
        self.accessoryType = .disclosureIndicator
        
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    // MARK: - Private methods
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10)
        ])
    }
    
    override func prepareForReuse() {
        titleLabel.text = nil
    }
    
    // MARK: - Public methods
    
    public func configure(with viewModel: DREventTableViewCellViewModel) {
        titleLabel.text = viewModel.title
    }
}
