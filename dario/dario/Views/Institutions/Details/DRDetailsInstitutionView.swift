//
//  DRDetailsInstitutionView.swift
//  dario
//
//  Created by Henrique Alves Batochi on 23/10/23.
//

import UIKit

/// View for single Institution info
class DRDetailsInstitutionView: UIView {
    
    private let viewModel: DRDetailsInstitutionViewViewModel
    
    // MARK: - Init
    init(frame: CGRect, viewModel: DRDetailsInstitutionViewViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .magenta

        addSubviews()
        
        addConstraints()
        
        print(self.viewModel.institutionName)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    // MARK: - Private methods
    private func addConstraints() {
        NSLayoutConstraint.activate([
            
        ])
    }
}
