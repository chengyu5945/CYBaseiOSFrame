//
//  CYLoginController.swift
//  CYBaseiOSFrame
//
//  Created by Jade on 2018/7/20.
//  Copyright © 2018年 Jade. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import SwiftProgressHUD

class CYLoginController: CYBaseViewController {
    
    var logoImageView: UIImageView!
    var logoTitleLabel: UILabel!
    var phoneInputView: CYImageInputView!
    var passwordInputView: CYImageInputView!
    var loginButton: UIButton!
    
    private let viewModel: CYLoginViewModel = CYLoginViewModel()
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "登录";
        initSubviews()
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func initSubviews() {
        logoImageView = UIImageView.init()
        logoImageView.image = loadPNGImage(imageName: "logo_big")
        
        logoTitleLabel = UILabel.init()
        logoTitleLabel.text = NSLocalizedString("project_title", comment: "诺云糖")
        logoTitleLabel.textColor = COLOR_LABEL_MAIN
        logoTitleLabel.font = FONT_BIG_BOLD_DEFAULT
        logoTitleLabel.textAlignment = NSTextAlignment.center
        
        phoneInputView = CYImageInputView.init(frame: CGRect.init())
        phoneInputView.imageView.image = loadPNGImage(imageName: "ic_phone")
        phoneInputView.textField.placeholder = NSLocalizedString("phone", comment: "手机号")
        
        passwordInputView = CYImageInputView.init(frame: CGRect.init())
        passwordInputView.imageView.image = loadPNGImage(imageName: "ic_pwd")
        passwordInputView.textField.placeholder = NSLocalizedString("pwd", comment: "密码")
        passwordInputView.textField.isSecureTextEntry = true
        
        loginButton = SCCustomButtonUtil.blueRoundBigButton(title: NSLocalizedString("login_title", comment: "登录"))
        loginButton.isEnabled = false
        
        self.view.addSubview(logoImageView)
        self.view.addSubview(logoTitleLabel)
        self.view.addSubview(phoneInputView!)
        self.view.addSubview(passwordInputView!)
        self.view.addSubview(loginButton)
        
        makeContains()
    }
    
    override func makeContains() {
        let top: CGFloat = adaptedHeight(height: 112.5)
        let textInputHeight = 72.5
        
        logoImageView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(top)
        }
        logoTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(logoImageView.snp.bottom).offset(14.5)
            make.left.right.equalToSuperview()
        }
        
        phoneInputView.snp.makeConstraints { (make) in
            make.top.equalTo(logoTitleLabel.snp.bottom).offset(12)
            make.left.right.equalToSuperview()
            make.height.equalTo(textInputHeight)
        }
        
        passwordInputView.snp.makeConstraints { (make) in
            make.top.equalTo(phoneInputView.snp.bottom).offset(0)
            make.left.right.equalToSuperview()
            make.height.equalTo(textInputHeight)
        }
        
        loginButton.snp.makeConstraints { (make) in
            make.top.equalTo(passwordInputView.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
        }
        
    }
    
    private func bindViewModel() {
        

        phoneInputView.textField.rx.text.orEmpty.bind(to: viewModel.username).disposed(by: disposeBag)
        
        passwordInputView.textField.rx.text.orEmpty.bind(to: viewModel.password).disposed(by: disposeBag)
        
        viewModel.buttonEnabled.subscribe({ (event: Event<Bool>) in
            self.loginButton.isEnabled = event.element!
        }).disposed(by: disposeBag)
        
        viewModel.setupBind()
        loginButton.rx.tap.bind(to: viewModel.buttonTaps).disposed(by: disposeBag)
        
        viewModel.loginResult?.subscribe({ response in
            switch response {
            case .next(let models):
                log.info(models)
                self.getMessage(model: models)
            case .error(let error):
                log.info(error)
            case .completed:
                return
                
            }
            
        }).disposed(by: disposeBag)
        
    }
    
    private func showMessage(message: String) -> Void {
        
        SwiftProgressHUD.showOnlyText(message)
        
        /// 1s后 隐藏
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            SwiftProgressHUD.hideAllHUD()
        }

    }
    
    private func getMessage(model: CYResponse<CYLoginResp>) -> Void {
        let responseModel: CYResponse? = model
        let resCode = responseModel?.reasoncode
        if (resCode?.elementsEqual("0"))! {
            log.info("登录成功")
            self.showMessage(message: "登录成功")
            // 存储token到数据库
            self.viewModel.setupUserInfo(userInfo: responseModel?.data)
        } else if (resCode?.elementsEqual("1"))! {
            log.info("用户不存在")
            self.showMessage(message: "用户不存在")
        } else {
            log.info("登录失败")
            if let message = responseModel?.reasonmsg {
                self.showMessage(message: message)
            }
        }
    }
 
}
