//
//  LoginSucessViewController.swift
//  CloneTiving
//
//  Created by 지희의 MAC on 2023/04/11.
//

import UIKit
import SnapKit
import Then

class LoginSucessViewController: UIViewController {
    
    private var emailtext: String = ""
    
    private let logoImageView = UIImageView().then{
        $0.image = Images.logoImage
    }

    private var greetingLabel = UILabel().then{
        $0.text = "님 반가워요!"
        $0.font = .systemFont(ofSize: 30)
        $0.textAlignment = .center
        $0.textColor = .white
    }
    private lazy var mainButton = UIButton().then{
        $0.setTitle("메인으로", for: .normal)
        $0.backgroundColor = .tvingRed
        $0.makeCornerRound(radius: 5)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

private extension LoginSucessViewController {
    func setUI(){
        setViewHierarchy()
        setLayout()
    }
    
    func setViewHierarchy(){
        view.addSubviews(logoImageView,greetingLabel, mainButton)
    }
    
    func setLayout(){
        logoImageView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(100)
            $0.width.equalToSuperview()
        }
        
        greetingLabel.snp.makeConstraints{
            $0.top.equalTo(logoImageView.snp.bottom).offset(67)
            $0.centerX.equalToSuperview()
        }
        
        mainButton.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
            $0.bottom.equalToSuperview().inset(40)
        }
    }
}
