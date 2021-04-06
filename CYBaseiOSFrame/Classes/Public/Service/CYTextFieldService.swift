//
//  CYTextFieldService.swift
//  CYBaseiOSFrame
//
//  Created by Jade on 2018/9/19.
//  Copyright © 2018年 Jade. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class CYTextFieldService {
    
    // 验证用户名
    func validationUserName(_ name:String) -> Observable<Result> {
        if name.count == 0 { // 当字符串为空的时候，什么也不做
            return Observable.just(Result.empty)
        }
        
        if name.count < 6 {
            return Observable.just(Result.failed(message: "用户名长度至少为6位"))
        }
        
        return Observable.just(Result.ok(message: "用户名可用"))
    }

    func validationPassword(_ password:String) -> Result {
        if password.count == 0 {
            return Result.empty
        }
        
        if password.count < 6 {
            return .failed(message: "密码长度至少为6位")
        }
        
        return .ok(message: "密码可用")
    }
}


