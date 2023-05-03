//
//  SettingViewController.swift
//  CloneTiving
//
//  Created by 지희의 MAC on 2023/05/01.
//

import UIKit
import SnapKit

class SettingViewController: BaseViewController {
    
    private let settingView = SettingTableView()
    private let settingHeaderView = SettingHeaderView()
    private let logOutButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그아웃", for: .normal)
        button.setTitleColor(.tvingGray2, for: .normal)
        button.titleLabel?.font = .tvingRegular(ofSize: 14)
        button.makeBorder(width: 1, color: .tvingGray4)
        button.makeCornerRound(radius: 5)
        return button
    }()
    
    
    let cellIdentifier = "settingCell"
    let settingTexts: [String] = ["이용권", "1:1 문의내역", "예약알림", "회원정보 수정", "프로모션 정보 수신 동의"]
    let settingTexts2: [String] = ["공지사항", "이벤트", "고객센터", "티빙 알아보기"]
    
    override func loadView() {
        navigationController?.navigationBar.isHidden = false
        self.view = settingView
        
    }

    override func setStyle() {
        navigationController?.navigationBar.backgroundColor = .black
        navigationItem.rightBarButtonItem = settingView.barButtonStack
        tabBarController?.tabBar.isHidden = true
    }
    
    override func setDelegate() {
        settingView.settingTableView.delegate = self
        settingView.settingTableView.dataSource = self
    }
}
   

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? settingTexts.count : settingTexts2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SettingTableViewCell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath) as! SettingTableViewCell
        cell.settingLabel.text = indexPath.section == 0 ? settingTexts[indexPath.row] : settingTexts2[indexPath.row]
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = settingHeaderView
        return header
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        var footer = UIView()
        if section == 1{
            footer = logOutButton
            return footer
        }
        return footer
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            // Header 영역 크기

            return section == 0 ? 370 : 0
        }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return section == 1 ? 55 : 30
    }
}
