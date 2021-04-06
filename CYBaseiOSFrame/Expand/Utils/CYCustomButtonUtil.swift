//
//  CYCustomButtonUtil.swift
//  CYBaseiOSFrame
//
//  Created by Jade on 2018/7/30.
//  Copyright © 2018年 Jade. All rights reserved.
//

/**
 这里定义若干button的样式
 */

import Foundation
import UIKit

class SCCustomButtonUtil: NSObject {
    
    class func blueRoundBigButton(title: String) -> UIButton {
        let width = kScreenWidth - adaptedWidth(width: 32.5) * 2
        let button: UIButton = UIButton.init(type: UIButtonType.custom)
        let normalBg = CYDrawUtil.drawButtonBg(width: width, height: 48, color: COLOR_BLUE_MAIN)
        let disableBg = CYDrawUtil.drawButtonBg(width: width, height: 48, color: COLOR_BLUE_LIGHT)

        button.setBackgroundImage(normalBg, for: UIControlState.normal)
        button.setBackgroundImage(disableBg, for: UIControlState.disabled)
        button.setTitle(title, for: UIControlState.normal)
        button.setTitleColor(White_Color, for: UIControlState.normal)
        return button
    }
    
}
