//
//  CYWebService.swift
//  CYBaseiOSFrame
//
//  Created by Jade on 2018/10/8.
//  Copyright © 2018年 Jade. All rights reserved.
//

import Foundation
import Alamofire
import Moya

class CYWebService {
    
    // set false when release
    static var verbose: Bool = true
    
    // session manager
    static func manager() -> Alamofire.SessionManager {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        configuration.timeoutIntervalForRequest = 10 // time out
        let manager = Alamofire.SessionManager(configuration: configuration)
        manager.adapter = CustomRequestAdapter()
        return manager
    }
    
    // request adpater to add default http header parameter
    private class CustomRequestAdapter: RequestAdapter {
        public func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
            var urlRequest = urlRequest
            urlRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            return urlRequest
        }
        
    }
    
}

