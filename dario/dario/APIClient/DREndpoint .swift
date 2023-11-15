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
    /// Endpoint to get institution info
    case institution = "/inst"
    /// Endpoint to get donate info
    case donate = "/donat"
}
