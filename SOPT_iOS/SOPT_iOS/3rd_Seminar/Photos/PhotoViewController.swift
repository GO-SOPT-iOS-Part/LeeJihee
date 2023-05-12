//
//  PhotoViewController.swift
//  SOPT_iOS
//
//  Created by 지희의 MAC on 2023/04/22.
//

import UIKit

class PhotoViewController : BaseViewController {
    private lazy var collectionView = UICollectionView(frame: .zero,
                                                       collectionViewLayout: UICollectionViewFlowLayout())
    
    private var dummyCase = Photo.dummy() {
            didSet {
                self.collectionView.reloadData()
            }
        }
    
    override func setStyle() {
        
        collectionView.do {
            $0.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.identifier)
            //스크롤바를 보여주지 않겠다.
            $0.showsVerticalScrollIndicator = false
            $0.delegate = self
            $0.dataSource = self
        }
    }
    
    override func setLayout() {
        
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaInsets)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}

extension PhotoViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dummyCase.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.identifier, for: indexPath) as? PhotoCell else { return UICollectionViewCell() }
        
        cell.configureCell(dummyCase[indexPath.item])

        cell.handler = { [weak self] in
                    guard let self else { return }
                    self.dummyCase[indexPath.item].heartTapped.toggle()
                }
            
        
        return cell
    }
}

//오토레이아웃을 지정해주는 코드
extension PhotoViewController: UICollectionViewDelegateFlowLayout {
    
    // size - 말 그대로 cell 하나의 size를 리턴해요.
    // minimumLineSpacingForSectionAt - 섹션간 줄 사이의 간격! 위아래 !
    // minimumInteritemSpacingForSectionAt - 아이템 사이의 좌우 간격!
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (UIScreen.main.bounds.width - 6) / 3 , height: (UIScreen.main.bounds.width - 6) / 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 3
    }
}
