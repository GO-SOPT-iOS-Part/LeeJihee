//
//  MainViewController.swift
//  CloneTiving
//
//  Created by 지희의 MAC on 2023/05/02.
//

import UIKit

final class MainViewController: BaseViewController {
    
    //MARK: Property
    
    private let categoryTitleList = [ "홈", "실시간", "TV프로그램", "영화", "파라마운트+", "키즈" ]
    
    //MARK: UI
    
    private lazy var pageViewController  = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    
    private lazy var topNaviView = TopTabBar(categoryTitleList: categoryTitleList)
    
    private lazy var vc1: UIViewController = HomeViewController()
    
    private lazy var dataViewControllers: [UIViewController] = {
        return [vc1,LiveViewController(), TVProgramViewController(), MovieViewController(),ParaMountViewController(),KidsViewController()]
    }()
    
    //MARK: Life Cycles
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
        
    }
    
    
    //MARK: Custom Method
    
    override func setStyle() {
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .white
    }
    
    override func setLayout() {
        view.addSubviews(pageViewController.view,topNaviView)
        addChild(pageViewController)
        
        pageViewController.view.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        topNaviView.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(150)
        }
        topNaviView.layoutIfNeeded()
        topNaviView.gradientView.setGradient(color1: .black, color2: .clear)
        
        if let firstVC = dataViewControllers.first {
            pageViewController.setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
        
    }
    
    override func setDelegate() {
        pageViewController.dataSource = self
        topNaviView.delegate = self
    }
    
    override func addTarget() {
        topNaviView.circleProfileButton.addTarget(self, action: #selector(profileButtonDidTap), for: .touchUpInside)
    }
    
   
    
    
    //MARK: Action
    
    @objc func profileButtonDidTap() {
        let nextVC = SettingViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
}

extension MainViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = dataViewControllers.firstIndex(of: viewController) else { return nil }
        let previousIndex = index - 1
        if previousIndex < 0 {
            return nil
        }
        return dataViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = dataViewControllers.firstIndex(of: viewController) else { return nil }
        let nextIndex = index + 1
        if nextIndex == dataViewControllers.count {
            return nil
        }
        return dataViewControllers[nextIndex]
    }
    
}

extension MainViewController: PagingDelegate {
    func didTapPagingTabBarCell(scrollTo indexPath: IndexPath) {
        if indexPath.row >  topNaviView.currentIndex {
            pageViewController.setViewControllers([dataViewControllers[indexPath.row]], direction: .forward, animated: true)
        } else {
            pageViewController.setViewControllers([dataViewControllers[indexPath.row]], direction: .reverse, animated: true)
        }
        topNaviView.collectionView.cellForItem(at: indexPath)?.isSelected = true
    }
}
