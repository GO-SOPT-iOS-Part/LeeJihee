//
//  4thViewController.swift
//  SOPT_iOS
//
//  Created by 지희의 MAC on 2023/05/06.
//

import UIKit

final class FourthViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        signUp()
    }
    
    private func signUp() {
        
        SignUpService.shared.signUp(email: "mam07065@naver.com",
                                    nickname: "지희",
                                    password: "Wlgml0902!") { response in
            switch response {
            case .success(let data):
                guard let data = data as? SignUpResponse else { return }
                dump(data)
            default:
                return
            }
        }
    }
}


