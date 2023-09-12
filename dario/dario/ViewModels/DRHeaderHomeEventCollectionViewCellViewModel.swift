//
//  DRHeaderHomeEventCollectionViewCellViewModel.swift
//  dario
//
//  Created by Henrique Alves Batochi on 21/08/23.
//

import Foundation

final class DRHeaderHomeEventCollectionViewCellViewModel {
    
    public let eventName: String
    public let institutionName: String
    private let eventImageURL: URL?
    
    // MARK: - Init
    
    init (eventName: String,
          institutionName: String,
          eventImageURL: URL?
    ) {
        self.eventName = eventName
        self.institutionName = institutionName
        self.eventImageURL = eventImageURL
    }
    
    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void) {
        // TODO: Abstract to Image Manager
        guard let url = eventImageURL else {
            completion(.failure(URLError(.badURL)))
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? URLError(.badServerResponse)))
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
}
