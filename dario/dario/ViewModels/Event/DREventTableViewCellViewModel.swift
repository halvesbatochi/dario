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
    
    public var eventData: DREvent {
        return event
    }
    
    public var category: Int {
        return event.ad001_it_atuac
    }
    
    public var categoryDesc: String {
        return event.ad003_vc_desc
    }
    
    public var title: String {
        return event.ev001_vc_titulo
    }
    
    public var subtit: String {
        return event.ad001_vc_nfanta
    }
    
    public var logo: String {
        return event.ad001_vc_logo
    }
    
    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void) {
        // TODO: Abstract to Image Manager
        guard let url = URL(string: event.ad001_vc_logo) else {
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
    
    static func == (lhs: DREventTableViewCellViewModel, rhs: DREventTableViewCellViewModel) -> Bool {
        return lhs.event.ev001_it_id == rhs.event.ev001_it_id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
        hasher.combine(event.ev001_it_id)
        hasher.combine(subtit)
    }
}
