//
//  DelegateSecondViewController.swift
//  SOPT_iOS
//
//  Created by 지희의 MAC on 2023/04/08.
//

import UIKit
import SnapKit
// 클레스로 만드는 경우에는 상속! -> 클래스
// 프로토콜은 상속의 단점을 보완하기 위해서 만들어짐.
// 상속을 받게 된다면 모든 메소드르르 다 가져와야 함


//class가 아닌 protocol을 이용하는 이유?
//프로퍼티를 선언하면 init을 매번해야하는 불편함
//프로토콜은 선언만 클래스는 선언과 구현 모두해야함
//class로 한다면 모든 것을 미리 구현해둬야함. 데이터바인딩은 firstview 컨트롤러에서 해야하는 일인데, 클래스로 선언할 경우 클래스가 이 모든 걸 구현해둬야 함.
//스위프트는 각자의 역할을 나누는 것 각각의 뷰에 각각의 역할을 나눠두는 걸 추천한다!!


//프로토콜을 이용하면 dataBind라는 함수는 넘기는 것
//클로저를 이용한 것은 이름이 없는 함수 (클로저)를 넘기는 것
// 사실 둘은 같은 역할을 한다.

protocol DataBindProtocol: AnyObject {
    func dataBind(text: String)
}

final class DelegateSecondViewController: UIViewController {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "이름이 무엇인가요!?"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .blue
        label.textAlignment = .center
        return label
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "이름을 입력해주세요"
        textField.clearButtonMode = .whileEditing
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1
        return textField
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("뒤로가기!", for: .normal)
        button.backgroundColor = .yellow
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self,
                         action: #selector(popSecondViewController),
                         for: .touchUpInside)
        return button
    }()
    
    weak var delegate: DataBindProtocol?
    
    typealias handler = ((String) -> (Void))
        
    var completionHandler: handler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        setLayout()
    }
}

private extension DelegateSecondViewController {
    
    func style() {
        
        view.backgroundColor = .white
    }
    
    func setLayout() {
        
        [nameLabel, nameTextField, backButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        nameLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(10)
            
        }
        
        
        
        NSLayoutConstraint.activate([nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
                                     nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)])
        
        NSLayoutConstraint.activate([nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
                                     nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     nameTextField.heightAnchor.constraint(equalToConstant: 48)])
        
        NSLayoutConstraint.activate([backButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
                                     backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     backButton.heightAnchor.constraint(equalToConstant: 48)])
    }
    
    @objc
    func popSecondViewController() {
        
        guard let text = nameTextField.text else { return }
        
        completionHandler?(text)
        
        self.navigationController?.popViewController(animated: true)
    }
}
