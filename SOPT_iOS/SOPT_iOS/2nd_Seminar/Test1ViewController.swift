//
//  Test1ViewController.swift
//  SOPT_iOS
//
//  Created by 지희의 MAC on 2023/04/08.
//

import UIKit
import SnapKit
import Then

class Test1ViewController: UIViewController {
    private let Color: [UIColor] = [.yellow,.green,.black,.blue]
    
    private let yelloRectView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    private let greenRectView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    private let blackRectView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private let blueRectView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setLayout()
    }
    
}

private extension Test1ViewController {
    func style() {
        view.backgroundColor = .white
    }
    
    func setLayout() {
        
        view.addSubviews(yelloRectView,greenRectView,blackRectView,blueRectView)
 
        yelloRectView.snp.makeConstraints{
            $0.leading.top.equalToSuperview()
            $0.bottom.equalTo(greenRectView.snp.top)
            $0.width.equalTo((UIScreen.main.bounds.width)/2)
            $0.height.equalTo(greenRectView.snp.height)
            print("view1")
        }
        
        greenRectView.snp.makeConstraints{
            $0.trailing.equalToSuperview()
            $0.width.equalTo((UIScreen.main.bounds.width)/2)
            $0.top.equalTo(yelloRectView.snp.bottom)
            $0.bottom.equalTo(blackRectView.snp.top)
            print("view2")
        }
        
        blackRectView.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.width.equalTo((UIScreen.main.bounds.width)/2)
            $0.top.equalTo(greenRectView.snp.bottom)
            $0.bottom.equalTo(blueRectView.snp.top)
            $0.height.equalTo(greenRectView.snp.height)
            print("view3")
        }
        blueRectView.snp.makeConstraints{
            $0.trailing.equalToSuperview()
            $0.width.equalTo((UIScreen.main.bounds.width)/2)
            $0.top.equalTo(blackRectView.snp.bottom)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(greenRectView.snp.height)
            print("view4")
        }
    }
}
