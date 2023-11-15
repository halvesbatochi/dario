//
//  DRService.swift
//  dario
//
//  Created by Henrique Alves Batochi on 20/08/23.
//

import Foundation

/// Primary API service object to get Dario data
final class DRService {
    
    /// Shared singleton instance
    static let shared = DRService()
    
    /// Privatized construictor
    private init() {}
    
    
    /// Send Dario API Call
    /// - Parameters:
    ///   - request: Request instance
    ///   - type: The type of object we expect to get back
    ///   - completion: Callback with data or error
    public func execute<T: Codable>(
        _ request: DRRequest,
        expecting type: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        
    }
}
