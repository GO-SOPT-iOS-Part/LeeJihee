//
//  UIView+.swift
//  SOPT_iOS
//
//  Created by 지희의 MAC on 2023/04/06.
//
//Mark:=

import Foundation
import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
            views.forEach {
                self.addSubview($0)
               $0.translatesAutoresizingMaskIntoConstraints = false
            }
        }
    
    func makeShadow(radius : CGFloat, offsetX : CGFloat, offsetY : CGFloat, opacity : Float){
            layer.shadowColor = UIColor.darkGray.cgColor
            layer.shadowOffset = CGSize(width: offsetX, height: offsetY)
            layer.shadowRadius = radius
            layer.shadowOpacity = opacity
            layer.masksToBounds = false
        }
        
        func makeCornerRound (radius : CGFloat){
            layer.cornerRadius = radius
            layer.masksToBounds = false
        }
        
        func makeBorder(width : CGFloat , color : UIColor ){
            layer.borderWidth = width
            layer.borderColor = color.cgColor
        }
}
