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
    
    
    init(_ text: String,  color: UIColor = Colors.oliveGreen, radius: CGFloat = 15){
        super.init(frame: .zero)
        setButtonStyle(text,color,radius)
    }
    
    private func setButtonStyle(_ text: String, _ color: UIColor = Colors.oliveGreen, _ radius: CGFloat = 15) {
        self.backgroundColor = color
        self.setTitle(text, for: .normal)
        self.makeCornerRound(radius: radius)
        self.setTitleColor(.white, for: .normal)
    }
    

}
