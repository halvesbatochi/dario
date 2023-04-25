//
//  Extensions.swift
//  dario
//
//  Created by Henrique Alves Batochi on 25/04/23.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}
