//
//  CYStyleConst.swift
//  CYBaseiOSFrame
//
//  Created by Jade on 2018/7/29.
//  Copyright © 2018年 Jade. All rights reserved.
//

import Foundation
import UIKit

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//  rgb颜色转换 UIColor
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

//clearColor 透明色
let Clear_Color = UIColor.clear
let White_Color = UIColor.white


// rgb颜色转换（16进制->10进制）
func CY_RGBA_Color(R:CGFloat,G:CGFloat,B:CGFloat,A:CGFloat) ->UIColor {
    return UIColor.init(red: R/255.0, green: G/255.0, blue: B/255.0, alpha: A)
}

func CY_RGB_Color(R:CGFloat,G:CGFloat,B:CGFloat) ->UIColor {
    return CY_RGBA_Color(R: R, G: G, B: B, A: 1.0)
}

//16进制hex转UIColor.调用方式如：kRGBColorFromHex(0x1D1D26)
func kRGBColorFromHex(rgbValue: Int) -> (UIColor) {
    return UIColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16)) / 255.0,
                   green: ((CGFloat)((rgbValue & 0xFF00) >> 8)) / 255.0,
                   blue: ((CGFloat)(rgbValue & 0xFF)) / 255.0,
                   alpha: 1.0)
    
}


///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//  角度转弧度 弧度转角度
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////


/// 角度转弧度
///
/// - Parameter __ANGLE__: 角度
/// - Returns: 弧度值
func SC_Angle_To_Radian(__ANGLE__:CGFloat) ->CGFloat {
    return (CGFloat(Double.pi) * __ANGLE__ / 180.0)
}


/// 弧度转角度
///
/// - Parameter __RADIAN__: 弧度
/// - Returns: 角度
func SC_Radian_To_Angle(__RADIAN__:CGFloat) ->CGFloat {
    return (CGFloat(__RADIAN__ * 180 / CGFloat(Double.pi)))
}


///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//  字体 UIFont  只列举一种，其他的换名称自己可定义
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////

/// 方正黑体简体字体定义
///
/// - Parameter __SIZE__: 字体大小
/// - Returns: UIFont
func SC_Font_FZHT(size __SIZE__:CGFloat) ->UIFont {
    return UIFont.init(name: "STHeiti SC", size: __SIZE__)!
}

///////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                               //
//  设计给的常用的字体和颜色的常量定义
//                                                                                               //
///////////////////////////////////////////////////////////////////////////////////////////////////


//MARK:字体字号
let FONT_BIG_BOLD_DEFAULT = UIFont.boldSystemFont(ofSize: 18)
let FONT_NORMAL_DEFAULT = UIFont.systemFont(ofSize: 16)
let FONT_SMALL_DEFAULT = UIFont.systemFont(ofSize: 14)
let FONT_HEITI_16 = SC_Font_FZHT(size: 16)
let FONT_HEITI_18_BOLD = SC_Font_FZHT(size: 18)

//MARK:颜色
let COLOR_BLUE_MAIN = kRGBColorFromHex(rgbValue: 0x0073CF) //主色调
let COLOR_BLUE_LIGHT = kRGBColorFromHex(rgbValue: 0xC6E5FF) //浅蓝色

let COLOR_LABEL_MAIN = kRGBColorFromHex(rgbValue: 0x626262) //文字主色调
let COLOR_LABEL_MIDDLE = kRGBColorFromHex(rgbValue: 0x999999) //描述文字 略浅
let COLOR_SEPRATOR_LINE = kRGBColorFromHex(rgbValue: 0xEBEBEB) //分割线






