//
//  DREventsTableViewCellViewModel.swift
//  dario
//
//  Created by Henrique Alves Batochi on 10/10/23.
//

import Foundation

struct DREventTableViewCellViewModel: Hashable, Equatable {
    
    private let event: DREvent
    
    // MARK: - Init
    
    init(event: DREvent) {
        self.event = event
    }
    
    // MARK: - Public variables
    
    public var id: Int {
        return event.id
    }
    
    public var category: Int {
        return event.category
    }
    
    public var title: String {
        return event.title
    }
    
    public var subtit: String {
        return event.subtit
    }
    
    public var logo: String {
        return event.logo
    }
    
    // MARK: - Hashable and Equatable methods
    
    static func == (lhs: DREventTableViewCellViewModel, rhs: DREventTableViewCellViewModel) -> Bool {
        return lhs.event.id == rhs.event.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
        hasher.combine(event.id)
        hasher.combine(subtit)
    }
}
