//
//  DRDetailsDonateViewViewModel.swift
//  dario
//
//  Created by Henrique Alves Batochi on 22/10/23.
//

import Foundation

struct DRDetailsDonateViewViewModel {
    
    private let detailDonate: DRDonate
    
    // MARK: - Init
    init(donate: DRDonate) {
        self.detailDonate = donate
    }
    
    // MARK: - Public variables
    public var institutionName: String {
        return detailDonate.ad001_vc_nfanta
    }
    
    public var method: String {
        return detailDonate.ev005_vc_metod
    }
    
    public var address: String {
        return detailDonate.ad001_vc_bairro + " - " + detailDonate.ad001_vc_cidade
    }
    
    public var desc: String {
        return detailDonate.ev005_vc_desc
    }
    
    public var descaux: String {
        return detailDonate.ev005_vc_descaux
    }
    
    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void) {
        // TODO: Abstract to Image Manager
        guard let url = URL(string: detailDonate.ad001_vc_logo) else {
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
