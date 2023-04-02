//
//  SecondViewController.swift
//  SOPT_iOS
//
//  Created by 지희의 MAC on 2023/04/01.
//

import UIKit

final class SecondViewController: UIViewController {
    
    // 대부분의 프로퍼티는 private으로 선언이 되어있음 -> 함수 이용해서 접근하기
    
    private var name: String?
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "제 이름은요!"
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("뒤로가기", for: .normal)
        button.setTitleColor(.purple, for: .normal)
        button.setTitleColor(.darkGray, for: .focused)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(backButtonTab), for: .touchUpInside)
        return button
    }()
    
    
    func dataBind(name: String) {
            nameLabel.text = name
        }  
    
    override func viewDidLoad() {
            super.viewDidLoad()
            style()
            setLayout()
        }
    
    @objc func backButtonTab(_ button: UIButton){
        if navigationController == nil{
            self.dismiss(animated: true)
        } else{
            self.navigationController?.popViewController(animated: true)
        }
        
    }
    
    
}

private extension SecondViewController {
    
    func style() {
        self.navigationController?.navigationBar.topItem?.title = ""
        view.backgroundColor = .white
    }
    
    func setLayout() {
        
        [nameLabel, backButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
    
        
        NSLayoutConstraint.activate([backButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
                                     backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     backButton.heightAnchor.constraint(equalToConstant: 48)])
    }
}
