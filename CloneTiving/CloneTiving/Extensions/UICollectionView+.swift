//
//  UICollectionView+.swift
//  CloneTiving
//
//  Created by 지희의 MAC on 2023/05/12.
//
import UIKit
//
//extension UICollectionView {
//    func setCompositionalLayout(for sections: [Section], cellSpacing: CGFloat) {
//        let layout = UICollectionViewCompositionalLayout { (sectionIndex, environment) -> NSCollectionLayoutSection? in
//            guard let section = Section(rawValue: sectionIndex) else { return nil }
//            switch section {
//            case .poster:
//                return self.createPosterLayout()
//            case .largePoster:
//                return self.createMainLayout()
//            case .liveContent:
//                return self.createBasicLayout()
//            case .bannerAd:
//                return self.createBannerAdLayout()
//            }
//        }
//
//        self.collectionViewLayout = layout
//        self.contentInset = UIEdgeInsets(top: cellSpacing, left: 0, bottom: cellSpacing, right: 0)
//    }
//    
//    private func createMainLayout() -> NSCollectionLayoutSection {
//        let itemSize = Section.largePoster.itemSize
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//        item.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)
//        // group설정
//        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(505.0))
//        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 1)
//        // section 설정
//        let section = NSCollectionLayoutSection(group: group)
//        //스크롤 설정
//        section.orthogonalScrollingBehavior = .paging
//        
//        return section
//    }
//    
//    
//    private func createPosterLayout() -> NSCollectionLayoutSection {
//        // 각 item의 사이즈 설정 ( width: 98, height: 146 )
//        let itemSize = Section.poster.itemSize
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 4)
//        
//        // group설정
//        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(200.0))
//        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 4)
//        // section 설정
//        let section = NSCollectionLayoutSection(group: group)
//        
//        //헤더뷰 레이아웃
//        section.boundarySupplementaryItems = [.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)]
//        //스크롤 설정
//        section.orthogonalScrollingBehavior = .continuous
//        
//        return section
//    }
//    
//    private func createBasicLayout() -> NSCollectionLayoutSection {
//        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(160), heightDimension: .absolute(80))
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//        item.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)
//        
//        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(160.0))
//        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 3)
//        
//        let section = NSCollectionLayoutSection(group: group)
//        
//        section.orthogonalScrollingBehavior = .continuous
//        
//        section.boundarySupplementaryItems = [.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)]
//        
//        return section
//    }
//    
//    private func createBannerAdLayout() -> NSCollectionLayoutSection {
//        let itemSize = Section.bannerAd.itemSize
//        let item = NSCollectionLayoutItem(layoutSize: itemSize)
//        item.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)
//        
//        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(45.0))
//        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 2)
//        
//        let section = NSCollectionLayoutSection(group: group)
//        
//        section.orthogonalScrollingBehavior = .continuous
//        
//        section.boundarySupplementaryItems = [.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)]
//        
//        return section
//    }
//    
//    
//}
//
