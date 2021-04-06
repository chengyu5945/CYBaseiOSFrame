//
//  CYUser.swift
//  CYBaseiOSFrame
//
//  Created by Jade on 2018/7/30.
//  Copyright © 2018年 Jade. All rights reserved.
//

import Foundation

import RealmSwift

class CYUser: Object {
    
    @objc dynamic var id = 0
    @objc dynamic var token = ""
    @objc dynamic var phone = ""
    
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
