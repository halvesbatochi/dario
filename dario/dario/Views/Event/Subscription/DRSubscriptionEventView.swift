//
//  EventSubscriptionView.swift
//  dario
//
//  Created by Henrique Alves Batochi on 29/10/23.
//

import UIKit

protocol DRSubscriptionEventViewDelegate: AnyObject {
    func didFailSubscription(msg: String)
    func notSignIn()
    func successSubscription()
}

final class DRSubscriptionEventView: UIView {
    
    public weak var delegate: DRSubscriptionEventViewDelegate?
    
    private let viewModel: DRSubscriptionEventViewViewModel
    
    private let eventInstitutionLogoView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 30
        imageView.contentMode = .scaleToFill
        
        return imageView
    }()
    
    private let eventInstitutionNameLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    private let eventCalendarIcone: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "calendar")
        imageView.tintColor = .secondaryLabel
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private let eventDateLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    private let eventClockIcone: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "clock")
        imageView.tintColor = .secondaryLabel
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private let eventHourLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    private let eventMapClipIcone: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "mappin.circle")
        imageView.tintColor = .secondaryLabel
        imageView.isHidden = true
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private let eventDistanceLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "900m"
        label.isHidden = true
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    private let eventHandsView: UIView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Hands")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let eventFirstLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let attrs1 = [NSAttributedString.Key.foregroundColor : UIColor.secondaryLabel]
        let attrs2 = [NSAttributedString.Key.foregroundColor : UIColor(red: 48/255,
                                                                       green: 176/255,
                                                                       blue: 188/255,
                                                                       alpha: 1.0)]
        
        let attributedString1 = NSMutableAttributedString(string: "Escolha sua área de interesse em ajudar e venha construir a diferença em ",
                                                          attributes: attrs1)
        let attributedString2 = NSMutableAttributedString(string: "um mundo mais solidário",
                                                          attributes: attrs2)
        let attributedString3 = NSMutableAttributedString(string: ". Juntando nossas diferenças em prol de algo em comum ",
                                                          attributes: attrs1)
        let attributedString4 = NSMutableAttributedString(string: "construíremos um mundo melhor",
                                                          attributes: attrs2)
        let attributedString5 = NSMutableAttributedString(string: ".",
                                                          attributes: attrs1)
        
        attributedString1.append(attributedString2)
        attributedString1.append(attributedString3)
        attributedString1.append(attributedString4)
        attributedString1.append(attributedString5)
        
        label.attributedText = attributedString1
        label.numberOfLines = 0
        
        return label
    }()
    
    private let optionsControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl()
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.backgroundColor = .systemBackground

        return segmentedControl
    }()
    
    private let eventSecondLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let attrs1 = [NSAttributedString.Key.foregroundColor : UIColor.secondaryLabel]
        let attrs2 = [NSAttributedString.Key.foregroundColor : UIColor(red: 48/255,
                                                                       green: 176/255,
                                                                       blue: 188/255,
                                                                       alpha: 1.0)]
        
        let attributedString1 = NSMutableAttributedString(string: "Sua ajuda fará a diferença e construirá um momento único. Você poderá ",
                                                          attributes: attrs1)
        let attributedString2 = NSMutableAttributedString(string: "expandir suas amizades",
                                                          attributes: attrs2)
        let attributedString3 = NSMutableAttributedString(string: ", desenvolver atividades sociais e solidárias e construir ",
                                                          attributes: attrs1)
        let attributedString4 = NSMutableAttributedString(string: "um mundo melhor",
                                                          attributes: attrs2)
        let attributedString5 = NSMutableAttributedString(string: "!",
                                                          attributes: attrs1)
        
        attributedString1.append(attributedString2)
        attributedString1.append(attributedString3)
        attributedString1.append(attributedString4)
        attributedString1.append(attributedString5)
        
        label.attributedText = attributedString1
        label.numberOfLines = 0
        
        return label
    }()
    
    private let eventFriendsView: UIView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "EventSubscription")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private lazy var subscriptionButton: UIButton = {
        let btn = UIButton()
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Participar", for: .normal)
        btn.backgroundColor = UIColor(named: "DRPrimaryColor")
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 10.0
        btn.addTarget(self, action: #selector(btnTapped), for: .touchUpInside)
        
        return btn
    }()
    
    // MARK: - Init
    init(frame: CGRect, viewModel: DRSubscriptionEventViewViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
        
        viewModel.delegate = self
        
        addSubviews(eventInstitutionLogoView,
                    eventInstitutionNameLabel,
                    eventCalendarIcone,
                    eventDateLabel,
                    eventClockIcone,
                    eventHourLabel,
                    eventMapClipIcone,
                    eventDistanceLabel,
                    eventHandsView,
                    eventFirstLabel,
                    optionsControl,
                    eventSecondLabel,
                    eventFriendsView,
                    subscriptionButton)
        addConstraints()
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    // MARK: - Init
    @objc private func btnTapped() {
        viewModel.subscription(optionsControl.selectedSegmentIndex)
    }
    
    // MARK: - Private methods
    private func configure() {
        viewModel.fetchImage { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.eventInstitutionLogoView.image = image
                }
            case .failure(let error):
                print(String(describing: error))
                break
            }
        }
        
        eventInstitutionNameLabel.text = viewModel.event.ad001_vc_nfanta
        eventDateLabel.text = viewModel.dateEvent
        eventHourLabel.text = viewModel.hourEvent
        
        if let activity1 = viewModel.event.ev001_it_atv1, let desc1 = viewModel.event.ev001_vc_atv1  {
            optionsControl.insertSegment(withTitle: desc1, at: activity1, animated: true)
        }
        if let activity2 = viewModel.event.ev001_it_atv2, let desc2 = viewModel.event.ev001_vc_atv2  {
            optionsControl.insertSegment(withTitle: desc2, at: activity2, animated: true)
        }
        if let activity3 = viewModel.event.ev001_it_atv3, let desc3 = viewModel.event.ev001_vc_atv3  {
            optionsControl.insertSegment(withTitle: desc3, at: activity3, animated: true)
        }
        
        optionsControl.selectedSegmentIndex = 0
        
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            eventInstitutionLogoView.heightAnchor.constraint(equalToConstant: 65),
            eventInstitutionLogoView.widthAnchor.constraint(equalToConstant: 65),
            eventInstitutionLogoView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            eventInstitutionLogoView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            
            eventInstitutionNameLabel.topAnchor.constraint(equalTo: eventInstitutionLogoView.topAnchor, constant: 15),
            eventInstitutionNameLabel.leftAnchor.constraint(equalTo: eventInstitutionLogoView.rightAnchor, constant: 5),
            eventInstitutionNameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            
            eventCalendarIcone.heightAnchor.constraint(equalToConstant: 17),
            eventCalendarIcone.widthAnchor.constraint(equalToConstant: 17),
            eventCalendarIcone.topAnchor.constraint(equalTo: eventInstitutionNameLabel.bottomAnchor, constant: 2),
            eventCalendarIcone.leftAnchor.constraint(equalTo: eventInstitutionNameLabel.leftAnchor),
            
            eventDateLabel.topAnchor.constraint(equalTo: eventCalendarIcone.topAnchor, constant: 2),
            eventDateLabel.leftAnchor.constraint(equalTo: eventCalendarIcone.rightAnchor, constant: 2),
            
            eventClockIcone.heightAnchor.constraint(equalToConstant: 17),
            eventClockIcone.widthAnchor.constraint(equalToConstant: 17),
            eventClockIcone.topAnchor.constraint(equalTo: eventCalendarIcone.topAnchor),
            eventClockIcone.leftAnchor.constraint(equalTo: eventDateLabel.rightAnchor, constant: 10),
            
            eventHourLabel.topAnchor.constraint(equalTo: eventDateLabel.topAnchor),
            eventHourLabel.leftAnchor.constraint(equalTo: eventClockIcone.rightAnchor, constant: 2),
            
            eventMapClipIcone.heightAnchor.constraint(equalToConstant: 17),
            eventMapClipIcone.widthAnchor.constraint(equalToConstant: 17),
            eventMapClipIcone.topAnchor.constraint(equalTo: eventCalendarIcone.topAnchor),
            eventMapClipIcone.leftAnchor.constraint(equalTo: eventHourLabel.rightAnchor, constant: 10),
            
            eventDistanceLabel.topAnchor.constraint(equalTo: eventDateLabel.topAnchor),
            eventDistanceLabel.leftAnchor.constraint(equalTo: eventMapClipIcone.rightAnchor, constant: 2),
            
            eventHandsView.heightAnchor.constraint(equalToConstant: 60),
            eventHandsView.widthAnchor.constraint(equalToConstant: 60),
            eventHandsView.topAnchor.constraint(equalTo: eventInstitutionLogoView.bottomAnchor, constant: 20),
            eventHandsView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            eventFirstLabel.topAnchor.constraint(equalTo: eventHandsView.bottomAnchor, constant: 10),
            eventFirstLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            eventFirstLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            
            optionsControl.topAnchor.constraint(equalTo: eventFirstLabel.bottomAnchor, constant: 20),
            optionsControl.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            optionsControl.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            
            eventSecondLabel.topAnchor.constraint(equalTo: optionsControl.bottomAnchor, constant: 20),
            eventSecondLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            eventSecondLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: 10),
            
            eventFriendsView.heightAnchor.constraint(equalToConstant: 110),
            eventFriendsView.widthAnchor.constraint(equalToConstant: 110),
            eventFriendsView.topAnchor.constraint(equalTo: eventSecondLabel.bottomAnchor, constant: 10),
            eventFriendsView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            subscriptionButton.heightAnchor.constraint(equalToConstant: 40),
            subscriptionButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            subscriptionButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            subscriptionButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)

        ])
    }
}

// MARK: - DRSubscriptionEventViewViewModelDelegate
extension DRSubscriptionEventView: DRSubscriptionEventViewViewModelDelegate {
    func notSignIn() {
        delegate?.notSignIn()
    }
    
    func successSubscription() {
        delegate?.successSubscription()
    }
    
    func didFailSubscription(msg: String) {
        delegate?.didFailSubscription(msg: msg)
    }
    
    
}
