//
//  UIView+.swift
//  CloneTiving
//
//  Created by 지희의 MAC on 2023/04/11.
//
import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
    
    func makeShadow (radius : CGFloat, offset : CGSize, opacity : Float){
            layer.shadowColor = UIColor.darkGray.cgColor
            layer.shadowOffset = offset
            layer.shadowRadius = radius
            layer.shadowOpacity = opacity
            layer.masksToBounds = false
        }
        
        func makeCornerRound (radius : CGFloat) {
            layer.cornerRadius = radius
            layer.masksToBounds = true
        }
        
        func makeBorder (width : CGFloat ,color : UIColor ) {
            layer.borderWidth = width
            layer.borderColor = color.cgColor
        }
    
}