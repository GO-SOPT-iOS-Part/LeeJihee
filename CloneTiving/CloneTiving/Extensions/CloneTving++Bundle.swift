//
//  CloneTving++Bundle.swift
//  CloneTiving
//
//  Created by 지희의 MAC on 2023/05/13.
//
//API_KEY를 숨기기 위함
import Foundation

extension Bundle {
    var apiKey: String {
        guard let file = self.path(forResource: "MovieInfo", ofType: "plist") else { return "" }
        guard let resource = NSDictionary(contentsOfFile: file) else { return "" }
        guard let key = resource["API_KEY"] as? String else { fatalError("MovieInfo.plist에 API_KEY 설정을 해주요.")}
        return key
    }
}
