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
        return event.ev001_it_id
    }
    
    public var category: Int {
        return 1
    }
    
    public var title: String {
        return event.ev001_vc_titulo
    }
    
    public var subtit: String {
        return "Subtitulo"
    }
    
    public var logo: String {
        return "Logo3"
    }
    
    // MARK: - Hashable and Equatable methods
    
    static func == (lhs: DREventTableViewCellViewModel, rhs: DREventTableViewCellViewModel) -> Bool {
        return lhs.event.ev001_it_id == rhs.event.ev001_it_id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
        hasher.combine(event.ev001_it_id)
        hasher.combine(subtit)
    }
}
