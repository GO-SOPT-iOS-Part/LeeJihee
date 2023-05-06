//
//  Config.swift
//  SOPT_iOS
//
//  Created by 지희의 MAC on 2023/05/06.
//

// Config -> BaseURL에 접근하기 위한 코드

import Foundation

enum Config {
    
    enum Keys {
        enum Plist {
            static let baseURL = "BASE_URL"
        }
    }
    
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("plist cannot found.")
        }
        return dict
    }()
}

extension Config {
    
    static let baseURL: String = {
        guard let key = Config.infoDictionary[Keys.Plist.baseURL] as? String else {
            fatalError("Base URL is not set in plist for this configuration.")
        }
        return key
    }()
}
//Base URL은 하나가 아닐 수 있음 -> 여러개를 추가해주면 되는 것 !
