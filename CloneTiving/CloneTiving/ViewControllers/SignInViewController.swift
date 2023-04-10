//
//  ViewController.swift
//  CloneTiving
//
//  Created by 지희의 MAC on 2023/04/11.
//

import UIKit
import SnapKit
import Then

class SignInViewController: UIViewController {
    
    
    //MARK: UIComponents
    private let loginView = LoginView(frame: .zero)
    
    private lazy var makeNicknameStackView = UIStackView().then{
        $0.addArrangedSubviews(accountLabel,makeNicknameButton)
        $0.spacing = 20
    }
    
    private let accountLabel = UILabel().then{
        $0.text = "아직 계정이 없으신가요?"
        $0.textColor = .tvingGray3
    }
    
    private lazy var makeNicknameButton = UIButton().then{
        $0.setTitle("닉네임 만들러가기", for: .normal)
        $0.setTitleColor(.tvingGray1, for: .normal)
        $0.addTarget(self, action: #selector(nickNameButtonDidTap), for: .touchUpInside)
        $0.setUnderline()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        // Do any additional setup after loading the view.
    }
    
    @objc func nickNameButtonDidTap(){
        makeNicknameButton.setTitleColor(.tvingGray3, for: .normal)
    }


}

private extension SignInViewController {
    func setUI(){
        setViewHierarchy()
        setLayout()
    }
    
    func setViewHierarchy(){
        view.backgroundColor = .black
        view.addSubviews(loginView,makeNicknameStackView)
    }
    
    func setLayout(){
        
        loginView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(100)
            $0.bottom.equalTo(makeNicknameStackView.snp.top).offset(-20)
            $0.width.equalToSuperview()
            $0.height.equalTo(300)
        }
        
        makeNicknameStackView.snp.makeConstraints{
            $0.centerX.equalToSuperview().offset(10)
            
        }
    }
}
