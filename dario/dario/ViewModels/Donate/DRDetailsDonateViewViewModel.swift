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
        return detailDonate.institution
    }
    
    public var method: String {
        return detailDonate.method
    }
}
