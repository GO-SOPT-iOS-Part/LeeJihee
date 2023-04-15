//
//  BottomSheetViewController.swift
//  CloneTiving
//
//  Created by 지희의 MAC on 2023/04/14.
//

import UIKit
import SnapKit

protocol DataBindProtocol: AnyObject {
    func dataBind(text: String)
}


class BottomSheetViewController: UIViewController {
    
    var defaultHeight: CGFloat = UIScreen.main.bounds.height / 2
    weak var delegate: DataBindProtocol?
    
    //MARK: UIComponent
    private let dimmedView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.7)
        return view
    }()
    
    private let bottomSheetView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.clipsToBounds = true
        return view
    }()
    
    private let nickNameLabel = UILabel().then{
        $0.text = "닉네임을 입력해주세요"
        $0.font = .tvingRegular(ofSize: 24)
    }
    
    private lazy var nickNameTextField = UITextField().then{
        $0.placeholder = "닉네임을 입력해주세요"
        $0.makeCornerRound(radius: 5)
        $0.backgroundColor = .tvingGray4
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        $0.leftViewMode = .always
        $0.clearButtonMode = .whileEditing
        $0.textColor = .white
    }
    
    private lazy var settingButton = UIButton().then{
        $0.setTitle("저장하기", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.makeCornerRound(radius: 5)
        $0.backgroundColor = .tvingRed
        $0.addTarget(self, action: #selector(dimmedViewTapped), for: .touchUpInside)
        
    }
    
    @objc func settingButtonDidTap(){
        
    }
    
    //MARK: life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
        let dimmedTap = UITapGestureRecognizer(target: self, action: #selector(dimmedViewTapped(_:)))
        dimmedView.addGestureRecognizer(dimmedTap)
        dimmedView.isUserInteractionEnabled = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showBottomSheet()
    }
    
    //MARK: Custom Method
    
    private func showBottomSheet() {
        bottomSheetView.snp.remakeConstraints{
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalToSuperview().inset(defaultHeight)
        }
        UIView.animate(withDuration: 1.0, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
        
    }
    
    private func hideBottomSheetAndGoBack() {
        bottomSheetView.snp.remakeConstraints { (remake) in
            remake.top.equalTo(view.snp.bottom)
            remake.leading.trailing.equalToSuperview()
        }
        
        UIView.animate(withDuration: 1.0, animations: {
            self.view.layoutIfNeeded()
            self.dimmedView.alpha = 0.0
        }){ _ in
            if self.presentingViewController != nil {
                self.dismiss(animated: false, completion: nil)
            }
        }
    }
    
    //MARK: Action
    @objc private func dimmedViewTapped(_ tapRecognizer: UITapGestureRecognizer) {
        
        if let text = nickNameTextField.text {
            delegate?.dataBind(text: text)
        }
        hideBottomSheetAndGoBack()
    }
}

private extension BottomSheetViewController {
    func setUI(){
        setViewHierarchy()
        setLayout()
    }
    
    func setViewHierarchy(){
        view.addSubview(dimmedView)
        view.addSubview(bottomSheetView)
        bottomSheetView.addSubviews(nickNameLabel,nickNameTextField,settingButton)
    }
    
    func setLayout(){
        dimmedView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        bottomSheetView.snp.makeConstraints{
            $0.height.equalTo(0)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        nickNameLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(50)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        nickNameTextField.snp.makeConstraints{
            $0.top.equalTo(nickNameLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        settingButton.snp.makeConstraints{
            $0.bottom.equalToSuperview().inset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
    }
}
