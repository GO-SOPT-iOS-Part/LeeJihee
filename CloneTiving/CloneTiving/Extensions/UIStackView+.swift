//
//  UIStackView.swift
//  CloneTiving
//
//  Created by 지희의 MAC on 2023/04/11.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView ...){
        views.forEach { self.addArrangedSubview($0) }
    }
}
