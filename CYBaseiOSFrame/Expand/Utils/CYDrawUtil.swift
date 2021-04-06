//
//  CYDrawUtils.swift
//  CYBaseiOSFrame
//
//  Created by Jade on 2018/7/30.
//  Copyright © 2018年 Jade. All rights reserved.
//

/**
 绘制圆角图片、绘制按钮等
 */
import Foundation
import UIKit

class CYDrawUtil: NSObject {
    class func getImageFromView(view:UIView) ->UIImage {
        
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, screenScale)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
        
    }
    
    class func drawButtonBg(width:CGFloat, height:CGFloat, color:UIColor) -> UIImage {
        let view: UIView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: width, height: height))
        view.backgroundColor = color
        view.layer.cornerRadius = height / 2.0
        return getImageFromView(view: view)
    }
    
}
