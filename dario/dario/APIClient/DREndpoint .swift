//
//  DREndpoint .swift
//  dario
//
//  Created by Henrique Alves Batochi on 20/08/23.
//

import Foundation

/// Represents unique API endpoint
@frozen enum DRendpoint: String {
    /// Endpoint to get events info
    case event
    /// Endpoint to get institution info
    case institution
    /// Endpoint to get donate info
    case donate
}
