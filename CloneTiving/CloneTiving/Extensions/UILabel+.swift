//
//  UILabel.swift
//  CloneTiving
//
//  Created by 지희의 MAC on 2023/05/01.
//

import UIKit

extension UILabel {
    func labelWithImg(composition: NSAttributedString...) {
        let attributedString = NSMutableAttributedString()
        composition.forEach { attributedString.append($0) }
        self.attributedText = attributedString
    }
}

