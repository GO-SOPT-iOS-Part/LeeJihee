//
//  Images.swift
//  CloneTiving
//
//  Created by 지희의 MAC on 2023/04/11.
//

import UIKit

struct Images {
    static let eyeSlashImage = UIImage(named: "eye-slash")!
    static let logoImage = UIImage(named: "LogoImage")!
    static let cancelImage = UIImage(named: "x-circle")!
    static let nextImage = UIImage(named: "btn_before")
    
    static let profileImage = UIImage(named: "profile")
    
    static let settingImage = UIImage(named: "notification")?.withTintColor(.tvingGray3)
    static let notificationImage = UIImage(named: "setting")
    static let ticketImage = UIImage(named: "ticket")?.resized(toWidth: 20)
    static let coinImage = UIImage(named: "coin")?.resized(toWidth: 20)
    
    static let tvnJtbcImage = UIImage(named: "TVNJTBC")
}
