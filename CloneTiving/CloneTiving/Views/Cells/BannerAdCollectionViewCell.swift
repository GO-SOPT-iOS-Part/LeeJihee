//
//  BannerAdCollectionView.swift
//  CloneTiving
//
//  Created by 지희의 MAC on 2023/05/12.
//

import UIKit
import SnapKit

final class BannerAdCollectionViewCell: UICollectionViewCell, CollectionViewCellReuseProtocol {
    let imageView = UIImageView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI(){
        self.addSubview(imageView)
        
        imageView.backgroundColor = .blue
        
        imageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
}
