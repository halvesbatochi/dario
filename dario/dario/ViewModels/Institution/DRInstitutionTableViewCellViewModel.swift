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
        return institution.name
    }
    
    public var district: String {
        return institution.district
    }
    
    public var city: String {
        return institution.city
    }
    
    public var districtAndCity: String {
        return institution.district.appending(" - " + institution.city)
    }
    
    // MARK: - Hashable and Equatable methods
    
    static func == (lhs: DRInstitutionTableViewCellViewModel, rhs: DRInstitutionTableViewCellViewModel) -> Bool {
        return lhs.institution.id == rhs.institution.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}
