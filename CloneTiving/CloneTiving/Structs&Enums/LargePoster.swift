//
//  LargePoster.swift
//  CloneTiving
//
//  Created by 지희의 MAC on 2023/05/12.
//

import UIKit

struct LargePoster {
    let image: UIImage
}

extension LargePoster {
    static func dummy() -> [LargePoster]{
        var largePosters: [LargePoster] = []
        for number in 1...4 {
            largePosters.append(LargePoster(image: UIImage(named: "LargePoster\(number)")!))
        }
        return largePosters
    }
}
