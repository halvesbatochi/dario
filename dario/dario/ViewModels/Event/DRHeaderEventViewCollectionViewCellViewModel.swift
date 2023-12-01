//
//  DRHeaderEventsViewCollectionViewCellViewModel.swift
//  dario
//
//  Created by Henrique Alves Batochi on 16/09/23.
//

import Foundation

final class DRHeaderEventViewCollectionViewCellViewModel: Hashable, Equatable {
    
    public let event: DREvent
    
    // MARK: - Init
    
    init(event: DREvent
    ) {
        self.event = event
    }
    
    public var dateEvent: String {
        let day = event.ev001_dt_inic.suffix(2)
        
        let startIndex = event.ev001_dt_inic.index(event.ev001_dt_inic.startIndex, offsetBy: 4)
        let endIndex = event.ev001_dt_inic.index(event.ev001_dt_inic.endIndex, offsetBy: -2)
        let range = startIndex..<endIndex
        let substring = event.ev001_dt_inic[range]
        
        let month = substring
        
        return day + "." + month
    }
    
    public var hourEvent: String {
        let minutes = event.ev001_hr_inic.suffix(2)
        var hrInic = event.ev001_hr_inic
        if hrInic.count < 4 {
             hrInic = "0\(hrInic)"
        }
        let hour = hrInic.prefix(2)
        return hour + ":" + minutes
    }
    
    public func fetchImageCapa(completion: @escaping (Result<Data, Error>) -> Void) {
        // TODO: Abstract to Image Manager
        guard let url = URL(string: event.ev001_vc_img2) else {
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
    
    public func fetchImageLogo(completion: @escaping (Result<Data, Error>) -> Void) {
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
    
    static func == (lhs: DRHeaderEventViewCollectionViewCellViewModel, rhs: DRHeaderEventViewCollectionViewCellViewModel) -> Bool {
        return lhs.event.ev001_it_id == rhs.event.ev001_it_id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(event.ev001_it_id)
        hasher.combine(event.ev001_vc_titulo)
    }
}
