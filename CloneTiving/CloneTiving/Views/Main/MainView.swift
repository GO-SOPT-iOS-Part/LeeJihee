//
//  MainView.swift
//  CloneTiving
//
//  Created by 지희의 MAC on 2023/05/02.
//

import UIKit
import SnapKit

final class MainView: BaseView {
    
    private let categoryTitleList = [ "홈", "실시간", "TV프로그램", "영화", "파라마운트+", "키즈" ]
    
    let posterDummyData = Poster.dummy()
    let contentDummyData = Contents.dummy()
    let largePosterDummyData = LargePoster.dummy()

    
    
    lazy var mainCollectionView : UICollectionView = {
        let flowLayout =  createLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.isScrollEnabled = true
        collectionView.backgroundColor = .black
        collectionView.register(LargePosterCollectionViewCell.self, forCellWithReuseIdentifier: LargePosterCollectionViewCell.identifier)
        collectionView.register(PosterCollectionViewCell.self, forCellWithReuseIdentifier: PosterCollectionViewCell.identifier)
        collectionView.register(LiveCollectionViewCell.self, forCellWithReuseIdentifier: LiveCollectionViewCell.identifier)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.identifier)
        collectionView.dataSource = self
        return collectionView
    }()
    
    private lazy var tabBarView = TabBarView(categoryTitleList: categoryTitleList)
    
    let gradientView: UIView = {
        let view = UIView()
        view.setGradient(color1: .tvingGray2, color2: .clear)
        return view
    }()
    
    let gradientImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Images.gradientImage
        
        return imageView
    }()
    
    lazy var tvingLogoButton: UIButton = {
        let button = UIButton()
        button.setImage(Images.whiteLogoImage, for: .normal)
        return button
    }()
    
    lazy var circleProfileButton: UIButton = {
        let button = UIButton()
        button.setImage(Images.circleProfileImage, for: .normal)
        return button
    }()
    
    
    lazy var posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Images.poster1Image
        imageView.bringSubviewToFront(gradientImageView)
        return imageView
    }()
    
    
    
    func setViewHierarchy() {
        self.addSubviews(mainCollectionView,gradientImageView,tvingLogoButton, circleProfileButton, tabBarView)
    }
    
    func setConstraints() {
        
        tabBarView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(tvingLogoButton.snp.bottom).offset(5)
            $0.height.equalTo(45)
        }
        
        mainCollectionView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        
        gradientImageView.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        tvingLogoButton.snp.makeConstraints{
            $0.top.equalToSuperview().offset(58)
            $0.leading.equalToSuperview().offset(11)
        }
        
        circleProfileButton.snp.makeConstraints{
            $0.top.equalToSuperview().offset(55)
            $0.trailing.equalToSuperview().inset(11)
        }
    }
    
    func createMainLayout() -> NSCollectionLayoutSection {
        // 각 item의 사이즈 설정 ( width: 98, height: 146 )
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(375), heightDimension: .absolute(498))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)
        // group설정
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(505.0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        // section 설정
        let section = NSCollectionLayoutSection(group: group)

        //스크롤 설정
        section.orthogonalScrollingBehavior = .continuous

        return section
    }
    
    
    func createPosterLayout() -> NSCollectionLayoutSection {
        // 각 item의 사이즈 설정 ( width: 98, height: 146 )
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(98.0), heightDimension: .absolute(146.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        
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
    
    func createBasicLayout() -> NSCollectionLayoutSection {
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
    func createLayout() -> UICollectionViewCompositionalLayout {
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
            guard let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: LargePosterCollectionViewCell.identifier, for: indexPath) as? LargePosterCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configureCell(largePosterDummyData[indexPath.row])
            return cell
            
        } else if indexPath.section == 1 {
            guard let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: PosterCollectionViewCell.identifier, for: indexPath) as? PosterCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configureCell(posterDummyData[indexPath.row])
            return cell
        } else if indexPath.section == 2 {
            
            guard let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: LiveCollectionViewCell.identifier, for: indexPath) as? LiveCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configureCell(contentDummyData[indexPath.row])
            cell.rankingLabel.text = String(indexPath.row + 1)
            return cell
        } else if indexPath.section == 3 {
            guard let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: PosterCollectionViewCell.identifier, for: indexPath) as? PosterCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configureCell(posterDummyData[indexPath.row])
            return cell
        } else if indexPath.section == 4 {
            guard let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: PosterCollectionViewCell.identifier, for: indexPath) as? PosterCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configureCell(posterDummyData[indexPath.row])
            return cell
        } else if indexPath.section == 5 {
            guard let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: PosterCollectionViewCell.identifier, for: indexPath) as? PosterCollectionViewCell else {
                return UICollectionViewCell()
            }
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
            return header
    }
    
}


