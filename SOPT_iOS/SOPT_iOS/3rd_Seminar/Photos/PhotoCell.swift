//
//  PhotoCell.swift
//  SOPT_iOS
//
//  Created by 지희의 MAC on 2023/04/22.
//
import UIKit

import SnapKit
import Then

final class PhotoCell: UICollectionViewCell {
    
    var isTapped: Bool = false {
        didSet {
            tapped()
        }
    }
    
    var handler: (() -> (Void))?
    
    static let identifier = "PhotoCell"
    
    let photoImage = UIImageView()
    let button = UIButton()
    
    override init(frame: CGRect) {
           super.init(frame: frame)
       
        setStyle()
        setLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setStyle() {
        
        button.do {
            $0.tintColor = .white
            $0.addTarget(self,
                         action: #selector(heartButtonTapped),
                         for: .touchUpInside)
        }
    }
    
    func setLayout() {
        
        contentView.addSubview(photoImage)
        contentView.addSubview(button)
        
        photoImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        button.snp.makeConstraints {
            $0.leading.bottom.equalToSuperview().inset(5)
            $0.size.equalTo(30)
        }
    }
    
    func tapped() {
        let image = isTapped ? "heart.fill" : "heart"
        button.setImage(UIImage(systemName: image), for: .normal)
    }
    
    @objc
    func heartButtonTapped() {
        handler?()
    }
    
    func configureCell(_ photo: Photo) {
        
        photoImage.image = photo.image
        isTapped = photo.heartTapped
    }
}
