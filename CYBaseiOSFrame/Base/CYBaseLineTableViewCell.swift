//
//  CYBaseLineTableViewCell.swift
//  CYBaseiOSFrame
//
//  Created by Jade on 2018/7/27.
//  Copyright © 2018年 Jade. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class CYBaseLineTableViewCell: UITableViewCell {
    
    var lineBottom:UIView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
    }
    
    func setupSubviews() -> Void {
        lineBottom = UIView.init()
        self.contentView.addSubview(self.lineBottom)
        lineBottom.backgroundColor = COLOR_SEPRATOR_LINE
        
        let marginLF:CGFloat = adaptedWidth(width: 20)
        lineBottom.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
            make.leftMargin.equalTo(marginLF)
            make.rightMargin.equalTo(-marginLF)
        }
        
    }
    
}
