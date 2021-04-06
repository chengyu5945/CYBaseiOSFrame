//
//  CYDigestUtil.swift
//  CYBaseiOSFrame
//
//  Created by Jade on 2018/9/30.
//  Copyright © 2018年 Jade. All rights reserved.
//

import Foundation
import CryptoSwift

let sKey = "yxlm012345678910"
let sIv = "012345678910yxlm"

class DataEncoding: NSObject {
    
    //AES-ECB128加密
    static func Encode_AES_ECB(strToEncode:String) -> String {
        do {
            let aes = try AES(key: sKey, iv: sIv, padding: Padding.pkcs7)
            let encrypt = try aes.encrypt(strToEncode.bytes)
            return encrypt.toBase64()!
            
        }  catch {
            // some error
            return ""
        }
        
    }
    
    
    //AES-ECB128解密
    static func Decode_AES_ECB(strToDecode:String) -> String {
        do {
            //decode base64
            let data = NSData(base64Encoded: strToDecode, options: NSData.Base64DecodingOptions.init(rawValue: 0))
            let bytes = [UInt8](data! as Data)
            let aes = try AES(key: sKey, iv: sIv, padding: Padding.pkcs7)
            let decrypted = try aes.decrypt(bytes)
            return String(bytes: decrypted, encoding: .utf8)!
            
        } catch {
            // some error
            return ""
        }
    }
    
    static func EncodeMD5(str: String) -> String {
        let md5 = MD5()
        let encrypt = md5.calculate(for: str.bytes)
        return Data(bytes: encrypt).toHexString()
        
    }
        
}

