//
//  HomeViewController.swift
//  CloneTiving
//
//  Created by 지희의 MAC on 2023/05/05.
//

import UIKit

final class HomeViewController: BaseViewController {

    let mainView = MainView()
    
    //MARK: LifeCycles
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func loadView() {
        self.view = mainView
    }
    
}
