//
//  DRDetailsDonateViewViewModel.swift
//  dario
//
//  Created by Henrique Alves Batochi on 22/10/23.
//

import Foundation

final class DRDetailsDonateViewViewModel: NSObject {
    
    private var detailDonate: DRDonate?
    
    
    // MARK: - Init
    override init() {}
    
    // MARK: - Public variables
    public var institutionName: String {
        guard let institutionName = detailDonate?.institution else {
            return ""
        }
        return institutionName
    }
    
    public var method: String {
        guard let method = detailDonate?.method else {
            return ""
        }
        return method
    }
    
    // MARK: - Public methods
    public func configure(with viewModel: DRDonate) {
        self.detailDonate = viewModel
    }
}
