//
//  CYLoginResp.swift
//  CYBaseiOSFrame
//
//  Created by Jade on 2018/9/14.
//  Copyright © 2018年 Jade. All rights reserved.
//

import Foundation
import ObjectMapper

class CYLoginResp: Mappable {
    
    var token: String?
    var id: String?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        token <- map["token"]
        id <- map["id"]
    }
    
    
}
