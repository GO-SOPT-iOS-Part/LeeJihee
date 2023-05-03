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
    
    let ticketAttachImg: NSTextAttachment = {
        let textAttachment = NSTextAttachment()
        textAttachment.image = Images.ticketImage
        return textAttachment
    }()
    
    lazy var ticketLabel: UILabel = {
        let label = UILabel()
        let ticketImage = NSAttributedString(attachment: ticketAttachImg)
        let ticketString = NSAttributedString(string: " 나의 이용권")
        label.labelWithImg(composition: ticketImage,ticketString)
        label.font = .tvingRegular(ofSize: 13)
        label.textColor = .tvingGray3
        return label
    }()
    
    let coinAttachImg: NSTextAttachment = {
        let textAttachment = NSTextAttachment()
        textAttachment.image = Images.coinImage
        return textAttachment
    }()
    
    lazy var tvingCashLabel: UILabel = {
        let label = UILabel()
        let ticketString = NSAttributedString(string: " 티빙 캐시")
        let ticketAttachImg = NSAttributedString(attachment: coinAttachImg)
        label.labelWithImg(composition: ticketAttachImg,ticketString)
        
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
        stackView.addArrangedSubviews(ticketLabel,ticketStateLabel)
        stackView.spacing = 40
        return stackView
    }()
    
    private lazy var tvingCashStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubviews(tvingCashLabel,tvingCashStateLabel)
        stackView.spacing = 170
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
        stackView.alignment = .fill
        stackView.backgroundColor = .tvingGray4
        stackView.makeCornerRound(radius: 10)
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
        self.addSubviews(profileStackView, profileSwitchButton, userinfoStackView, subscribeLabelView)
        subscribeLabelView.addSubview(subscribeLabel)
        
    }
    
    func setConstraints() {
        
       [ticketLabel, tvingCashLabel].forEach{
           $0.snp.makeConstraints{
               $0.width.equalTo(150)
               $0.height.equalTo(45)
           }
       }
       
       
       profileStackView.snp.makeConstraints{
           $0.top.equalToSuperview().offset(35)
           $0.leading.equalToSuperview().inset(24)
       }
       
       profileSwitchButton.snp.makeConstraints{
           $0.top.equalToSuperview().offset(65)
           $0.leading.equalTo(profileStackView.snp.trailing).offset(100)
           $0.trailing.equalToSuperview().inset(24)
       }
       
       userinfoStackView.snp.makeConstraints{
           $0.top.equalTo(profileStackView.snp.bottom).offset(29)
           $0.height.equalTo(92)
           $0.leading.trailing.equalTo(10)
       }
       
       subscribeLabelView.snp.makeConstraints{
           $0.top.equalTo(userinfoStackView.snp.bottom).offset(12)
           $0.leading.trailing.equalTo(10)
           $0.height.equalTo(60)
       }
       
       subscribeLabel.snp.makeConstraints{
           $0.leading.equalToSuperview().inset(18)
           $0.top.bottom.equalToSuperview().inset(11)
       }
    }
    
    
}
