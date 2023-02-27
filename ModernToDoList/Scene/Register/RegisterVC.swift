//
//  RegisterVC.swift
//  ModernToDoList
//
//  Created by batuhan on 21.02.2023.
//

import UIKit
import JGProgressHUD

class RegisterVC: UIViewController {
    
    let headerFont: UILabel = {
        let lbl = UILabel()
        lbl.text = "Become a member"
        lbl.font = UIFont.boldSystemFont(ofSize: 50)
        lbl.numberOfLines = 0
        lbl.textAlignment = .left
        return lbl
    }()
    
    let usernameFont : UILabel = {
        let lbl = UILabel()
        lbl.text = "username"
        lbl.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        lbl.textColor = UIColor.gray
        lbl.textAlignment = .left
        return lbl
    }()
    
    let usernameTextField : UITextField = {
        let txt = UITextField()
        txt.placeholder = "enter your username"
        txt.layer.borderColor = UIColor(named: "backgroundColor")?.cgColor
        txt.layer.cornerRadius = 10
        txt.autocorrectionType = .no
        return txt
    }()
    let usernameView : UIView = {
       let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    let emailAddressFont : UILabel = {
        let lbl = UILabel()
        lbl.text = "E-mail Adress"
        lbl.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        lbl.textColor = UIColor.gray
        lbl.textAlignment = .left
        return lbl
    }()
    let emailTextField : UITextField = {
        let txt = UITextField()
        txt.placeholder = "enter your email"
        txt.autocorrectionType = .no
        txt.layer.borderColor = UIColor(named: "backgroundColor")?.cgColor
        txt.layer.cornerRadius = 10
        return txt
    }()
    
    let emailView : UIView = {
       let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    let passwordFont: UILabel = {
        let lbl = UILabel()
        lbl.text = "Password"
        lbl.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        lbl.textColor = UIColor.gray
        lbl.textAlignment = .left
        return lbl
    }()
    let forgetPassword : UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Forgot password?", for: .normal)
        return btn
    }()
    
    let passwordTextField : UITextField = {
        let txt = UITextField()
        txt.placeholder = "enter your password"
        txt.layer.borderColor = UIColor(named: "backgroundColor")?.cgColor
        txt.layer.cornerRadius = 10
        txt.isSecureTextEntry = true
        txt.autocorrectionType = .no
        return txt
    }()
    let passwordView : UIView = {
       let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    let registerButton : UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle( "Register", for: .normal)
        //btn.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        btn.backgroundColor = UIColor(named: "backgroundColor")
        btn.tintColor = .white
        btn.layer.cornerRadius = 20
        btn.addTarget(self, action:#selector(register) , for: .touchUpInside)
        return btn
    }()
    
    lazy var viewModel = RegisterViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

    }
    
    @objc func register(){
        
        guard let username = usernameTextField.text, !username.isEmpty else {return}
        guard let email = emailTextField.text, !email.isEmpty else {return}
        guard let password = passwordTextField.text,!password.isEmpty else {return}
        
        viewModel.saveUser(username: username, email: email, password: password) { result in
     
            if result == true {
                print("result1",result)
                self.passwordTextField.text = ""
                self.usernameTextField.text = ""
                self.emailTextField.text = ""
                self.view.showHud(message: "Kayıt Yapılıyor", view: self.view)
                
            }else {
                self.view.showHud(message: "Kayıt yapılamadı", view: self.view)
                print("result2",result)
            }
        }
        self.navigationController?.popViewController(animated: true)
        self.dismiss(animated: true)
        
        
     
        
    }

    override func viewDidLayoutSubviews() {
        view.addSubview(headerFont)
        view.addSubview(usernameFont)
        view.addSubview(usernameTextField)
        view.addSubview(usernameView)
        view.addSubview(emailAddressFont)
        view.addSubview(emailTextField)
        view.addSubview(emailView)
        view.addSubview(passwordFont)
        view.addSubview(passwordTextField)
        view.addSubview(passwordView)
        view.addSubview(registerButton)
        
        headerFont.anchor(top: view.safeAreaLayoutGuide.topAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, paddingTop: 20, paddingBottom: 0, paddingLeft: 20, paddingRight: -20, width: 0, height: 150)
        
        //username
        usernameFont.anchor(top: nil, bottom: usernameTextField.topAnchor, leading: usernameTextField.leadingAnchor, trailing: usernameTextField.trailingAnchor, paddingTop: 0, paddingBottom: -4, paddingLeft: 0, paddingRight: 0, width: 0, height: 20)
        usernameTextField.anchor(top: nil, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 20, paddingRight: -20, width: 0, height: 50)
        usernameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        usernameView.anchor(top: usernameTextField.bottomAnchor, bottom: nil, leading: usernameTextField.leadingAnchor, trailing: usernameTextField.trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: 0, height: 0.5)
        
        //email
        emailAddressFont.anchor(top: usernameTextField.bottomAnchor, bottom: emailTextField.topAnchor, leading: emailTextField.leadingAnchor, trailing: emailTextField.trailingAnchor, paddingTop: 20, paddingBottom: -4, paddingLeft: 0, paddingRight: 0, width: 0, height: 20)
        emailTextField.anchor(top: nil, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 20, paddingRight: -20, width: 0, height: 50)
        emailView.anchor(top: emailTextField.bottomAnchor, bottom: nil, leading: emailTextField.leadingAnchor, trailing: emailTextField.trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: 0, height: 0.5)
        
        
        //Password
        passwordFont.anchor(top: emailTextField.bottomAnchor, bottom: passwordTextField.topAnchor, leading: emailTextField.leadingAnchor, trailing: emailTextField.trailingAnchor, paddingTop: 20, paddingBottom: -4, paddingLeft: 0, paddingRight: 0, width: 0, height: 20)
        passwordTextField.anchor(top:passwordFont.bottomAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, paddingTop: 8, paddingBottom: 0, paddingLeft: 20, paddingRight: -20, width: 0, height: 50)
        passwordView.anchor(top: passwordTextField.bottomAnchor, bottom: nil, leading: passwordTextField.leadingAnchor, trailing: passwordTextField.trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: 0, height: 0.5)
        
        registerButton.anchor(top: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, paddingTop: 0, paddingBottom: -30, paddingLeft: 30, paddingRight: -30, width: 0, height: 50)
        
    }
    
    
    
    
 

}
