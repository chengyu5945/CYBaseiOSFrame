//
//  CYLoginAPI.swift
//  CYBaseiOSFrame
//
//  Created by Jade on 2018/7/31.
//  Copyright © 2018年 Jade. All rights reserved.
//

import Foundation
import Moya
import RxSwift

let LoginProvider = MoyaProvider<LoginAPI>(manager: CYWebService.manager())

public enum LoginAPI {
    case login(phone: String, password: String)
}

extension LoginAPI: TargetType {

    public var headers: [String : String]? {
        return nil
    }
    
    public var baseURL: URL {
        return URL(string: CY_HTTP_HOST)!
    }
    
    public var path: String {
        switch self {
        case .login:
            log.info("request url:" + CY_ROUTE_LOGIN)
            return CY_ROUTE_LOGIN
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .login:
            return .post
        }
    }
        
    public var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    public var task: Task {
        switch self {
        case .login(let phone, let password):
            // 该接口 要求tk在param里，该部分可以放到SCWebService Adapter中统一处理，具体看项目中与后台的接口约束
            let tk = CYUuidUtil.getToken()
            
            let parameters = ["tk" : tk, "username": phone, "password" : password.md5()];
            log.info("post param :")
            log.info(parameters)
            
            return  Task.requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
        
    }
    
    public var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }
}
