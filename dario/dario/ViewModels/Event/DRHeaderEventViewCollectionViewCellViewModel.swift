//
//  DRHeaderEventsViewCollectionViewCellViewModel.swift
//  dario
//
//  Created by Henrique Alves Batochi on 16/09/23.
//

import Foundation

final class DRHeaderEventViewCollectionViewCellViewModel {
    
    public let eventDate: String
    public let eventHour: String
    public let eventName: String
    public let eventInstitutionName: String
    public let eventDistance: Int
    private let eventCoverURL: URL?
    private let eventInstitutionLogoURL: URL?
    
    // MARK: - Init
    
    init(eventDate: String,
         eventHour: String,
         eventName: String,
         eventInstitutionName: String,
         eventDistance: Int,
         eventCoverURL: URL?,
         eventInstitutionLogoURL: URL?
    ) {
        self.eventDate = eventDate
        self.eventHour = eventHour
        self.eventName = eventName
        self.eventInstitutionName = eventInstitutionName
        self.eventDistance = eventDistance
        self.eventCoverURL = eventCoverURL
        self.eventInstitutionLogoURL = eventInstitutionLogoURL
    }
}
