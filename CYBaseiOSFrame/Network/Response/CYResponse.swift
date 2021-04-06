//
//  CYResponse.swift
//  CYBaseiOSFrame
//
//  Created by Jade on 2018/7/31.
//  Copyright © 2018年 Jade. All rights reserved.
//

import Foundation
import ObjectMapper

class CYResponse<T: Mappable>: Mappable {
    var data: T?
    var reasoncode: String?
    var reasonmsg: String?

    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        data            <- map["data"]
        reasoncode      <- map["reasoncode"]
        reasonmsg       <- map["reasonmsg"]

    }
}

