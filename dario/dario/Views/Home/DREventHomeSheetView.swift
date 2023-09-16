//
//  DREventHomeSheetView.swift
//  dario
//
//  Created by Henrique Alves Batochi on 16/09/23.
//

import UIKit

class DREventHomeSheetView: UIView {

    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemGreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
}
