//
//  CustomTextField.swift
//  CloneTiving
//
//  Created by 지희의 MAC on 2023/04/13.
//

import UIKit

final class customTextField: UITextField {
    
    enum TextFieldType: String {
        case id = "아이디"
        case password = "비밀번호"
    }
    
    var isVisable = true
    
    //MARK: UIComponents
    
    private lazy var visableButton = UIButton().then{
        $0.setImage(Images.eyeSlashImage, for: .normal)
        $0.addTarget(self, action: #selector(visableButtonDidTap), for: .touchUpInside)
    }
    
    private lazy var cancelButton = UIButton().then{
        $0.setImage(Images.cancelImage, for: .normal)
        $0.addTarget(self, action: #selector(cancelButtonDidTap), for: .touchUpInside)
    }
    
    private lazy var buttonStack = UIStackView().then{
        $0.addArrangedSubviews(cancelButton,visableButton)
        $0.spacing = 15
        $0.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 20)
        $0.isLayoutMarginsRelativeArrangement = true
    }
    
    //MARK: Life Cycles
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(_ text: String,_ type: TextFieldType ){
        super.init(frame: .zero)
        setUI(text)
        setRightView(type)
    }
    
    //MARK: Action
    @objc func visableButtonDidTap(){
        isVisable = !isVisable
        self.isSecureTextEntry = isVisable
    }
    
    @objc func cancelButtonDidTap(){
        self.text = ""
    }
    
    
    
}

private extension customTextField {
    
    //MARK: Custom Method
    func setUI(_ text: String){
        self.placeholder = text
        self.font = .tvingRegular(ofSize: 14)
        self.backgroundColor = .tvingGray3
        self.setPlaceholderColor(.tvingGray1)
        self.textColor = .white
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        self.rightView = buttonStack
        self.leftViewMode = .always
        self.makeCornerRound(radius: 5)
        
    }
    
    func setRightView(_ type : TextFieldType) {
        switch type {
        case TextFieldType.id:
            self.rightView = buttonStack
            self.visableButton.isHidden = true
            self.rightViewMode = .whileEditing
        case TextFieldType.password:
            self.rightView = buttonStack
            self.rightViewMode = .whileEditing
        }
    }
    
}
