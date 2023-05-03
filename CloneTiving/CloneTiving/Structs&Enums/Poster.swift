//
//  Poster.swift
//  CloneTiving
//
//  Created by 지희의 MAC on 2023/05/03.
//

import UIKit

struct Poster {
    let image: UIImage
    var title: String
}



extension Poster {
    static func dummy() -> [Poster] {
        var posters: [Poster] = []
        let titles: [String] = ["시그널","해리포터와 마법사의 돌","반지의 제왕","스즈메의 문단속"]
        
        for number in 2..<6 {
            posters.append(Poster(image: UIImage(named: "poster\(number)")!, title: titles[number-2]))
        }
        return posters + posters
    }
}

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
