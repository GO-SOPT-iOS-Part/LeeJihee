//
//  SettingView.swift
//  CloneTiving
//
//  Created by 지희의 MAC on 2023/05/01.
//

import UIKit
import SnapKit

final class SettingView: BaseView {
    
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
        let ticketString = NSAttributedString(string: "나의 이용권")
        let ticketImage = NSAttributedString(attachment: ticketAttachImg)
        label.labelWithImg(composition: ticketImage, ticketString)
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
        let ticketString = NSAttributedString(string: "티빙 캐시")
        let ticketImage = NSAttributedString(attachment: coinAttachImg)
        label.labelWithImg(composition: ticketImage, ticketString)
        label.textColor = .tvingGray3
        return label
    }()
    
    let ticketStateLabel: UILabel = {
        let label = UILabel()
        label.text = "사용중인 이용권이 없습니다."
        label.font = .tvingRegular(ofSize: 13)
        label.textColor = .tvingGray3
        return label
    }()
    
    let tvingCashStateLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = .tvingBold(ofSize: 13)
        label.textColor = .white
        return label
    }()

    private lazy var ticketStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubviews(ticketLabel,ticketStateLabel)
        stackView.spacing = 20
        return stackView
    }()
    
    private lazy var profileStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubviews(profileImageView, nickNameLabel)
        stackView.spacing = 20
        return stackView
    }()
    
    private lazy var tvingCashStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubviews(tvingCashLabel,tvingCashStateLabel)
        return stackView
    }()
    
    lazy var userinfoStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubviews(ticketStackView, tvingCashStackView)
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.backgroundColor = .tvingGray4
        stackView.makeCornerRound(radius: 10)
        return stackView
    }()
    
    func setViewHierarchy() {
        self.addSubviews(profileStackView, profileSwitchButton, userinfoStackView)
        
    }
    
    func setConstraints() {
        
        
        profileStackView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(123)
            $0.leading.equalToSuperview().inset(24)
        }
        
        profileSwitchButton.snp.makeConstraints{
            $0.top.equalToSuperview().offset(152)
            $0.leading.equalTo(profileStackView.snp.trailing).offset(100)
            $0.trailing.equalToSuperview().inset(24)
        }
        
        userinfoStackView.snp.makeConstraints{
            $0.top.equalTo(profileStackView.snp.bottom).offset(29)
            $0.leading.trailing.equalTo(10)
        }
    }
    
    
}
