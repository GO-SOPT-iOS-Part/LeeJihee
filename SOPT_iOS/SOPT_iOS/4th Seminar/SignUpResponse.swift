//
//  SignUpResponse.swift
//  SOPT_iOS
//
//  Created by 지희의 MAC on 2023/05/06.
//
// 네트워크 통신 결과로 넘어오는 JSON 데이터를 앱이 이해할 수 있는 형태인 Swift로 바꿔주는 역할
//

import Foundation

struct SignUpResponse: Codable {
    let code: Int
    let success: Bool?
    let message: String
    let data: SignUpData?
}

struct SignUpData: Codable {
    let userId: Int
    let nickname: String
}
