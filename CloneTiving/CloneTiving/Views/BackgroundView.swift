//
//  BackgroundView.swift
//  CloneTiving
//
//  Created by 지희의 MAC on 2023/04/14.
//

import UIKit

final class BackgroundView: UIView {
    private let backgroundView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 10)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(backgroundView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
