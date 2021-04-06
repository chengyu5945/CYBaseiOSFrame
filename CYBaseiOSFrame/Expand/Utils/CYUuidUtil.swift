//
//  CYUuidUtil.swift
//  CYBaseiOSFrame
//
//  Created by Jade on 2018/10/8.
//  Copyright © 2018年 Jade. All rights reserved.
//

import Foundation

private var UUIDStr : NSString?

class CYUuidUtil {
    
    static func getUUID() -> String {
        
        let UUIDDate = SSKeychain.passwordData(forService: CY_KEY_CHAIN_PWD, account: CY_KEY_CHAIN_ACCOUNT)
        
        if UUIDDate != nil {
            UUIDStr = NSString(data: UUIDDate!, encoding: String.Encoding.utf8.rawValue)
        }
        
        if(UUIDStr == nil){
            
            UUIDStr = UUID().uuidString as NSString
            SSKeychain.setPassword(UUIDStr! as String, forService: CY_KEY_CHAIN_PWD, account: CY_KEY_CHAIN_ACCOUNT)
            
        }
        return UUIDStr! as String
        
    }
    
    static func getToken() -> String {
        
        let uuid = CYUuidUtil.getUUID()
        let uuidDecode = uuid.replacingOccurrences(of: "-", with: "").lowercased()

        let interval = NSDate.init().timeIntervalSince1970
        
        let ticket = SECRET_SALT + String(format: "%.0f", interval * 1000) + uuidDecode
        let tk = DataEncoding.Encode_AES_ECB(strToEncode: ticket)
        return tk
    }
}



