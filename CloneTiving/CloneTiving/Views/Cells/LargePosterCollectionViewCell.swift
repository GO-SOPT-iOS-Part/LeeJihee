//
//  LargePosterCollectionViewCell.swift
//  CloneTiving
//
//  Created by 지희의 MAC on 2023/05/04.
//

import UIKit
import Kingfisher

final class LargePosterCollectionViewCell: UICollectionViewCell, CollectionViewCellReuseProtocol {
    
    let largePosterImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let bottomGradientView: UIView = {
        let view = UIView()
        return view
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .tvingRegular(ofSize: 12)
        label.textColor = .white
        label.numberOfLines = 8
        label.textAlignment = .left
        return label
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
        self.addSubviews(largePosterImageView,bottomGradientView,descriptionLabel)
    }
    
    private func setConstraints() {
        largePosterImageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        bottomGradientView.snp.makeConstraints{
            $0.bottom.leading.trailing.equalToSuperview()
            $0.height.equalTo(100)
        }
        descriptionLabel.snp.makeConstraints{
            $0.bottom.leading.equalToSuperview()
            $0.width.equalTo(200)
        }
        
        bottomGradientView.layoutIfNeeded()
        bottomGradientView.setGradient(color1: .clear, color2: .black)
        
    }
    
    func configureCell(_ largePoster: LargePoster){
        largePosterImageView.image = largePoster.image
    }
    
    func configureCellApi(_ result: ResultArrayDataModel) {
        let posterURL = URL(string: "https://image.tmdb.org/t/p/w500\(result.posterPath)")
        largePosterImageView.kf.setImage(with: posterURL)
    }
    
}
