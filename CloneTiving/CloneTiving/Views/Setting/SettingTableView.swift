//
//  SettingView.swift
//  CloneTiving
//
//  Created by 지희의 MAC on 2023/05/01.
//

import UIKit
import SnapKit

final class SettingTableView: BaseView {

    //MARK: UIComponents
    lazy var buttonStack : UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubviews(notificationButton,settingButton)
        return stackView
    }()
    
    lazy var notificationButton: UIButton = {
        let button = UIButton()
        button.setImage(Images.notificationImage, for: .normal)
        return button
    }()
    
    lazy var settingButton: UIButton = {
        let button = UIButton()
        button.setImage(Images.settingImage, for: .normal)
        return button
    }()
    
    let settingTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 150
        tableView.backgroundColor = .black
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViewHierarchy()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: setUI
    func setViewHierarchy() {
        self.addSubview(settingTableView)
        
    }
    
    func setConstraints() {
        
        settingTableView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        
    }
}
