//
//  UIFont+.swift
//  CloneTiving
//
//  Created by 지희의 MAC on 2023/04/11.
//

import UIKit

extension UIFont {
    
    class func tvingSemiBold(ofSize size: CGFloat) -> UIFont{
        return UIFont(name: "Pretendard-SemiBold", size: size)!
    }
    class func tvingRegular(ofSize size: CGFloat) -> UIFont{
        return UIFont(name: "Pretendard-Regular", size: size)!
    }
    class func tvingBold(ofSize size: CGFloat) -> UIFont{
        return UIFont(name: "Pretendard-Bold", size: size)!
    }
}
