//
//  TabBarCollectionView.swift
//  CloneTiving
//
//  Created by 지희의 MAC on 2023/05/04.
//

import UIKit

protocol PagingDelegate: AnyObject {
    func didTapPagingTabBarCell(scrollTo indexPath: IndexPath)
}




class TopTabBar: UIView {
    
    var cellHeight: CGFloat { 44.0 }
    var currentIndex: Int = 0
    
    
    private var categoryTitleList: [String]
    
    weak var delegate: PagingDelegate?
    
    let gradientView: UIView = {
        let view = UIView()
        view.setGradient(color1: .black, color2: .clear)
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
    
    lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal // scrollDirection의 기본값은 .vertical이다
        let inset: CGFloat = 16.0
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - inset*2.0)/5.0, height: cellHeight)
        layout.sectionInset = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
        layout.minimumLineSpacing = 0.0
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        
        collectionView.register(TabCollectionViewCell.self, forCellWithReuseIdentifier: TabCollectionViewCell.identifier)
        
        return collectionView
    }()
    
    init(categoryTitleList: [String]) {
        self.categoryTitleList = categoryTitleList
        super.init(frame: .zero)
        setupLayout()
        gradientView.setGradient(color1: .black, color2: .clear)
        collectionView.selectItem(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: []) // 처음에 첫 탭에 포커싱
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        self.addSubviews(gradientView,tvingLogoButton, circleProfileButton,collectionView)
        
        gradientView.snp.makeConstraints{
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
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(tvingLogoButton.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(45)
        }
        
        
    }
}

extension TopTabBar: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didTapPagingTabBarCell(scrollTo: indexPath)
        
        currentIndex = indexPath.item
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TabCollectionViewCell.identifier, for: indexPath) as? TabCollectionViewCell else {
            return .zero
        }
        cell.titleLabel.text = categoryTitleList[indexPath.row]
        cell.titleLabel.sizeToFit()
        let cellWidth = cell.titleLabel.frame.width + 20
        return CGSize(width: cellWidth, height: 30)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
            let indexPath = IndexPath(row: Int(targetContentOffset.pointee.x / UIScreen.main.bounds.width), section: 0)
            collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
        }
    
}

extension TopTabBar: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryTitleList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TabCollectionViewCell.identifier, for: indexPath) as? TabCollectionViewCell else { return UICollectionViewCell() }
        cell.setupView(title: categoryTitleList[indexPath.row])
        return cell
    }
}

