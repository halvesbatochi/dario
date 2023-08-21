//
//  DRService.swift
//  dario
//
//  Created by Henrique Alves Batochi on 20/08/23.
//

import Foundation

/// Primary API service object to get Daria data
final class DRService {
    
    /// Shared singleton instance
    static let shared = DRService()
    
    /// Privatized construictor
    private init() {}
    
    
    /// Send Dario API Call
    /// - Parameters:
    ///   - request: Request instance
    ///   - completion: Callback with data or error
    public func execute(_ request: DRRequest, completion: @escaping () -> Void) {
        
    }
}
