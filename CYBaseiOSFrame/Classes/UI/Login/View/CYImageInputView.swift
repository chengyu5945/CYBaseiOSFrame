//
//  CYImageInputView.swift
//  CYBaseiOSFrame
//
//  Created by Jade on 2018/7/30.
//  Copyright © 2018年 Jade. All rights reserved.
//

import Foundation
import UIKit

class CYImageInputView: UIView {
    
    public var imageView: UIImageView!
    public var textField: UITextField!
    public var sepratorLine: UIView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    func setupSubviews() -> Void {
        imageView = UIImageView.init()
        textField = UITextField.init()
        sepratorLine = UIView.init()
        
        self.addSubview(imageView)
        self.addSubview(textField)
        self.addSubview(sepratorLine)
        
        textField.textColor = COLOR_LABEL_MIDDLE
        textField.font = FONT_NORMAL_DEFAULT
        textField.clearButtonMode = UITextFieldViewMode.whileEditing
        
        sepratorLine.backgroundColor = COLOR_SEPRATOR_LINE
        
        makeConstraints()
    }
    
    func makeConstraints() -> Void {
        
        let marginL_R = adaptedWidth(width: 33.5)
        let cellMargin:CGFloat = 21.0
        
        imageView.snp.makeConstraints { (make) in
            make.left.equalTo(marginL_R)
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize.init(width: 17, height: 22))
        }
        
        textField.snp.makeConstraints { (make) in
            make.left.equalTo(imageView.snp.right).offset(cellMargin)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-marginL_R)
        }
        
        sepratorLine.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.height.equalTo(0.5)
            make.leftMargin.equalTo(marginL_R)
            make.rightMargin.equalTo(-marginL_R)
        }
    }
}
