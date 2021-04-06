//
//  CYBaseTableViewController.swift
//  CYBaseiOSFrame
//
//  Created by Jade on 2018/7/27.
//  Copyright © 2018年 Jade. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class CYBaseTableViewController: CYBaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSubviews();
        makeContains();
    }
    
    override func initSubviews() {
        super.initSubviews()
        
        tableView = UITableView.init()
        self.view.addSubview(tableView)
        tableView.alwaysBounceVertical = false
        tableView.alwaysBounceHorizontal = false
        tableView.delegate = self;
        tableView.dataSource = self;
        
        makeContains();
    }
    
    override func makeContains() {
        super.makeContains();
        tableView.snp.makeConstraints { (make)-> Void in
            make.edges.equalToSuperview()
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let baseCellIdentifier = "CYBaseCellIdentifier"
        var cell = tableView.dequeueReusableCell(withIdentifier: baseCellIdentifier)
        if cell == nil {
            cell = CYBaseLineTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: baseCellIdentifier)
        }
        
        return cell!
        
    }
    
}
