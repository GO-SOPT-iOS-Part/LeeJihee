//
//  LiveCollectionViewCell.swift
//  CloneTiving
//
//  Created by 지희의 MAC on 2023/05/03.
//

import UIKit
import SnapKit

final class LiveCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "liveCollectionViewCell"
    
    let thumbnailImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.backgroundColor = .orange
        imageView.makeCornerRound(radius: 3)
        return imageView
    }()
    
    lazy var rankingLabel : UILabel = {
        let label = UILabel()
        label.font = .tvingBold(ofSize: 19)
        label.textColor = .white
        return label
    }()

    lazy var chanelLabel: UILabel = {
        let label = UILabel()
        label.text = "Mnet"
        label.font = .tvingRegular(ofSize: 10)
        label.textColor = .white
        return label
    }()
    
    lazy var contentTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .tvingRegular(ofSize: 10)
        label.text = "Mnet"
        label.textColor = .tvingGray3
        return label
    }()
    
    lazy var rateLabel: UILabel = {
        let label = UILabel()
        label.text = "Mnet"
        label.font = .tvingRegular(ofSize: 10)
        label.textColor = .tvingGray3
        return label
    }()
    
    private lazy var infoStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubviews(chanelLabel,contentTitleLabel,rateLabel)
        stackView.axis = .vertical
        stackView.spacing = 2
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI(){
        setViewHierarchy()
        setConstraints()
    }
    
    private func setViewHierarchy() {
        contentView.addSubviews(thumbnailImageView, rankingLabel, infoStackView )
    }
    
    private func setConstraints() {
        thumbnailImageView.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(82)
        }
        rankingLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(5)
            $0.top.equalTo(thumbnailImageView.snp.bottom).offset(8)
        }
        infoStackView.snp.makeConstraints{
            $0.leading.equalTo(rankingLabel.snp.trailing).offset(5)
            $0.top.equalTo(thumbnailImageView.snp.bottom).offset(12)
        }
    }
    
    func configureCell(_ content: Contents){
        chanelLabel.text = content.chanelName
        contentTitleLabel.text = content.contentName
        rateLabel.text = String(content.rate) + "%"
    }
}
