//
//  DREventHomeSheetView.swift
//  dario
//
//  Created by Henrique Alves Batochi on 16/09/23.
//

import UIKit

protocol DREventHomeSheetViewDelegate: AnyObject {
    func clickedParticipationButton(_ sender: UIButton)
}

final class DREventHomeSheetView: UIView {
    
    public weak var delegate: DREventHomeSheetViewDelegate?
    
    private var viewModel: DREventHomeSheetViewViewModel
    
    private let eventNameLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 30, weight: .semibold)
        label.textColor = .secondaryLabel
        
        return label
    }()
    
    private let eventInstitutionLogoView: UIView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Logo6")
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 30
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let eventInstitutionNameLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "AACD"
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
        imageView.clipsToBounds = true
        imageView.isHidden = true
        
        return imageView
    }()
    
    private let eventDistanceLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "900m"
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .secondaryLabel
        label.isHidden = true
        
        return label
    }()
    
    private let eventFirstLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 48/255, green: 176/255, blue: 188/255, alpha: 1.0)
        
        return label
    }()
    
    private let eventHouseImage: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "House")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let eventSecondLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        
        return label
    }()
    
    private let eventVolunteersImage: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Volunteers")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let eventThirdyLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        
        return label
    }()
    
    private let eventHandsImage: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Hands")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let eventHeartImage: UIImageView = {
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Heart")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let eventFourthLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        
        return label
    }()
    
    private let eventFifthLabel: UILabel = {
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        
        return label
    }()
    
    let eventParticipationButton: UIButton = {
        let button = UIButton()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        let imageButton = UIImage(named: "LogoBtn")
        button.setBackgroundImage(imageButton, for: .normal)
        button.setTitle("Participar", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12)
        
        return button
    }()
    

    // MARK: - Init
    
    init(frame: CGRect, viewModel: DREventHomeSheetViewViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
        
        addSubviews(eventNameLabel,
                    eventInstitutionLogoView,
                    eventInstitutionNameLabel,
                    eventCalendarIcone,
                    eventDateLabel,
                    eventClockIcone,
                    eventHourLabel,
                    eventMapClipIcone,
                    eventDistanceLabel,
                    eventFirstLabel,
                    eventHouseImage,
                    eventSecondLabel,
                    eventVolunteersImage,
                    eventThirdyLabel,
                    eventHandsImage,
                    eventFourthLabel,
                    eventHeartImage,
                    eventFifthLabel,
                    eventParticipationButton)
        addConstraints()
        setUpParticipationButton()
        configureLabels()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    // MARK: - Private Methods
    private func setUpParticipationButton() {
        self.eventParticipationButton.addTarget(self, action: #selector(self.clickedButton), for: .touchUpInside)
    }
    
    private func configureLabels() {
        eventNameLabel.text = viewModel.event.ev001_vc_titulo
        eventInstitutionNameLabel.text = viewModel.event.ad001_vc_nfanta
        eventDateLabel.text = viewModel.dateEvent
        eventHourLabel.text = viewModel.hourEvent
        eventFirstLabel.text = viewModel.event.ev001_vc_fmsg1
        eventSecondLabel.text = viewModel.event.ev001_vc_fmsg2
        eventThirdyLabel.text = viewModel.event.ev001_vc_fmsg3
        eventFourthLabel.text = viewModel.event.ev001_vc_fmsg4
        eventFifthLabel.text = viewModel.event.ev001_vc_fmsg5
    }
    
    
    @objc private func clickedButton(_ sender: UIButton) {
        delegate?.clickedParticipationButton(sender)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            eventNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            eventNameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            eventNameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
            
            eventInstitutionLogoView.heightAnchor.constraint(equalToConstant: 65),
            eventInstitutionLogoView.widthAnchor.constraint(equalToConstant: 65),
            eventInstitutionLogoView.topAnchor.constraint(equalTo: eventNameLabel.bottomAnchor, constant: 10),
            eventInstitutionLogoView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            
            eventInstitutionNameLabel.topAnchor.constraint(equalTo: eventInstitutionLogoView.topAnchor, constant: 10),
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
            
            eventFirstLabel.topAnchor.constraint(equalTo: eventDistanceLabel.bottomAnchor, constant: 30),
            eventFirstLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 52.5),
            
            eventHouseImage.heightAnchor.constraint(equalToConstant: 50),
            eventHouseImage.widthAnchor.constraint(equalToConstant: 50),
            eventHouseImage.rightAnchor.constraint(equalTo: rightAnchor, constant: -40),
            eventHouseImage.bottomAnchor.constraint(equalTo: eventFirstLabel.bottomAnchor),
            
            eventSecondLabel.topAnchor.constraint(equalTo: eventFirstLabel.bottomAnchor),
            eventSecondLabel.leftAnchor.constraint(equalTo: eventFirstLabel.leftAnchor),
            eventSecondLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -40),
            
            eventVolunteersImage.heightAnchor.constraint(equalToConstant: 65),
            eventVolunteersImage.widthAnchor.constraint(equalToConstant: 65),
            eventVolunteersImage.topAnchor.constraint(equalTo: eventSecondLabel.bottomAnchor, constant: 7),
            eventVolunteersImage.leftAnchor.constraint(equalTo: eventSecondLabel.leftAnchor),
            
            eventThirdyLabel.topAnchor.constraint(equalTo: eventSecondLabel.bottomAnchor),
            eventThirdyLabel.leftAnchor.constraint(equalTo: eventVolunteersImage.rightAnchor, constant: 5),
            eventThirdyLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -40),
            
            eventHandsImage.heightAnchor.constraint(equalToConstant: 50),
            eventHandsImage.widthAnchor.constraint(equalToConstant: 50),
            eventHandsImage.topAnchor.constraint(equalTo: eventThirdyLabel.bottomAnchor, constant: 10),
            eventHandsImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            eventFourthLabel.topAnchor.constraint(equalTo: eventHandsImage.bottomAnchor, constant: 10),
            eventFourthLabel.leftAnchor.constraint(equalTo: eventFirstLabel.leftAnchor),
            eventFourthLabel.rightAnchor.constraint(equalTo: eventSecondLabel.rightAnchor),
            
            eventHeartImage.heightAnchor.constraint(equalToConstant: 60),
            eventHeartImage.widthAnchor.constraint(equalToConstant: 60),
            eventHeartImage.topAnchor.constraint(equalTo: eventFourthLabel.bottomAnchor),
            eventHeartImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            eventFifthLabel.topAnchor.constraint(equalTo: eventHeartImage.bottomAnchor, constant: 5),
            eventFifthLabel.leftAnchor.constraint(equalTo: eventSecondLabel.leftAnchor),
            eventFifthLabel.rightAnchor.constraint(equalTo: eventSecondLabel.rightAnchor, constant: -60),
            
            eventParticipationButton.heightAnchor.constraint(equalToConstant: 90),
            eventParticipationButton.widthAnchor.constraint(equalToConstant: 90),
            eventParticipationButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            eventParticipationButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
}
