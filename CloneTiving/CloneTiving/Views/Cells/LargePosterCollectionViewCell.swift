//
//  LargePosterCollectionViewCell.swift
//  CloneTiving
//
//  Created by 지희의 MAC on 2023/05/04.
//

import UIKit

final class LargePosterCollectionViewCell: UICollectionViewCell, CollectionViewCellReuseProtocol {
    
    let largePosterImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
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
        self.addSubview(largePosterImageView)
    }
    
    private func setConstraints() {
        largePosterImageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    func configureCell(_ largePoster: LargePoster){
        largePosterImageView.image = largePoster.image
    }
    
}
