//
//  HeaderView.swift
//  CloneTiving
//
//  Created by 지희의 MAC on 2023/05/03.
//

import UIKit

final class HeaderView: UICollectionReusableView  {
    static let identifier = "headerView"
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "티빙에서 꼭 봐야하는 콘텐츠"
        label.font = .tvingBold(ofSize: 15)
        label.textColor = .white
        return label
    }()
    
    private lazy var moreButton: UIButton = {
        let button = UIButton()
        button.setTitle("전체보기 >", for: .normal)
        button.titleLabel?.font = .tvingRegular(ofSize: 13)
        button.setTitleColor(.tvingGray3, for: .normal)
        return button
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setViewHierarchy()
        setConstraints()
    }
    
    private func setViewHierarchy() {
        self.addSubviews(titleLabel,moreButton)
    }
    
    private func setConstraints() {
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(5)
            $0.leading.equalToSuperview().offset(5)
        }
        
        moreButton.snp.makeConstraints{
            $0.top.equalToSuperview().offset(5)
            $0.trailing.equalToSuperview().inset(5)
        }
    }
    
     func configure(title: String) {
        titleLabel.text = title
    }
    
}
