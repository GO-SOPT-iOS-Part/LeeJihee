//
//  Int+.swift
//  SOPT_iOS
//
//  Created by 지희의 MAC on 2023/04/22.
//
//
import Foundation

extension Int {
    //get only -> 수정불가!
    var priceText: String {
        get {
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            
            var priceString = numberFormatter.string(for: self) ?? "0"
            priceString = priceString + "원"
            return priceString
        }
    }
}
