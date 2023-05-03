//
//  MainTabBarViewController.swift
//  CloneTiving
//
//  Created by 지희의 MAC on 2023/05/04.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = .white
        tabBar.backgroundColor = .black
        tabBar.barTintColor = .black

        let firstTab = UINavigationController.init(rootViewController: MainViewController())
        let secondTab = ReleasedViewController()
        let thridTab = SearchViewController()
        let fourthTab = RecordViewController()
        firstTab.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        secondTab.tabBarItem = UITabBarItem(title: "공개예정", image: UIImage(systemName: "play.rectangle.on.rectangle"), selectedImage: UIImage(systemName: "play.rectangle.on.rectangle.fill"))
        thridTab.tabBarItem = UITabBarItem(title: "검색", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass.fill"))
        fourthTab.tabBarItem = UITabBarItem(title: "기록", image: UIImage(systemName: "timer"), selectedImage: UIImage(systemName: "timer.fill"))
        // 위 같이, 필요한 Tab을 추가해주세요!
        self.viewControllers = [firstTab, secondTab, thridTab, fourthTab]
    }
    
    
    
}

