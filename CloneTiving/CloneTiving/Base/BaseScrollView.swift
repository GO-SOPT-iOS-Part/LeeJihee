//
//  BaseScrollView.swift
//  CloneTiving
//
//  Created by 지희의 MAC on 2023/05/02.
//

import UIKit

class BaseScrollView: UIScrollView {


    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayouts()
        configure()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure() {}
    private func setLayouts() {
        setViewHierarchy()
        setConstraints()
    }
    
    func setViewHierarchy() {}
    func setConstraints() {}
}
