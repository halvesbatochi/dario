//
//  SubscriptionEventViewViewModel.swift
//  dario
//
//  Created by Henrique Alves Batochi on 29/10/23.
//

import Foundation

final class DRSubscriptionEventViewViewModel {
    
    public let event: DREvent
    
    init(event: DREvent) {
        self.event = event
    }
    
    public var logo: String {
        return event.ad001_vc_logo
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
}
