//
//  CYDocumentsConst.swift
//  CYBaseiOSFrame
//
//  Created by Jade on 2018/7/29.
//  Copyright © 2018年 Jade. All rights reserved.
//

import Foundation
import UIKit


///////////////////////////////////////////////////////////////////////////////////////////////////
//
//  catch缓存文件夹和Documents文件夹
//
///////////////////////////////////////////////////////////////////////////////////////////////////

let CYUserDefault = UserDefaults.standard


/// Cache缓存文件夹
let cacheDir = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last

/// Documents文件夹
let documentsDir = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).first


///////////////////////////////////////////////////////////////////////////////////////////////////
//
//  图片  UIImage 加载本地  以及初始化
//
///////////////////////////////////////////////////////////////////////////////////////////////////

//读取本地文件/图片 （文件名，后缀名）
func loadImage(imageName __imgName__:String,imgExtension __imgExt__:String) -> UIImage? {
    var fileName = __imgName__;
    if iPhone6plus() {
        fileName = fileName.appending("@3x")
    } else {
        fileName = fileName.appending("@2x")
    }
    let filePath:String? = Bundle.main.path(forResource: fileName, ofType: __imgExt__)
    if (filePath == nil) {
        return nil
    }
    
    return UIImage.init(contentsOfFile: filePath!)
}

//定义UIImage对象 （文件名）  png格式

func loadPNGImage(imageName __imgName__:String) -> UIImage? {
    return loadImage(imageName: __imgName__, imgExtension: "png")
}
