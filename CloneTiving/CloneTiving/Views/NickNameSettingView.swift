//
//  nickNameView.swift
//  CloneTiving
//
//  Created by 지희의 MAC on 2023/04/16.
//

import UIKit

final class NickNameSettingView: UIView {
    
    private let nickNameLabel = UILabel().then{
        $0.text = "닉네임을 입력해주세요"
        $0.font = .tvingRegular(ofSize: 24)
    }
    
    lazy var nickNameTextField = UITextField().then{
        $0.placeholder = "닉네임을 입력해주세요"
        $0.makeCornerRound(radius: 5)
        $0.backgroundColor = .tvingGray4
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        $0.leftViewMode = .always
        $0.clearButtonMode = .whileEditing
        $0.textColor = .white
    }
    
    lazy var settingButton = UIButton().then{
        $0.setTitle("저장하기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.makeCornerRound(radius: 5)
        $0.backgroundColor = .tvingRed
        
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension NickNameSettingView{
    func setUI(){
        setViewHierarchy()
        setLayout()
    }
    func setViewHierarchy(){
        self.addSubviews(nickNameLabel,nickNameTextField,settingButton)
    }
    func setLayout(){
        nickNameLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(50)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        nickNameTextField.snp.makeConstraints{
            $0.top.equalTo(nickNameLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        settingButton.snp.makeConstraints{
            $0.bottom.equalToSuperview().inset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
    }
}
