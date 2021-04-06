//
//  CYVMProtocol_IO.swift
//  CYBaseiOSFrame
//
//  Created by Jade on 2018/7/30.
//  Copyright © 2018年 Jade. All rights reserved.
//

/**
 协议 输入输出流
 */
import Foundation

protocol CYVMProtocol_IO {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
    
}
