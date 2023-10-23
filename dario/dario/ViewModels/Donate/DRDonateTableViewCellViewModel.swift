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
        return donate.id
    }
    
    public var institution: String {
        return donate.institution
    }
    
    public var method: String {
        return donate.method
    }
    
    // MARK: - Hashable and Equatable methods
    
    static func == (lhs: DRDonateTableViewCellViewModel, rhs: DRDonateTableViewCellViewModel) -> Bool {
        return lhs.donate.id == rhs.donate.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(institution)
    }
    
}
