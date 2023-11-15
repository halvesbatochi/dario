//
//  SubscriptionEventViewViewModel.swift
//  dario
//
//  Created by Henrique Alves Batochi on 29/10/23.
//

import Foundation

final class DRSubscriptionEventViewViewModel {
    
    private let event: DREvent
    
    init(event: DREvent) {
        self.event = event
    }
    
    public var logo: String {
        return event.logo
    }
}
