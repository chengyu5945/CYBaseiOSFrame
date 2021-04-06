//
//  NoData.swift
//  CYBaseiOSFrame
//
//  Created by Jade on 2018/10/15.
//  Copyright © 2018年 Jade. All rights reserved.
//

import Foundation
import ObjectMapper

class NoData: Mappable {
    var data: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        data <- map["data"]
    }
    
}
