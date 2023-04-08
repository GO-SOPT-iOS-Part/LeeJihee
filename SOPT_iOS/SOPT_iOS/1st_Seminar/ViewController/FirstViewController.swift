//
//  FirstViewController.swift
//  SOPT_iOS
//
//  Created by 지희의 MAC on 2023/04/01.
//

import UIKit

final class FirstViewController: UIViewController {
    
    //MARK: - UI Components
    private let greetingText = "솝트에 오신 걸 환영합니다🥰"
    private lazy var greetingLabel: UILabel = {
        let label = UILabel()
        label.text = greetingText
        label.font = .systemFont(ofSize: 15, weight: .light)
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
    }()
    private  lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "이름이 무엇인가요?"
        label.font = .systemFont(ofSize: 20, weight: .heavy)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "이름을 입력해주세요"
        textField.textAlignment = .center
        return textField
    }()
    
    
    private lazy var presentButton: UIButton = {
        let button = UIButton()
        button.setTitle("present!", for: .normal)
        button.backgroundColor = .purple
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self,
                         action:
                            #selector(presentButtonTapped),
                         for: .touchUpInside)
        button.makeCornerRound(radius: 20)
        button.makeBorder(width: 2, color: .white)
        button.makeShadow(radius: 3, offsetX: 0,offsetY: 0, opacity: 0.2)
        return button
    }()
    
    
    private lazy var pushButton: UIButton = {
        let button = UIButton()
        button.setTitle("push!", for: .normal)
        button.backgroundColor = .yellow
        button.backgroundColor = .purple
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self,
                         action: #selector(pushButtonTapped),
                         for: .touchUpInside)
        button.makeCornerRound(radius: 20)
        button.makeBorder(width: 2, color: .white)
        button.makeShadow(radius: 3, offsetX: 0,offsetY: 0, opacity: 0.2)
        return button
    }()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setLayout()
    }
    
    
    //MARK: - function implementation
    
    
    private func setGreetingLabel(_ empty: Bool){
        if empty {
            greetingLabel.text = "이름을 먼저 입력해주세요!😡"
            greetingLabel.textColor = .red
        }else{
            greetingLabel.text = greetingText
            greetingLabel.textColor = .darkGray
        }
    }
    
    
    func presentToSecondViewController() {
        guard let name = nameTextField.text else { return }
        let empty = name.isEmpty
        let secondViewController = SecondViewController()
        
        if name.isEmpty {
            setGreetingLabel(empty)
        } else {
            secondViewController.dataBind(name: name)
            secondViewController.modalPresentationStyle = .fullScreen
            secondViewController.modalTransitionStyle = .crossDissolve
            setGreetingLabel(empty)
            self.present(secondViewController, animated: true)
        }
    }
    
    func pushToSecondViewController() {
        guard let name = nameTextField.text else { return }
        let empty = name.isEmpty
        let secondViewController = SecondViewController()
        
        if empty {
            setGreetingLabel(empty)
        } else {
            secondViewController.dataBind(name: name)
            setGreetingLabel(empty)
            
            self.navigationController?.navigationBar.tintColor = .purple
            self.navigationController?.pushViewController(secondViewController, animated: true)
            
        }
    }
    
    //MARK: -objc Method
    
    @objc
    func presentButtonTapped() {
        
        presentToSecondViewController()
    }
    
    @objc
    func pushButtonTapped() {
        
        pushToSecondViewController()
    }
    
    
}

//MARK: Set Layout

private extension FirstViewController {
    
    func style() {
        view.backgroundColor = .white
    }
    
    func setLayout() {
        
        [greetingLabel,nameLabel, nameTextField,presentButton, pushButton].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([greetingLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 280),
                                     greetingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     greetingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)])
        
        NSLayoutConstraint.activate([nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
                                     nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)])
        
        NSLayoutConstraint.activate([nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
                                     nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     nameTextField.heightAnchor.constraint(equalToConstant: 48)])
        
        NSLayoutConstraint.activate([presentButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
                                     presentButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     presentButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     presentButton.heightAnchor.constraint(equalToConstant: 48)])
        
        NSLayoutConstraint.activate([pushButton.topAnchor.constraint(equalTo: presentButton.bottomAnchor, constant: 20),
                                     pushButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     pushButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     pushButton.heightAnchor.constraint(equalToConstant: 48)])
    }
}

