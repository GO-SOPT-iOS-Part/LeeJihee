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
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30)
        label.textColor = .white
        label.text = "gggggg"
        label.backgroundColor = .black
        label.makeCornerRound(radius: 15)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("다음으로!", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.makeCornerRound(radius: 10)
        button.addTarget(self,
                         action: #selector(pushToSecondViewController),
                         for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        setLayout()
    }
}

private extension Test2_FirstViewController {
    
    func style() {
        
        view.backgroundColor = .white
      
    }
    
    func setLayout() {
        
        [nameLabel, nextButton].forEach {
            
            view.addSubview($0)
        }

        nameLabel.snp.makeConstraints{
            $0.center.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        nextButton.snp.makeConstraints{
            $0.top.equalTo(nameLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(50)
        }
    }
    
    @objc
    func pushToSecondViewController() {
        
        let secondViewController = Test2_SecondViewController()
        secondViewController.delegate = self
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
}

extension Test2_FirstViewController: CountProtocol {
    func countUp() {
        count += 1
        print(count)
        if count<10 {
            nameLabel.text = "더 눌러봐.. \(count)"
        } else {
            nameLabel.text = "충분히 눌렀네요! \(count)"
        }
    }
    
    
}
