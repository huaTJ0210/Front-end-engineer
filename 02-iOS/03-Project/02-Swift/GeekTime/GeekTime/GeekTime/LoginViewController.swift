//
//  LoginViewController.swift
//  GeekTime
//
//  Created by 华天杰 on 2020/12/23.


/*
  (1) clipsToBounds(UIView)
 是指视图上的子视图,如果超出父视图的部分就截取掉,
 (2) masksToBounds(CALayer)
 是指视图的图层上的子图层,如果超出父图层的部分就截取掉
 */

import UIKit
import SnapKit

protocol ValidatesPhoneNumber {
    func validatePhoneNumber(_ phoneNumber: String) -> Bool
}

protocol ValidatesPassword {
    func validatePassword(_ password: String) -> Bool
}

extension ValidatesPhoneNumber{
    func validatePhoneNumber(_ phoneNumber: String) -> Bool{
        if phoneNumber.count != 11 {
            return false
        }
        return true
    }
}

extension ValidatesPassword{
    func validatePassword(_ password: String) -> Bool{
        if password.count < 6 || password.count > 12 {
            return false
        }
        return true
    }
}

class LoginViewController: BaseViewController,ValidatesPassword,ValidatesPhoneNumber {
    
    var phoneTextfiled: UITextField! // 隐式解析可选类型
    var passwordTextFiled: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
       // 1、logoImage
        let logoView = UIImageView(image: R.image.logo())
        view.addSubview(logoView)
        logoView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(30)
            make.centerX.equalToSuperview()
        }
        // 2、phoneTextfiled : 调整leftview、text（光标）、rightview 可以继承UITextFiled重写 相应的方法
        // iOS13 直接设置leftview为UIImageView会有问题？？？
        let phoneIconView = UIImageView(image: R.image.icon_phone())
        phoneTextfiled = UITextField()
        phoneTextfiled.leftView = phoneIconView
        phoneTextfiled.leftViewMode = .always
        phoneTextfiled.layer.borderColor = UIColor(0x333333).cgColor
        phoneTextfiled.layer.borderWidth = 1
        phoneTextfiled.layer.cornerRadius = 5
        phoneTextfiled.layer.masksToBounds = true
        phoneTextfiled.placeholder = "请输入手机号"
        view.addSubview(phoneTextfiled)
        phoneTextfiled.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(logoView.snp_bottom).offset(20)
            make.height.equalTo(50)
        }
        //3、密码框
        let passwordIconView = UIImageView(image: R.image.icon_pwd())
        passwordTextFiled = UITextField()
        passwordTextFiled.leftView = passwordIconView
        passwordTextFiled.leftViewMode = .always
        passwordTextFiled.layer.borderColor = UIColor(0x333333).cgColor
        passwordTextFiled.layer.borderWidth = 1
        passwordTextFiled.layer.cornerRadius = 5
        passwordTextFiled.layer.masksToBounds = true
        passwordTextFiled.placeholder = "请输入密码"
        passwordTextFiled.isSecureTextEntry = true
        view.addSubview(passwordTextFiled)
        passwordTextFiled.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(phoneTextfiled.snp_bottom).offset(20)
            make.height.equalTo(50)
        }
        
        // 4、登录按钮
        let loginButton = UIButton(type: .custom)
        loginButton.setTitle("登录", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        loginButton.setBackgroundImage(UIColor.hexColor(0xf8892e).toImage(), for: .normal)
        loginButton.layer.cornerRadius = 5.0
        loginButton.layer.masksToBounds = true
        view.addSubview(loginButton)
        loginButton.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(passwordTextFiled.snp_bottom).offset(20)
            make.height.equalTo(50)
        }
        
        loginButton.addTarget(self, action: #selector(didClickLoginButton), for: .touchUpInside)
        
    }
    
    @objc func didClickLoginButton()  {
        if validatePhoneNumber(phoneTextfiled.text ?? "") && validatePassword(passwordTextFiled.text ?? "") {
            //
        }else{
            self.showToast()
        }
    }
    
    func showToast()  {
        let alertVC = UIAlertController(title: "提示", message: "用户名或者密码错误", preferredStyle: .alert)
        present(alertVC, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            alertVC.dismiss(animated: true, completion: nil)
        }
    }

}
