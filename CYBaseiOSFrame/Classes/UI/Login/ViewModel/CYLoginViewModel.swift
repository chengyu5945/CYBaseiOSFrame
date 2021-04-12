//
//  CYLoginViewModel.swift
//  CYBaseiOSFrame
//
//  Created by Jade on 2018/7/30.
//  Copyright © 2018年 Jade. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Moya
import ObjectMapper

final class CYLoginViewModel {
    
    let username = Variable<String>("")
    
    let usernameUseable:Observable<Result>
    
    let password = Variable<String>("")
    
    let passwordUseable:Observable<Result>
    
    let buttonTaps = PublishSubject<Void>()

    let buttonEnabled:Observable<Bool>
    
    var loginResult:Observable<CYResponse<CYLoginResp>>?
    
    init() {
        let service = CYTextFieldService.init()
        
        usernameUseable = username.asObservable().flatMapLatest{ username in
            return service.validationUserName(username)
                .observeOn(MainScheduler.instance)
                .catchErrorJustReturn(.failed(message: "userName检测出错"))
                .share()
                .retry(1)
        }
        passwordUseable = password.asObservable().map { passWord in
            return service.validationPassword(passWord)
            }.share()
            .retry(1)
        
        buttonEnabled = Observable.combineLatest(usernameUseable, passwordUseable) { (username, password) in
            return username.isValid && password.isValid
            }
            .distinctUntilChanged()
            .share()
            .retry(1)
        
    }
    
    func setupBind() -> Void {
        
        let usernameAndPwd = Observable.combineLatest(username.asObservable(), password.asObservable()){
            return ($0, $1)
        }
        
        loginResult = buttonTaps.asObservable().withLatestFrom(usernameAndPwd).flatMapLatest { usernameAndPwd in
            
            return self.login(phone: usernameAndPwd.0, password: usernameAndPwd.1)
                .observeOn(MainScheduler.instance)
                .catchErrorJustReturn(CYResponse.init(map: Map.init(mappingType: MappingType.fromJSON, JSON: ["error": "wrong"]))!)
            }.share().retry(1)
        
    }
    
    
    func login(phone: String, password: String) -> Observable<CYResponse<CYLoginResp>> {
        
        return LoginProvider.rx.request(.login(phone: phone, password: password)).asObservable().mapObject(CYResponse.self)
    }
    
    func setupUserInfo(userInfo: CYLoginResp?) -> Void {
        if userInfo != nil && userInfo?.id != nil && userInfo?.token != nil {
            let user : CYUser = CYUser()
            user.token = (userInfo?.token)!
            user.id = Int((userInfo?.id)!)!
            user.phone = username.value
            CYDatabaseManager.insertUser(by: user)
        }
    }

    
}
