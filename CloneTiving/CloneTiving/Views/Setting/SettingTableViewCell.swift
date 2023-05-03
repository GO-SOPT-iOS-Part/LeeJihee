//
//  SettingTableCell.swift
//  CloneTiving
//
//  Created by 지희의 MAC on 2023/05/02.
//

import UIKit
import SnapKit

final class SettingTableViewCell: UITableViewCell {
    static let identifier = "SettingCell"
    
    private let containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor = .black
        return containerView
    }()
    
    let settingLabel: UILabel = {
        let label = UILabel()
        label.font = .tvingRegular(ofSize: 15)
        label.textColor = .tvingGray2
        return label
    }()
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.setImage(Images.nextImage, for: .normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(self.containerView)
        contentView.addSubview(settingLabel)
        self.backgroundColor = .black
        self.selectionStyle = .none
        self.accessoryView = nextButton
        
        self.contentView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        self.settingLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
}
