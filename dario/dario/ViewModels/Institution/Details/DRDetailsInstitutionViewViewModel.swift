//
//  DetailsInstitutionViewViewModel.swift
//  dario
//
//  Created by Henrique Alves Batochi on 23/10/23.
//

import Foundation

struct DRDetailsInstitutionViewViewModel {
    
    private let institution: DRInstitution
    
    // MARK: - Init
    init(institution: DRInstitution) {
        self.institution = institution
    }
    
    // MARK: - Public variables
    public var institutionName: String {
        return institution.ad001_vc_nfanta
    }
    
    public var institutionAddress: String {
        return institution.ad001_vc_bairro + " - " + institution.ad001_vc_cidade
    }
    
    public var institutionBiography: String {
        return institution.ad001_vc_biograf ?? ""
    }
    
    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void) {
        // TODO: Abstract to Image Manager
        guard let url = URL(string: institution.ad001_vc_logo) else {
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
