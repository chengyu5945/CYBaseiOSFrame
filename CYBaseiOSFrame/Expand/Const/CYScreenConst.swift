//
//  CYScreenConst.swift
//  CYBaseiOSFrame
//
//  Created by Jade on 2018/7/29.
//  Copyright © 2018年 Jade. All rights reserved.
//

import Foundation
import UIKit

///////////////////////////////////////////////////////////////////////////////////////////////////
//
//  1.App 屏幕相关   Frame   Bounds
//
///////////////////////////////////////////////////////////////////////////////////////////////////


let kScreenBounds                         = UIScreen.main.bounds                    /* 屏幕Bounds */
let kScreenSize                           = kScreenBounds.size                      /* 屏幕大小 */
let kScreenWidth:CGFloat                  = kScreenSize.width                       /* 屏幕宽度 */
let kScreenHeight:CGFloat                 = kScreenSize.height                      /* 屏幕高度 */
let kNavigationHeight :CGFloat            = UINavigationBar.appearance().frame.size.height  /* 导航条高度 44 */
let kStatuBarHeight   :CGFloat            = UIApplication.shared.statusBarFrame.size.height  /* 状态栏高度  20*/
let kNavigationHeightAndStatuBarHeight    = kNavigationHeight + kStatuBarHeight      //64

//屏幕分辨率比例
let screenScale:CGFloat = UIScreen.main.responds(to: #selector(getter: UIScreen.main.scale)) ? UIScreen.main.scale : 1.0

//不同屏幕尺寸字体适配（375，667是因为目前苹果开发一般用IPHONE6做中间层 如果不是则根据实际情况修改）
//相对于iPhone6的宽度比例
let screenWidthRatio:CGFloat =  kScreenWidth / 375;
let screenHeightRatio:CGFloat = kScreenHeight / 667;

//根据传入的值算出乘以比例之后的值
func adaptedWidth(width:CGFloat) ->CGFloat {
    return CGFloat(ceil(Float(width))) * screenWidthRatio
}

func adaptedHeight(height:CGFloat) ->CGFloat {
    return CGFloat(ceil(Float(height))) * screenHeightRatio
}

//判断是那种设备

/*
 4  4s
 */
func iPhone4() ->Bool {
    return UIScreen.main.bounds.size.height == 480.0
}

/*
 5  5s
 */
func iPhone5() ->Bool {
    return UIScreen.main.bounds.size.height == 568.0
}

/*
 6  6s  7
 */
func iPhone6() ->Bool {
    return UIScreen.main.bounds.size.height == 667.0
}

/*
 6plus  6splus  7plus
 */
func iPhone6plus() ->Bool {
    return UIScreen.main.bounds.size.height == 736.0
}

///////////////////////////////////////////////////////////////////////////////////////////////////
//
//  2. App Version / Info Plist  设备系统版本
//
///////////////////////////////////////////////////////////////////////////////////////////////////

/* 设备系统相关  */
let kiOSVersion:String        = UIDevice.current.systemVersion         /* iOS系统版本 */
let osType:String             = UIDevice.current.systemName + UIDevice.current.systemVersion




/* app版本  以及设备系统版本 */
let infoDictionary            = Bundle.main.infoDictionary
let kAppName: String?         = infoDictionary!["CFBundleDisplayName"] as? String        /* App名称 */
let kAppVersion: String?      = infoDictionary!["CFBundleShortVersionString"] as? String /* App版本号 */
let kAppBuildVersion: String? = infoDictionary!["CFBundleVersion"] as? String            /* Appbuild版本号 */
let kAppBundleId: String?     = infoDictionary!["CFBundleIdentifier"] as? String                 /* app bundleId */
let platformName: String?     = infoDictionary!["DTPlatformName"] as? String  //平台名称（iphonesimulator 、 iphone）


/* 检查系统版本 */

//版本号相同
func systemVersionEqual(version:String) ->Bool {
    return UIDevice.current.systemVersion == version
}

//系统版本高于等于该version  测试发现只能传入带一位小数点的版本号  不然会报错    具体原因待探究
func systemVersionGreaterThan(version:String) ->Bool{
    return UIDevice.current.systemVersion.compare(version, options: .numeric, range: version.startIndex..<version.endIndex, locale: Locale(identifier:version)) != ComparisonResult.orderedAscending
}


//系统版本低于等于该version  测试发现只能传入带一位小数点的版本号  不然会报错    具体原因待探究
func systemVersionLessThan(version:String) ->Bool{
    return UIDevice.current.systemVersion.compare(version, options: .numeric, range: version.startIndex..<version.endIndex, locale: Locale(identifier:version)) != ComparisonResult.orderedDescending
}
