//
//  TestViewController.swift
//  SOPT_iOS
//
//  Created by 지희의 MAC on 2023/04/21.
//

import UIKit
import SnapKit
import Then

class TestViewController: UIViewController {

    private let rectView = UIView().then{
        $0.backgroundColor = .blue
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setLayout()
    }
    private func setLayout(){
        view.addSubview(rectView)
        rectView.snp.makeConstraints{
            $0.edges.equalToSuperview().offset(30)
        }
    }
}


