//
//  BaseView.swift
//  SOPT_iOS
//
//  Created by 지희의 MAC on 2023/04/22.
//

import UIKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStyle() {}
    func setLayout() {}
}
