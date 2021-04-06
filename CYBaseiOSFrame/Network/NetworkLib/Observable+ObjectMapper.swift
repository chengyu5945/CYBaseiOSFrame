//
//  Observable+ObjectMapper.swift
//  CYBaseiOSFrame
//
//  Created by Jade on 2018/8/1.
//  Copyright © 2018年 Jade. All rights reserved.
//

import Foundation
import Moya
import ObjectMapper
import RxSwift
import SwiftyJSON


extension Response {
    public func mapObject<T: BaseMappable>(_ type: T.Type) throws -> T {
        guard let object = Mapper<T>().map(JSONObject: try mapJSON()) else {
            throw MoyaError.jsonMapping(self)
        }
        return object
    }
    
    public func mapArray<T: BaseMappable>(_ type: T.Type) throws -> [T] {
        let json = try JSON(data: self.data)
        let jsonArray = json["data"]["data"]
        
        guard let array = jsonArray.arrayObject as? [[String: Any]],
            let objects:AnyObject = Mapper<T>().mapArray(JSONArray: array) as AnyObject else {
                throw MoyaError.jsonMapping(self)
        }
        return objects as! [T]
    }
}

extension ObservableType where E == Response {
    public func mapObject<T: BaseMappable>(_ type: T.Type) -> Observable<T> {
        return flatMap { response -> Observable<T> in
            /*
            let scResponse = try response.mapObject(SCResponse.self)
            if(scResponse.reasoncode?.elementsEqual("-1"))! {
                // 统一处理错误码 -1 token超时
            }
            */
            return Observable.just(try response.mapObject(T.self))
        }
    }
    
    public func mapArray<T: BaseMappable>(_ type: T.Type) -> Observable<[T]> {
        return flatMap { response -> Observable<[T]> in
            return Observable.just(try response.mapArray(T.self))
        }
    }
    
}
