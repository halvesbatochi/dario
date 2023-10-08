//
//  DRDonatesView.swift
//  dario
//
//  Created by Henrique Alves Batochi on 15/09/23.
//

import UIKit

final class DRDonatesView: UIView {
    
    private let donatesHeaderView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemBackground
        
        return view
    }()
    
    private let donatesHeaderImage: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "DonatesHeaderImage")
        
        return imageView
    }()
    
    private let donatesHeaderLabel: UILabel = {
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
    
    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemMint
        addSubview(donatesHeaderView)
        
        donatesHeaderView.addSubviews(donatesHeaderImage,
                                      donatesHeaderLabel)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    // MARK: - Private Methods
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            donatesHeaderView.heightAnchor.constraint(equalToConstant: 150),
            donatesHeaderView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            donatesHeaderView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor),
            donatesHeaderView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor),
            
            donatesHeaderImage.heightAnchor.constraint(equalToConstant: 120),
            donatesHeaderImage.widthAnchor.constraint(equalToConstant: 150),
            donatesHeaderImage.topAnchor.constraint(equalTo: donatesHeaderView.topAnchor, constant: 15),
            donatesHeaderImage.rightAnchor.constraint(equalTo: donatesHeaderView.rightAnchor, constant: -10),
            
            donatesHeaderLabel.topAnchor.constraint(equalTo: donatesHeaderView.topAnchor, constant: 10),
            donatesHeaderLabel.leftAnchor.constraint(equalTo: donatesHeaderView.leftAnchor, constant: 15),
            donatesHeaderLabel.rightAnchor.constraint(equalTo: donatesHeaderImage.leftAnchor, constant: -5)
        ])
    }
}
