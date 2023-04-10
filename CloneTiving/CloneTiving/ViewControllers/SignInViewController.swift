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
    private lazy var visableButton = UIButton().then{
        $0.setImage(Images.eyeSlashImage, for: .normal)
    }
    
    private let loginLabel = UILabel().then{
        $0.text = "TIVNG ID 로그인"
        $0.font = .systemFont(ofSize: 23)
        $0.textColor = .white
    }
    
    private lazy var idTextField = UITextField(frame: .zero).then{
        $0.placeholder = "아이디"
        $0.backgroundColor = .tvingGray3
        $0.setPlaceholderColor(.tvingGray1)
        $0.textColor = .white
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        $0.clearButtonMode = .whileEditing
        $0.leftViewMode = .always
        $0.makeCornerRound(radius: 5)
        
    }
    
    private let passwordTextField = UITextField().then{
        $0.placeholder = "비밀번호"
        $0.backgroundColor = .tvingGray3
        $0.setPlaceholderColor(.tvingGray1)
        $0.textColor = .white
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        $0.clearButtonMode = .whileEditing
        $0.leftViewMode = .always
        $0.isSecureTextEntry = true
        $0.makeCornerRound(radius: 5)
    }
    
    private lazy var loginButton = UIButton().then{
        $0.setTitle("로그인하기", for: .normal)
        $0.setTitleColor(.tvingGray1, for: .normal)
        $0.makeBorder(width: 0.5, color: .tvingGray1)
        $0.makeCornerRound(radius: 5)
        $0.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        $0.isEnabled = false
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
    }
    
    @objc func loginButtonDidTap(){
        let nextVC = LoginSucessViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
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
        self.navigationController?.navigationBar.tintColor = .white
        view.addSubviews(loginLabel,idTextField,passwordTextField,loginButton,settingStackView,makeNicknameStackView)
        
        idTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    func setLayout(){
        
        loginLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(110)
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
        
        makeNicknameStackView.snp.makeConstraints{
            $0.centerX.equalToSuperview().offset(10)
            $0.top.equalTo(settingStackView.snp.bottom).offset(20)
            
        }
    }
}

extension SignInViewController: UITextFieldDelegate{
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            if idTextField.text!.contains("@")   && passwordTextField.text!.count >= 10 {
                self.loginButton.isEnabled = true
                self.loginButton.backgroundColor = .tvingRed
                self.loginButton.setTitleColor(.white, for: .normal)
            } else {
                self.loginButton.isEnabled = false
            }
            return true
        }
        
        func textFieldDidBeginEditing(_ textField: UITextField) {
            textField.makeBorder(width: 0.7, color: .tvingGray1)
        }
        func textFieldDidEndEditing(_ textField: UITextField) {
            textField.layer.borderWidth = 0
        }

}
