//
//  DREventsTableViewCellViewModel.swift
//  dario
//
//  Created by Henrique Alves Batochi on 10/10/23.
//

import Foundation

struct DREventTableViewCellViewModel: Hashable, Equatable {
    
    private let event: DREvent
    
    init(event: DREvent) {
        self.event = event
    }
    
    public var title: String {
        return event.title
    }
    
    public var subtit: String {
        return event.subtit
    }
    
    static func == (lhs: DREventTableViewCellViewModel, rhs: DREventTableViewCellViewModel) -> Bool {
        return lhs.event.id == rhs.event.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
        hasher.combine(event.id)
        hasher.combine(subtit)
    }
}
