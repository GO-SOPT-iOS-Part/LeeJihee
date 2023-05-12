//
//  TabCollectionViewCell.swift
//  CloneTiving
//
//  Created by 지희의 MAC on 2023/05/04.
//

import UIKit
import SnapKit

final class TabCollectionViewCell: UICollectionViewCell {
    static let identifier = "TabBarCell"
    
     lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 15.0, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var underline: UIView = {
        let view = UIView()
        
        view.backgroundColor = .white
        view.alpha = 0.0
        
        return view
    }()
    
    override var isSelected: Bool {
        // Cell이 선택 되었을 때 설정
        didSet {
            underline.alpha = isSelected ? 1.0 : 0.0
        }
    }
    
    func setupView(title: String) {
        setupLayout()
        titleLabel.text = title
    }
    
    
}


private extension TabCollectionViewCell {
    func setupLayout() {
        addSubviews(titleLabel,underline)
        titleLabel.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
        }
        underline.snp.makeConstraints { make in
            make.height.equalTo(3.0)
            make.top.equalTo(titleLabel.snp.bottom).offset(4.0)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
