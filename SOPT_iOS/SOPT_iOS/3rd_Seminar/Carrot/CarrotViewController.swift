//
//  TableViewController.swift
//  SOPT_iOS
//
//  Created by 지희의 MAC on 2023/04/22.
//

import UIKit

class CarrotViewController : BaseViewController {
    private let tableView = UITableView()
    private let dummy = Carrot.dummy()
    
    
    override func setLayout() {
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaInsets)
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    override func setStyle() {
        tableView.do {
            $0.register(CarrotTableViewCell.self, forCellReuseIdentifier: CarrotTableViewCell.identifier)
            $0.rowHeight = 120
            $0.delegate = self
            $0.dataSource = self
        }
    }
}

extension CarrotViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CarrotTableViewCell.identifier, for: indexPath) as? CarrotTableViewCell else { return UITableViewCell() }
        
        cell.configureCell(dummy[indexPath.row])
        
        return cell
    }
}

