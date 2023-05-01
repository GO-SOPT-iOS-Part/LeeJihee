//
//  SettingViewController.swift
//  CloneTiving
//
//  Created by 지희의 MAC on 2023/05/01.
//

import UIKit
import SnapKit

class SettingViewController: BaseViewController {
    private let settingView = SettingView()
    override func setStyle() {
        view.addSubview(settingView)
    }
    
    override func setLayout() {
        settingView.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
        }
        
    }
}
