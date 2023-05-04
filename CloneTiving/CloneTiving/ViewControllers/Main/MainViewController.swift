//
//  MainViewController.swift
//  CloneTiving
//
//  Created by 지희의 MAC on 2023/05/02.
//

import UIKit

class MainViewController: BaseViewController {
    

    
    //MARK: UI
    let mainView = MainView()
    
    
    
    lazy var vc1: UIViewController = {
        let vc = UIViewController()
        vc.view.backgroundColor = .red
        
        return vc
    }()
    
    lazy var vc2: UIViewController = {
        let vc = UIViewController()
        vc.view.backgroundColor = .green
        
        return vc
    }()
    
    lazy var vc3: UIViewController = {
        let vc = UIViewController()
        vc.view.backgroundColor = .blue
        
        return vc
    }()
    
    lazy var dataViewControllers: [UIViewController] = {
        return [vc1, vc2, vc3]
    }()
    
    //MARK: LifeCycles
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func loadView() {
        self.view = mainView
        addTarget()
    }
    
    //MARK: Custom Method
    override func setStyle() {
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .white
    }
    
    override func setDelegate() {
        mainView.mainCollectionView.delegate = self
    }
    
    func addTarget() {
        mainView.circleProfileButton.addTarget(self, action: #selector(profileButtonDidTap), for: .touchUpInside)
    }
    
    //MARK: Action
    @objc func profileButtonDidTap() {
        let nextViewController = SettingViewController()
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}

extension MainViewController: UICollectionViewDelegate {
    
}



