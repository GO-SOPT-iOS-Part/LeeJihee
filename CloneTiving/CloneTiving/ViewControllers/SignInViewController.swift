//
//  ViewController.swift
//  CloneTiving
//
//  Created by 지희의 MAC on 2023/04/11.
//

import UIKit
import SnapKit
import Then


class SignInViewController: UIViewController, UISheetPresentationControllerDelegate {
    
    //MARK: UIComponents
    
    
    private let loginLabel = UILabel().then{
        $0.text = "TIVNG ID 로그인"
        $0.font = .tvingBold(ofSize: 23)
        $0.textColor = .white
    }
    
    private lazy var idTextField = customTextField("아이디", .id)
    
    private lazy var passwordTextField = customTextField("비밀번호", .password).then{
        $0.isSecureTextEntry = true
        
    }
    
    private lazy var loginButton = UIButton().then{
        $0.setTitle("로그인하기", for: .normal)
        $0.setTitleColor(.tvingGray1, for: .normal)
        $0.titleLabel?.font = .tvingRegular(ofSize: 14)
        $0.makeBorder(width: 0.5, color: .tvingGray1)
        $0.makeCornerRound(radius: 5)
        $0.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        $0.isEnabled = false
    }
    
    
    private let sectionLabel = UILabel().then{
        $0.text = "|"
        $0.textColor = .tvingGray3
    }
    
    private lazy var settingStackView = UIStackView().then{
        $0.axis = .horizontal
        $0.addArrangedSubviews(findIdButton,sectionLabel,findPwButton)
        $0.spacing = 20
    }
    
    private lazy var findIdButton = UIButton().then{
        $0.setTitle("아이디 찾기", for: .normal)
        $0.setTitleColor(.tvingGray1, for: .normal)
        $0.titleLabel?.font = .tvingRegular(ofSize: 14)
    }
    
    private lazy var findPwButton = UIButton().then{
        $0.setTitle("비밀번호 찾기", for: .normal)
        $0.setTitleColor(.tvingGray1, for: .normal)
        $0.titleLabel?.font = .tvingRegular(ofSize: 14)
    }
    
    private lazy var makeNicknameStackView = UIStackView().then{
        $0.addArrangedSubviews(accountLabel,makeNicknameButton)
        $0.spacing = 20
    }
    
    private let accountLabel = UILabel().then{
        $0.text = "아직 계정이 없으신가요?"
        $0.textColor = .tvingGray3
        $0.font = .tvingRegular(ofSize: 14)
    }
    
    private lazy var makeNicknameButton = UIButton().then{
        $0.setTitle("닉네임 만들러가기", for: .normal)
        $0.titleLabel?.font = .tvingRegular(ofSize: 14)
        $0.setTitleColor(.tvingGray1, for: .normal)
        $0.addTarget(self, action: #selector(nickNameButtonDidTap), for: .touchUpInside)
        $0.setUnderline()
    }
    
    //MARK: 심화과제 구현
    
    private let backgroundView = BackgroundView()
    
    private let nicknameSettingView = NicknameSettingView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        idTextField.text = ""
        passwordTextField.text = ""
    }
    
    @objc func loginButtonDidTap(){
        let nextVC = LoginSucessViewController()
        guard let text = idTextField.text else { return }
        nextVC.dataBind(text)
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func nickNameButtonDidTap(){
        let bottomSheetVC = BottomSheetViewController()
            // 1
            bottomSheetVC.modalPresentationStyle = .overFullScreen
            // 2
            self.present(bottomSheetVC, animated: false, completion: nil)
        
//        if let sheet = nextVC.sheetPresentationController {
//            sheet.detents = [.medium(), .large()]
//            sheet.delegate = self
//            sheet.prefersGrabberVisible = true
//        }
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
        view.addSubview(backgroundView)
        backgroundView.addSubviews(nicknameSettingView)
        
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
        
        backgroundView.snp.makeConstraints{
            $0.top.equalTo(view.snp.bottom)
        }
        
        nicknameSettingView.snp.makeConstraints{
            $0.height.equalTo(UIScreen.main.bounds.height / 2)
        }
        
        
    }
}

extension SignInViewController: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.makeBorder(width: 0.7, color: .tvingGray1)
        if idTextField.text!.contains("@")  && passwordTextField.text!.count >= 10 {
            self.loginButton.isEnabled = true
            checkIsEnableButton()
        } else {
            self.loginButton.isEnabled = false
            checkIsEnableButton()
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if idTextField.text!.contains("@")  && passwordTextField.text!.count >= 10 {
            self.loginButton.isEnabled = true
            checkIsEnableButton()
        } else {
            self.loginButton.isEnabled = false
            checkIsEnableButton()
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if idTextField.text!.contains("@")  && passwordTextField.text!.count >= 10 {
            self.loginButton.isEnabled = true
            checkIsEnableButton()
        } else {
            self.loginButton.isEnabled = false
            checkIsEnableButton()
        }
        textField.layer.borderWidth = 0
    }
    
    func checkIsEnableButton(){
        if loginButton.isEnabled {
            self.loginButton.backgroundColor = .tvingRed
            self.loginButton.setTitleColor(.white, for: .normal)
        } else{
            self.loginButton.backgroundColor = .none
            self.loginButton.setTitleColor(.tvingGray2, for: .normal)
        }
    }
}
