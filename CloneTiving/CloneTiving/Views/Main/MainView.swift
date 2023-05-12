//
//  MainView.swift
//  CloneTiving
//
//  Created by 지희의 MAC on 2023/05/02.
//

import UIKit
import SnapKit

final class MainView: BaseView {
    
    let posterDummyData = Poster.dummy()
    let contentDummyData = Contents.dummy()
    let largePosterDummyData = LargePoster.dummy()
    
    private lazy var mainCollectionView : UICollectionView = {
        let flowLayout =  createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = .black
        collectionView.contentInsetAdjustmentBehavior = .never
        
        LargePosterCollectionViewCell.register(collectionView: collectionView)
        PosterCollectionViewCell.register(collectionView: collectionView)
        LiveCollectionViewCell.register(collectionView: collectionView)
    
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.identifier)
        collectionView.dataSource = self
        return collectionView
    }()
    
    
    
    
    
    private func setViewHierarchy() {
        self.addSubviews(mainCollectionView)
    }
    
    private func setConstraints() {
        
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

extension MainView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return largePosterDummyData.count
        } else if section == 2{
            return contentDummyData.count
        } else {
            return posterDummyData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = LargePosterCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            cell.configureCell(largePosterDummyData[indexPath.row])
            return cell
            
        } else if indexPath.section == 1 {
            let cell = PosterCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            cell.configureCell(posterDummyData[indexPath.row])
            return cell
        } else if indexPath.section == 2 {
            let cell = LiveCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            cell.configureCell(contentDummyData[indexPath.row])
            cell.rankingLabel.text = String(indexPath.row + 1)
            return cell
        } else if indexPath.section == 3 {
            let cell = PosterCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            cell.configureCell(posterDummyData[indexPath.row])
            return cell
        } else if indexPath.section == 4 {
            let cell = PosterCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            cell.configureCell(posterDummyData[indexPath.row])
            return cell
        } else if indexPath.section == 5 {
            let cell = PosterCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
            cell.configureCell(posterDummyData[indexPath.row])
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader, // 헤더일때
              let header = mainCollectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: HeaderView.identifier,
                for: indexPath
              ) as? HeaderView else {return UICollectionReusableView()}
        if indexPath.section == 2 {
            header.configure(title: "인기 LIVE 채널")
        }
        else if indexPath.section == 3 {
            header.configure(title: "마술보다 더 신비로운 영화(신비로운 영화사전님)")
        }
        else if indexPath.section == 4 {
            header.configure(title: "1화 무료! 파라마운트+ 인기 시리즈")
        }
        return header
    }
    
}


