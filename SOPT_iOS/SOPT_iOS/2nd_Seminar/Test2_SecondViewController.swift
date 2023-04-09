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
    
    weak var delegate: CountProtocol?
    
//    var count = 0
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "횟수는!?"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .blue
        label.textAlignment = .center
        return label
    }()
    
    private lazy var touchButton: UIButton = {
        let button = UIButton()
        button.setTitle("눌러줘!", for: .normal)
        button.backgroundColor = .yellow
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self,
                         action: #selector(countTapButton),
                         for: .touchUpInside)
        return button
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("이전으로", for: .normal)
        button.backgroundColor = .yellow
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self,
                         action: #selector(popSecondViewController),
                         for: .touchUpInside)
        return button
    }()
    
    typealias handler = ((String) -> (Void))
    
    var completionHandler: handler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        setLayout()
    }
}

extension Test2_SecondViewController {
    
    func style() {
        
        view.backgroundColor = .white
    }
    
    func setLayout() {
        
        [titleLabel,touchButton, backButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        titleLabel.snp.makeConstraints{
            $0.center.equalToSuperview()
        }
        
        touchButton.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.width.equalTo(backButton.snp.width)
            $0.centerX.equalToSuperview()
        }
        backButton.snp.makeConstraints{
            $0.top.equalTo(touchButton.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
        
    }
    
    @objc func countTapButton() {
        print("gggg")
        delegate?.countUp()
    }
    
    @objc
    func popSecondViewController() {
        
        
        self.navigationController?.popViewController(animated: true)
    }
}
