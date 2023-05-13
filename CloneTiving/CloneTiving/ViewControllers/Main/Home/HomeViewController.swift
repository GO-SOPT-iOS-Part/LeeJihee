//
//  HomeViewController.swift
//  CloneTiving
//
//  Created by 지희의 MAC on 2023/05/05.
//

import UIKit


final class HomeViewController: BaseViewController {
    
    //MARK: Property
    var resultArray: [ResultArrayDataModel] = [] {
        didSet {
            mainView.mainCollectionView.reloadData()
        }
    }
    
    var index: Int = 0
    
    let posterDummyData = Poster.dummy()
    let contentDummyData = Contents.dummy()
    let largePosterDummyData = LargePoster.dummy()
    
    //MARK: UI
    
    let mainView = MainView()
    
    //MARK: LifeCycles
    override func viewWillAppear(_ animated: Bool) {
        didUseGetMethod()
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func loadView() {
        self.view = mainView

    }
    
    
    override func setDelegate() {
        mainView.mainCollectionView.dataSource = self
    }
    
    func didUseGetMethod() {
        GetService.shared.getService(from: "\(Config.baseURL)/3/movie/popular?api_key=\(Bundle.main.apiKey)&language=ko&page=1",
                                         isTokenUse: false) {
                (data: Response?, error) in
                guard let data = data else {
                    return
                }
                for i in 0..<data.results.count {
                    self.resultArray.append(.init(posterPath: data.results[i].posterPath, title: data.results[i].title, overview: data.results[i].overview))
                }
            }
        }
    
}


extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return resultArray.count
        } else if section == 2{
            return contentDummyData.count
        } else {
            return resultArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = LargePosterCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
           
          //  cell.configureCell(largePosterDummyData[indexPath.row])
            cell.configureCellApi(resultArray[indexPath.item])
            return cell
            
        } else if indexPath.section == 1 {
            let cell = PosterCollectionViewCell.dequeueReusableCell(collectionView: collectionView, indexPath: indexPath)
           // cell.configureCell(posterDummyData[indexPath.row])
            cell.configureCellApi(result: resultArray[indexPath.item])
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
              let header = mainView.mainCollectionView.dequeueReusableSupplementaryView(
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
