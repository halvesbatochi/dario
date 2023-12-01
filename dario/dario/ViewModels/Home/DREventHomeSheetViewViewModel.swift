//
//  DREventHomeSheetViewViewModel.swift
//  dario
//
//  Created by Henrique Alves Batochi on 21/11/23.
//

import Foundation

final class DREventHomeSheetViewViewModel {
    
    public var event: DREvent
    
    init(event: DREvent) {
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
    
    public func registerVisit() {
        
        guard let voluntID = UserDefaults.standard.string(forKey: "idUser") else { return }
        guard let id = Int(voluntID) else { return }
        
        let register = DRRegisterVisit(ENT_IT_VOLUNT: id,
                                       ENT_IT_EVENT: event.ev001_it_id,
                                       ENT_IT_ATUAC: event.ad001_it_atuac,
                                       ENT_IT_ATV1: event.ev001_it_atv1 ?? 0,
                                       ENT_IT_ATV2: event.ev001_it_atv2 ?? 0,
                                       ENT_IT_ATV3: event.ev001_it_atv3 ?? 0)
        
        let data = try? JSONEncoder().encode(register)
        
        let url = URL(string: "http://172.171.200.121/voluntvisit")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = data
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let _ = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
        }
        task.resume()
    }
}
