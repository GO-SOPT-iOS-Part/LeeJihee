//
//  Content.swift
//  CloneTiving
//
//  Created by 지희의 MAC on 2023/05/03.
//

import UIKit

struct Contents {
    var chanelName: String = "Mnet"
    var contentName: String
    var rate: Double
}



extension Contents {
    static func dummy() -> [Contents] {
        var contents: [Contents] = []
        let contentNames: [String] = ["보이즈 플래닛 12화","하트시그널 4화","엠카운트다운 230화"]
        let rates: [Double] = [80.0,24.1,30.2]
        
        for number in 0..<contentNames.count {
            contents.append(Contents(contentName: contentNames[number], rate: rates[number]))
        }
        return contents + contents
    }
}
