//
//  MainView.swift
//  CloneTiving
//
//  Created by 지희의 MAC on 2023/05/02.
//

import UIKit
import SnapKit

final class MainView: BaseView {
    
    lazy var mainCollectionView : UICollectionView = {
        let flowLayout =  createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = .black
        
        LargePosterCollectionViewCell.register(collectionView: collectionView)
        PosterCollectionViewCell.register(collectionView: collectionView)
        LiveCollectionViewCell.register(collectionView: collectionView)
    
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.identifier)
        return collectionView
    }()
    
    
     func setViewHierarchy() {
        self.addSubviews(mainCollectionView)
    }
    
     func setConstraints() {
        
        mainCollectionView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    private func createMainLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(self.bounds.width), heightDimension: .absolute(498))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)
        // group설정
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(505.0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        // section 설정
        let section = NSCollectionLayoutSection(group: group)
        //스크롤 설정
        section.orthogonalScrollingBehavior = .paging
        
        return section
    }
    
    
    private func createPosterLayout() -> NSCollectionLayoutSection {
        // 각 item의 사이즈 설정 ( width: 98, height: 146 )
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(102.0), heightDimension: .absolute(146.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 4)
        
        // group설정
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(200.0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 4)
        // section 설정
        let section = NSCollectionLayoutSection(group: group)
        
        //헤더뷰 레이아웃
        section.boundarySupplementaryItems = [.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)]
        //스크롤 설정
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
    
    private func createBasicLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(160), heightDimension: .absolute(80))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(160.0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 3)
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.orthogonalScrollingBehavior = .continuous
        
        section.boundarySupplementaryItems = [.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)]
        
        return section
    }
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout {[weak self] sectionNumber, env -> NSCollectionLayoutSection? in
            
            switch sectionNumber {
            case 0:
                return self?.createMainLayout()
            case 2:
                return self?.createBasicLayout()
            default:
                return self?.createPosterLayout()
            }
        }
    }
    
}



