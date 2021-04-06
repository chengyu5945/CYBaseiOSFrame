//
//  CYCheckProtocol.swift
//  CYBaseiOSFrame
//
//  Created by Jade on 2018/9/17.
//  Copyright © 2018年 Jade. All rights reserved.
//

import Foundation

enum Result {
    case ok(message:String)
    case empty
    case failed(message:String)
}

extension Result {
    var isValid:Bool {
        switch self {
        case .ok:
            return true
        default:
            return false
        }
    }
}

extension Result {
    var description: String {
        switch self {
        case let .ok(message):
            return message
        case .empty:
            return ""
        case let .failed(message):
            return message
        }
    }
}
