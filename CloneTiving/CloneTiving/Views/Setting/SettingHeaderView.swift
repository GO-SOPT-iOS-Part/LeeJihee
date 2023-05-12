//
//  SettingHeaderView.swift
//  CloneTiving
//
//  Created by 지희의 MAC on 2023/05/02.
//

import UIKit

final class SettingHeaderView: BaseView {
    
    
    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Images.profileImage
        return imageView
    }()
    
    let nickNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Doosan"
        label.font = .tvingRegular(ofSize: 17)
        label.textColor = .white
        return label
    }()
    
    lazy var profileSwitchButton: UIButton = {
        let button = UIButton()
        button.setTitle("프로필 전환", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .tvingRegular(ofSize: 10)
        button.makeCornerRound(radius: 5)
        button.makeBorder(width: 1, color: .white)
        return button
    }()
    
    let darkView: UIView = {
       let view = UIView()
        view.backgroundColor = .tvingGray4
        view.makeCornerRound(radius: 10)
        return view
    }()
    
    let ticketImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Images.ticketImage
        return imageView
    }()
    
    lazy var ticketLabel: UILabel = {
        let label = UILabel()
        label.text = "나의 이용권"
        label.font = .tvingRegular(ofSize: 13)
        label.textColor = .tvingGray3
        return label
    }()
    
    let coinImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Images.coinImage
        return imageView
    }()
    
    lazy var tvingCashLabel: UILabel = {
        let label = UILabel()
        label.text = "티빙 캐시"
        label.font = .tvingRegular(ofSize: 13)
        label.textColor = .tvingGray3
        return label
    }()
    
    let ticketStateLabel: UILabel = {
        let label = UILabel()
        label.text = "사용중인 이용권이 없습니다."
        label.font = .tvingRegular(ofSize: 13)
        label.textColor = .tvingGray3
        label.textAlignment = .center
        return label
    }()
    
    let tvingCashStateLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .tvingBold(ofSize: 13)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private lazy var ticketStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubviews(ticketImageView,ticketLabel,ticketStateLabel)
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var tvingCashStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubviews(coinImageView,tvingCashLabel,tvingCashStateLabel)
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var profileStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubviews(profileImageView, nickNameLabel)
        stackView.spacing = 20
        return stackView
    }()
    
    
    private lazy var userinfoStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubviews(ticketStackView, tvingCashStackView)
        stackView.axis = .vertical
        stackView.distribution = .equalCentering
        stackView.alignment = .fill
        return stackView
    }()
    
    private let tvnLogoAttachment: NSTextAttachment = {
        let textAttachment = NSTextAttachment()
        textAttachment.image = Images.tvnJtbcImage
        return textAttachment
    }()
    
    
    private lazy var subscribeLabel: UILabel = {
        let label = UILabel()
        let firstSubscribeString = NSAttributedString(string: "이용권을 구매하고 ")
        let subscribeImage = NSAttributedString(attachment: tvnLogoAttachment)
        let secondSubscribeString = NSAttributedString(string: " 등 인기 TV프로그램과\n다양한 영화 콘텐츠를 자유롭게 시청하세요!")
        label.labelWithImg(composition: firstSubscribeString, subscribeImage, secondSubscribeString)
        label.font = .tvingRegular(ofSize: 13)
        label.textColor = .tvingGray3
        label.numberOfLines = 2
        return label
    }()
    
    private let subscribeLabelView: UIView = {
        let view = UIView()
        view.backgroundColor = .tvingGray5
        view.makeCornerRound(radius: 5)
        return view
    }()
    
    func setViewHierarchy() {
        self.addSubviews(profileStackView, profileSwitchButton,darkView, subscribeLabelView)
        darkView.addSubview(userinfoStackView)
        subscribeLabelView.addSubview(subscribeLabel)
        
    }
    
    func setConstraints() {
        
        profileStackView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(35)
            $0.leading.equalToSuperview().inset(24)
        }
        
        profileSwitchButton.snp.makeConstraints{
            $0.top.equalToSuperview().offset(65)
            $0.leading.equalTo(profileStackView.snp.trailing).offset(100)
            $0.trailing.equalToSuperview().inset(24)
        }
        
        [coinImageView, ticketImageView].forEach{
            $0.snp.makeConstraints{
                $0.size.equalTo(23)
            }
        }
        
        darkView.snp.makeConstraints{
            $0.top.equalTo(profileStackView.snp.bottom).offset(29)
            $0.height.equalTo(92)
            $0.leading.trailing.equalToSuperview().inset(12)
        }
        
        userinfoStackView.snp.makeConstraints{
            $0.edges.equalToSuperview().inset(10)
        }
        
        subscribeLabelView.snp.makeConstraints{
            $0.top.equalTo(darkView.snp.bottom).offset(12)
            $0.leading.trailing.equalTo(10)
            $0.height.equalTo(60)
        }
        
        subscribeLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(18)
            $0.top.bottom.equalToSuperview().inset(11)
        }
    }
    
    
}
