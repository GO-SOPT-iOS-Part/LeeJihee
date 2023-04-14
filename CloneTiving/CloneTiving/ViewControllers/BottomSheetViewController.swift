//
//  BottomSheetViewController.swift
//  CloneTiving
//
//  Created by 지희의 MAC on 2023/04/14.
//

import UIKit
import SnapKit

class BottomSheetViewController: UIViewController {
    
    // 1
    private let dimmedView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.7)
        return view
    }()
    
    private let bottomSheetView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        // 좌측 상단과 좌측 하단의 cornerRadius를 10으로 설정한다.
        view.layer.cornerRadius = 10
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.clipsToBounds = true
        return view
    }()
    
    private let nickNameSettingView = NicknameSettingView()
    
    // 2
    private var bottomSheetViewTopConstraint: NSLayoutConstraint!
    
    
    // 2
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        let dimmedTap = UITapGestureRecognizer(target: self, action: #selector(dimmedViewTapped(_:)))
        dimmedView.addGestureRecognizer(dimmedTap)
        dimmedView.isUserInteractionEnabled = true
    }
    
    // 3
    private func setupUI() {
        view.addSubview(dimmedView)
        view.addSubview(bottomSheetView)
        bottomSheetView.addSubview(nickNameSettingView)
        setupLayout()
    }
    
    private func setupLayout() {
        
        dimmedView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        bottomSheetView.snp.makeConstraints{
            $0.height.equalTo(0)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        nickNameSettingView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    var defaultHeight: CGFloat = UIScreen.main.bounds.height / 2
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showBottomSheet()
    }
    
    
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
        print("tap")
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
    
    @objc private func dimmedViewTapped(_ tapRecognizer: UITapGestureRecognizer) {
        hideBottomSheetAndGoBack()
    }
}
