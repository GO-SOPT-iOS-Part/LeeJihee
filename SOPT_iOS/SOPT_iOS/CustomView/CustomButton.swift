//
//  CutomButton.swift
//  SOPT_iOS
//
//  Created by 지희의 MAC on 2023/04/09.
//

import UIKit
import Then

class CustomButton: UIButton {
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    init(_ text: String){
        super.init(frame: .zero)
        setButtonStyle(text)
    }
    
    private func setButtonStyle(_ text: String) {
        self.backgroundColor = colors.oliveGreen
        self.setTitle(text, for: .normal)
        self.makeCornerRound(radius: 15)
        self.setTitleColor(.white, for: .normal)
    }

}
