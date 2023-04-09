//
//  Test2_SecondViewController.swift
//  SOPT_iOS
//
//  Created by 지희의 MAC on 2023/04/08.
//

import UIKit
import SnapKit

protocol CountProtocol: AnyObject {
    func countUp()
}

final class Test2_SecondViewController: UIViewController {
 
    //MARK: delegate
    weak var delegate: CountProtocol?
    
    
    //MARK: UIComponents
    private let waterCanImageView = UIImageView().then{
        $0.image = Image.wateringCanImage
    }
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "물을 얼마나 줄까요?"
        label.font = .systemFont(ofSize: 16)
        label.textColor = colors.titleColor
        label.textAlignment = .center
        return label
    }()
    
    private lazy var touchButton =  CustomButton("눌러줘!").then{
        $0.addTarget(self,
                     action: #selector(countTapButton),
                     for: .touchUpInside)
    }
    
    private lazy var backButton = CustomButton("이전으로~").then{
        $0.addTarget(self,
                         action: #selector(popSecondViewController),
                         for: .touchUpInside)
    }
    
    typealias handler = ((String) -> (Void))
    
    var completionHandler: handler?
    
    //MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        setLayout()
    }
}

//MARK: Custom Method

extension Test2_SecondViewController {
    
    func style() {
        
        view.backgroundColor = .white
    }
    
    func setLayout() {
        
        view.addSubviews(waterCanImageView,titleLabel,touchButton,backButton)
        
        waterCanImageView.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(titleLabel.snp.top).offset(-20)
            $0.width.height.equalTo(100)
        }
        
        titleLabel.snp.makeConstraints{
            $0.center.equalToSuperview()
        }
        
        touchButton.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.width.equalTo(100)
            $0.centerX.equalToSuperview()
        }
        backButton.snp.makeConstraints{
            $0.top.equalTo(touchButton.snp.bottom).offset(10)
            $0.width.equalTo(touchButton.snp.width)
            $0.centerX.equalToSuperview()
        }
        
    }
    
    //MARK: Action
    
    @objc func countTapButton() {
        delegate?.countUp()
    }
    
    @objc
    func popSecondViewController() {
        self.navigationController?.popViewController(animated: true)
    }
}
