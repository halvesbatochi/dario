//
//  DRDonateTableViewCellViewModel.swift
//  dario
//
//  Created by Henrique Alves Batochi on 19/10/23.
//

import Foundation

struct DRDonateTableViewCellViewModel: Hashable, Equatable {
    
    private let donate: DRDonate
    
    // MARK: - Init
    
    init(donate: DRDonate) {
        self.donate = donate
    }
    
    // MARK: - Public variables
    
    public var id: Int {
        return donate.ev005_it_id
    }
    
    public var institution: String {
        return donate.ad001_vc_nfanta
    }
    
    public var method: String {
        return donate.ev005_vc_metod
    }
    
    public var desc: String {
        return donate.ev005_vc_desc
    }
    
    public var descaux: String {
        return donate.ev005_vc_descaux
    }
    
    public var logo: String {
        return donate.ad001_vc_logo
    }
    
    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void) {
        // TODO: Abstract to Image Manager
        guard let url = URL(string: donate.ad001_vc_logo) else {
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
    
    static func == (lhs: DRDonateTableViewCellViewModel, rhs: DRDonateTableViewCellViewModel) -> Bool {
        return lhs.donate.ev005_it_id == rhs.donate.ev005_it_id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(institution)
    }
    
}
