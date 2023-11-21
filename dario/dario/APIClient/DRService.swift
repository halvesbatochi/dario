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
    
    enum DRServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    
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
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(DRServiceError.failedToCreateRequest))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? DRServiceError.failedToGetData))
                return
            }
            
            // Decode response
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
            }
            catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    // MARK: - Private
    
    private func request(from drRequest: DRRequest) -> URLRequest? {
        guard let url = drRequest.url else { return nil }
        
        var request = URLRequest(url: url)
        request.httpMethod = drRequest.httpMethod
        
        
        return request
    }
}
