//
//  SignInView.swift
//  CloneTiving
//
//  Created by 지희의 MAC on 2023/04/11.
//

import UIKit
import SnapKit
import Then

class LoginView: UIView {
    
    //MARK: UIComponents
    private let loginLabel = UILabel().then{
        $0.text = "TIVNG ID 로그인"
        $0.font = .systemFont(ofSize: 23)
        $0.textColor = .white
    }
    
    private let idTextField = UITextField(frame: .zero).then{
        $0.placeholder = "아이디"
        $0.backgroundColor = .tvingGray3
        $0.setPlaceholderColor(.tvingGray1)
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        $0.leftViewMode = .always
        $0.makeCornerRound(radius: 5)
        $0.isEnabled = false
        
    }
    
    private let passwordTextField = UITextField().then{
        $0.placeholder = "비밀번호"
        $0.backgroundColor = .tvingGray3
        $0.setPlaceholderColor(.tvingGray1)
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        $0.leftViewMode = .always
        $0.makeCornerRound(radius: 5)
        $0.isEnabled = false
    }
    
    private lazy var loginButton = UIButton().then{
        $0.setTitle("로그인하기", for: .normal)
        $0.setTitleColor(.tvingGray1, for: .normal)
        $0.makeBorder(width: 0.5, color: .tvingGray1)
        $0.makeCornerRound(radius: 5)
        
    }
    
    private let sectionLabel = UILabel().then{
        $0.text = "|"
        $0.textColor = .systemGray2
    }
    
    private lazy var settingStackView = UIStackView().then{
        $0.axis = .horizontal
        $0.addArrangedSubviews(findIdButton,sectionLabel,findPwButton)
        $0.spacing = 20
    }
    
    private lazy var findIdButton = UIButton().then{
        $0.setTitle("아이디 찾기", for: .normal)
        $0.setTitleColor(.tvingGray1, for: .normal)
    }
    
    private lazy var findPwButton = UIButton().then{
        $0.setTitle("비밀번호 찾기", for: .normal)
        $0.setTitleColor(.tvingGray1, for: .normal)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setUI()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension LoginView{
    func setUI(){
        setViewHierarchy()
        setLayout()
    }
    
    func setViewHierarchy(){
        addSubviews(loginLabel,idTextField,passwordTextField,loginButton,settingStackView)
    }
    
    func setLayout(){
        
        loginLabel.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(idTextField.snp.top).offset(-31)
        }
        
        idTextField.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(passwordTextField.snp.top).offset(-7)
            $0.height.equalTo(52)
        }
        
        passwordTextField.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(loginButton.snp.top).offset(-20)
            $0.height.equalTo(idTextField.snp.height)
        }
        
        loginButton.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(settingStackView.snp.top).offset(-30)
            $0.height.equalTo(idTextField.snp.height)
        }
        
        settingStackView.snp.makeConstraints{
            $0.centerX.equalToSuperview()
        }
    }
}
