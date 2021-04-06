//
//  CYHomeViewController.swift
//  CYBaseiOSFrame
//
//  Created by Jade on 2018/7/30.
//  Copyright © 2018年 Jade. All rights reserved.
//

import Foundation
import UIKit

class CYHomeViewController: CYBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "主界面"
        setupSubviews()
    }
    
    func setupSubviews() -> Void {
        var label: UILabel!
        label = UILabel.init()
        label.textAlignment = NSTextAlignment.center
        label.textColor = COLOR_LABEL_MAIN
        label.font = FONT_NORMAL_DEFAULT;
        label.text = "主界面"
        label.snp.makeConstraints({ (make) in
            make.edges.equalToSuperview()
        })
    }
}
