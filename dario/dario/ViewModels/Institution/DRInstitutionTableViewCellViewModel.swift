//
//  DRInstitutionTableViewCellViewModel.swift
//  dario
//
//  Created by Henrique Alves Batochi on 13/10/23.
//

import Foundation

struct DRInstitutionTableViewCellViewModel: Hashable, Equatable {
    
    private let institution: DRInstitution

    
    // MARK: - Init
    
    init(institution: DRInstitution){
        self.institution = institution
    }
    
    // MARK: - Public variables
    
    public var name: String {
        return institution.ad001_vc_nfanta
    }
    
    public var district: String {
        return institution.ad001_vc_bairro
    }
    
    public var city: String {
        return institution.ad001_vc_cidade
    }
    
    public var districtAndCity: String {
        return institution.ad001_vc_bairro.appending(" - " + institution.ad001_vc_cidade)
    }
    
    public var logo: String {
        return institution.ad001_vc_logo
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
    
    // MARK: - Hashable and Equatable methods
    
    static func == (lhs: DRInstitutionTableViewCellViewModel, rhs: DRInstitutionTableViewCellViewModel) -> Bool {
        return lhs.institution.ad001_it_id == rhs.institution.ad001_it_id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}
