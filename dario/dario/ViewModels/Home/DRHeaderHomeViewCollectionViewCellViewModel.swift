//
//  DRHeaderHomeViewCollectionViewCellViewModel.swift
//  dario
//
//  Created by Henrique Alves Batochi on 21/08/23.
//

import Foundation

final class DRHeaderHomeViewCollectionViewCellViewModel: Hashable, Equatable {
    
    public let eventName: String
    public let institutionName: String
    private let eventCoverURL: URL?
    
    // MARK: - Init
    
    init (eventName: String,
          institutionName: String,
          eventCoverURL: URL?
    ) {
        self.eventName = eventName
        self.institutionName = institutionName
        self.eventCoverURL = eventCoverURL
    }
    
    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void) {
        // TODO: Abstract to Image Manager
        guard let url = eventCoverURL else {
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
    
    // MARK: - Hashable and Equatable methods
    
    static func == (lhs: DRHeaderHomeViewCollectionViewCellViewModel, rhs: DRHeaderHomeViewCollectionViewCellViewModel) -> Bool {
        return lhs.eventName == rhs.eventName
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(eventName)
    }
}
