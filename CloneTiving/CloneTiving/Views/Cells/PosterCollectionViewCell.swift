//
//  PosterCollectionViewCell.swift
//  CloneTiving
//
//  Created by 지희의 MAC on 2023/05/03.
//

import UIKit

final class PosterCollectionViewCell: UICollectionViewCell, CollectionViewCellReuseProtocol {
    
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    private lazy var titleLabel: UILabel =  {
        let label = UILabel()
        label.font = .tvingRegular(ofSize: 12)
        label.textColor = .tvingGray2
        label.numberOfLines = 3
        return label
    }()
    
    
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
        contentView.addSubviews(posterImageView, titleLabel)
    }
    
    func setLayout() {
        posterImageView.snp.makeConstraints{
            $0.leading.trailing.top.equalToSuperview().offset(5)
            $0.width.equalTo(102)
            $0.height.equalTo(146)
        }
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(posterImageView.snp.bottom).offset(2)
            $0.width.equalTo(90)
            $0.leading.equalTo(posterImageView.snp.leading)
        }
    }
    
    func configureCell(_ content: Poster){
        posterImageView.image = content.image
        titleLabel.text = content.title
    }
    func configureCellApi(result: ResultArrayDataModel) {
        let posterURL = URL(string: "https://image.tmdb.org/t/p/w500\(result.posterPath)")
        posterImageView.kf.setImage(with: posterURL)
        titleLabel.text = result.title
    }
}
