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
        return institution.name
    }
    
    public var institutionAddress: String {
        return institution.district + " - " + institution.city
    }
    
    public var institutionBiography: String {
        return institution.biography
    }
}
