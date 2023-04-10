//
//  Test2_FirstViewController.swift
//  SOPT_iOS
//
//  Created by 지희의 MAC on 2023/04/08.
//

import UIKit
import SnapKit


final class Test2_FirstViewController: UIViewController {
    
    var count = 0
    
    //MARK: UIcomponents
    
    private let plantImageView = UIImageView().then{
        $0.image = Image.sproutImage
    }
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "화분에 물주기"
        label.font = .systemFont(ofSize: 24)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var nextButton = CustomButton("다음으로!", radius: 10).then{
        $0.addTarget(self,
                      action: #selector(nextButtonDidTap),
                      for: .touchUpInside)
    }
    
    //MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        setLayout()
    }
}

//MARK: Custom Method
private extension Test2_FirstViewController {
    
    func style() {
        
        view.backgroundColor = .white
      
    }
    
    func setLayout() {
        
        [plantImageView, nameLabel, nextButton].forEach {
            
            view.addSubview($0)
        }
        
        plantImageView.snp.makeConstraints{
            $0.height.width.equalTo(UIScreen.main.bounds.width / 4)
            $0.bottom.equalTo(nameLabel.snp.top).offset(-20)
            $0.centerX.equalToSuperview()
        }

        nameLabel.snp.makeConstraints{
            $0.center.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        nextButton.snp.makeConstraints{
            $0.top.equalTo(nameLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(150)
        }
    }
    
    @objc
    func nextButtonDidTap() {
        count = 0
        let secondViewController = Test2_SecondViewController()
        secondViewController.delegate = self
        self.present(secondViewController, animated: true)
    }
}

extension Test2_FirstViewController: CountProtocol {
    
    func countUp() {
        count += 1
        if count<10 {
            plantImageView.image = Image.deadImage
            nameLabel.text = "더 눌러봐.. \(count)"
            nameLabel.textColor = Colors.deadGreen
        } else {
            plantImageView.image = Image.plantImage
            nameLabel.text = "충분히 눌렀네요! \(count)"
            nameLabel.textColor = Colors.oliveGreen
        }
    }
    
    
}
