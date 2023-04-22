//
//  Photos.swift
//  SOPT_iOS
//
//  Created by 지희의 MAC on 2023/04/22.
//

import UIKit

struct Photo {
    let image: UIImage
    var heartTapped: Bool
}


extension Photo {
    static func dummy() -> [Photo] {
        var photos: [Photo] = []
        for number in 1...12 {
            photos.append(Photo(image: UIImage(named: "photo_\(number)")!,
                                heartTapped: false))
        }
        return photos + photos
    }
    
}

