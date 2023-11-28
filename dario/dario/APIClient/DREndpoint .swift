//
//  DREndpoint .swift
//  dario
//
//  Created by Henrique Alves Batochi on 20/08/23.
//

import Foundation

/// Represents unique API endpoint
@frozen enum DREndpoint: String {
    /// Endpoint to get events info
    case event = "/event"
    /// Endpoint to get evetns info by ColdStart method
    case eventColdStart = "/eventcoldstart"
    /// Endpoint to get institution info
    case institution = "/inst"
    /// Endpoint to get donate info
    case donate = "/donates"
    /// Endpoint to get volunteer
    case volunteer = "/volunt"
    /// Endpoint to subscription
    case historic = "/volunthist"
}
