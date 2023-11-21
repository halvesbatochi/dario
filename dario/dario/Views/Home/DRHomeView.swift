//
//  HomeView.swift
//  dario
//
//  Created by Henrique Alves Batochi on 20/08/23.
//

import UIKit

protocol DRHomeViewDelegate: AnyObject {
    func navigateEventsView(_ homeView: DRHomeView)
    func navigateInstitutionsView(_ homeView: DRHomeView)
    func navigateDonatesView(_ homeView: DRHomeView)
    func didSelectEventHeaderHome(_ homeView: DRHomeView, _ event: DREvent)
}

/// View that handles showing home elements, loader and etc.
final class DRHomeView: UIView {
    
    public weak var delegate: DRHomeViewDelegate?
    private let viewModel = DRHomeViewViewModel()
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0,
                                           left: 10,
                                           bottom: 0,
                                           right: 10)
        
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionView.isHidden = true
        collectionView.alpha = 0
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(DRHeaderHomeViewCollectionViewCell.self,
                                forCellWithReuseIdentifier: DRHeaderHomeViewCollectionViewCell.cellIdentifier)
        return collectionView
    }()
    
    private let eventsCard: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(red: 0/255,
                                         green: 155/255,
                                         blue: 223/255,
                                         alpha: 1.0).cgColor
        return view
    }()
    
    private let eventCardImage: UIImageView = {
        let imageView = UIImageView()
    
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "EventCardImage")
        
        return imageView
    }()
    
    private let eventCardLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Participe dos"
        label.textColor = .systemGray
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20,
                                 weight: .regular)
        return label
    }()
    
    private let eventCardLabelSecondary: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Eventos"
        label.textColor = UIColor(red: 0/255,
                                  green: 155/255,
                                  blue: 223/255,
                                  alpha: 1.0)
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 28,
                                 weight: .semibold)
        return label
    }()
    
    private let institutionCard: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(red: 0/255,
                                         green: 155/255,
                                         blue: 223/255,
                                         alpha: 1.0).cgColor
        return view
    }()
    
    private let institutionCardImage: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "InstitutionCardImage")
        
        return imageView
    }()
    
    private let institutionCardLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Conheça as"
        label.textColor = .systemGray
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20,
                                 weight: .regular)
        return label
    }()
    
    private let institutionCardLabelSecondary: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Instituições"
        label.textColor = UIColor(red: 0/255,
                                  green: 155/255,
                                  blue: 223/255,
                                  alpha: 1.0)
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 28,
                                 weight: .semibold)
        return label
    }()
    
    private let donateCard: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(red: 0/255,
                                         green: 155/255,
                                         blue: 223/255,
                                         alpha: 1.0).cgColor
        return view
    }()
    
    private let donateCardImage: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "DonateCardImage")
        
        return imageView
    }()
    
    private let donateCardLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Mesmo longe"
        label.textColor = .systemGray
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20,
                                 weight: .regular)
        return label
    }()
    
    private let donateCardLabelSecondary: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Contribua"
        label.textColor = UIColor(red: 0/255,
                                  green: 155/255,
                                  blue: 223/255,
                                  alpha: 1.0)
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 28,
                                 weight: .semibold)
        return label
    }()

    
    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
        viewModel.delegate = self
        viewModel.fetchEvents()
        
        addSubviews(collectionView,
                    spinner,
                    eventsCard,
                    institutionCard,
                    donateCard)
        
        eventsCard.addSubviews(eventCardImage,
                               eventCardLabel,
                               eventCardLabelSecondary)
        
        institutionCard.addSubviews(institutionCardImage,
                                    institutionCardLabel,
                                    institutionCardLabelSecondary)
        
        donateCard.addSubviews(donateCardImage,
                               donateCardLabel,
                               donateCardLabelSecondary)
        addConstraints()
        setUpCollectionView()
        setUpCards()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    // MARK: - Private methods
    private func setUpCards() {
        let gestureEvents = UITapGestureRecognizer(target: self,
                                                   action: #selector(self.navigateEventsView))
        self.eventsCard.addGestureRecognizer(gestureEvents)
        
        let gestureInstitutions = UITapGestureRecognizer(target: self,
                                                         action: #selector(self.navigateInstitutionsView))
        self.institutionCard.addGestureRecognizer(gestureInstitutions)
        
        let gestureDonates = UITapGestureRecognizer(target: self,
                                                    action: #selector(self.navigateDonatesView))
        self.donateCard.addGestureRecognizer(gestureDonates)
    }
    
    @objc private func navigateEventsView() {
        delegate?.navigateEventsView(self)
    }
    
    @objc private func navigateInstitutionsView() {
        delegate?.navigateInstitutionsView(self)
    }
    
    @objc private func navigateDonatesView() {
        delegate?.navigateDonatesView(self)
    }
    
    private func setUpCollectionView() {
        collectionView.dataSource = viewModel
        collectionView.delegate = viewModel
        
        DispatchQueue.main.asyncAfter(deadline: .now()+1, execute: {
            self.collectionView.isHidden = false
            UIView.animate(withDuration: 0.4) {
                self.collectionView.alpha = 1
            }
        })
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            collectionView.heightAnchor.constraint(equalToConstant: 210),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            
            eventsCard.heightAnchor.constraint(equalToConstant: 110),
            eventsCard.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20),
            eventsCard.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            eventsCard.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
            
            eventCardImage.heightAnchor.constraint(equalToConstant: 80),
            eventCardImage.widthAnchor.constraint(equalToConstant: 80),
            eventCardImage.topAnchor.constraint(equalTo: eventsCard.topAnchor, constant: 15),
            eventCardImage.leftAnchor.constraint(equalTo: eventsCard.leftAnchor, constant: 30),
            
            eventCardLabel.topAnchor.constraint(equalTo: eventsCard.topAnchor, constant: 25),
            eventCardLabel.leftAnchor.constraint(equalTo: eventCardImage.rightAnchor, constant: 10),
            eventCardLabel.rightAnchor.constraint(equalTo: eventsCard.rightAnchor, constant: -15),
            
            eventCardLabelSecondary.topAnchor.constraint(equalTo: eventCardLabel.bottomAnchor, constant: 0),
            eventCardLabelSecondary.leftAnchor.constraint(equalTo: eventCardLabel.leftAnchor),
            eventCardLabelSecondary.rightAnchor.constraint(equalTo: eventCardLabel.rightAnchor),
            
            institutionCard.heightAnchor.constraint(equalToConstant: 110),
            institutionCard.topAnchor.constraint(equalTo: eventsCard.bottomAnchor, constant: 20),
            institutionCard.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            institutionCard.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
            
            institutionCardImage.heightAnchor.constraint(equalToConstant: 80),
            institutionCardImage.widthAnchor.constraint(equalToConstant: 120),
            institutionCardImage.topAnchor.constraint(equalTo: institutionCard.topAnchor, constant: 15),
            institutionCardImage.rightAnchor.constraint(equalTo: institutionCard.rightAnchor, constant: -30),
            
            institutionCardLabel.topAnchor.constraint(equalTo: institutionCard.topAnchor, constant: 25),
            institutionCardLabel.leftAnchor.constraint(equalTo: institutionCard.leftAnchor, constant: 15),
            institutionCardLabel.rightAnchor.constraint(equalTo: institutionCardImage.leftAnchor, constant: 15),
            
            institutionCardLabelSecondary.topAnchor.constraint(equalTo: institutionCardLabel.bottomAnchor, constant: 0),
            institutionCardLabelSecondary.leftAnchor.constraint(equalTo: institutionCardLabel.leftAnchor),
            institutionCardLabelSecondary.rightAnchor.constraint(equalTo: institutionCardLabel.rightAnchor),
            
            donateCard.heightAnchor.constraint(equalToConstant: 110),
            donateCard.topAnchor.constraint(equalTo: institutionCard.bottomAnchor, constant: 20),
            donateCard.leftAnchor.constraint(equalTo: leftAnchor, constant: 15),
            donateCard.rightAnchor.constraint(equalTo: rightAnchor, constant: -15),
            
            donateCardImage.heightAnchor.constraint(equalToConstant: 80),
            donateCardImage.widthAnchor.constraint(equalToConstant: 120),
            donateCardImage.topAnchor.constraint(equalTo: donateCard.topAnchor, constant: 15),
            donateCardImage.leftAnchor.constraint(equalTo: donateCard.leftAnchor, constant:30),
            
            donateCardLabel.topAnchor.constraint(equalTo: donateCard.topAnchor, constant: 25),
            donateCardLabel.leftAnchor.constraint(equalTo: donateCardImage.rightAnchor, constant: 10),
            donateCardLabel.rightAnchor.constraint(equalTo: donateCard.rightAnchor, constant: -15),
            
            donateCardLabelSecondary.topAnchor.constraint(equalTo: donateCardLabel.bottomAnchor, constant: 0),
            donateCardLabelSecondary.leftAnchor.constraint(equalTo: donateCardLabel.leftAnchor),
            donateCardLabelSecondary.rightAnchor.constraint(equalTo: donateCardLabel.rightAnchor),
        ])
    }
}

// MARK: - DRHomeViewViewModelDelegate
extension DRHomeView: DRHomeViewViewModelDelegate {
    func didFetchInitialEvents() {
        collectionView.reloadData()
    }
    
    func didSelectEventHeaderHome(_ event: DREvent) {
        self.delegate?.didSelectEventHeaderHome(self, event)
    }
}
