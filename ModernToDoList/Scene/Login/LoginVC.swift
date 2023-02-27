//
//  LoginVC.swift
//  ModernToDoList
//
//  Created by batuhan on 21.02.2023.
//

import UIKit


class LoginVC: UIViewController {

   private let welcomeBack : UILabel = {
        let lbl = UILabel()
        lbl.text = "Welcome back!"
        lbl.font = UIFont.boldSystemFont(ofSize: 30)
        lbl.textAlignment = .center
        return lbl
    }()
    
     private let emailAddressFont : UILabel = {
        let lbl = UILabel()
        lbl.text = "E-mail Adress"
        lbl.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        lbl.textColor = UIColor.gray
        lbl.textAlignment = .left
        return lbl
    }()
   private  let emailTextField : UITextField = {
        let txt = UITextField()
        txt.placeholder = "enter your email"
        txt.autocorrectionType = .no
        txt.layer.borderColor = UIColor(named: "backgroundColor")?.cgColor
        txt.layer.cornerRadius = 10
        return txt
    }()
    
  private  let emailView : UIView = {
       let view = UIView()
        view.backgroundColor = .black
        return view
    }()
   private let passwordFont: UILabel = {
        let lbl = UILabel()
        lbl.text = "Password"
        lbl.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        lbl.textColor = UIColor.gray
        lbl.textAlignment = .left
        return lbl
    }()
   private let forgetPassword : UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Forgot password?", for: .normal)
        return btn
    }()
    
  private  let passwordTextField : UITextField = {
        let txt = UITextField()
        txt.placeholder = "enter your password"
        txt.layer.borderColor = UIColor(named: "backgroundColor")?.cgColor
        txt.layer.cornerRadius = 10
        txt.isSecureTextEntry = true
        txt.autocorrectionType = .no
        return txt
    }()
   private let passwordView : UIView = {
       let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
   private let loginButton : UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle( "Log in", for: .normal)
        btn.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        btn.backgroundColor = UIColor(named: "backgroundColor")
        btn.tintColor = .white
        btn.layer.cornerRadius = 20
        btn.addTarget(self, action:#selector(logIn) , for: .touchUpInside)
        return btn
    }()
    
    
   private let registerButton : UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Don't have a account? Sign up", for: .normal)
       
        btn.tintColor = .black
        btn.addTarget(self, action: #selector(goSignUp), for: .touchUpInside)
        return btn
    }()
    
    
   fileprivate lazy var viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
    }
    
    override func viewDidLayoutSubviews() {
        addSubView()
        setLayout()
    }
    
    @objc fileprivate func logIn(){
        guard let email = emailTextField.text,!email.isEmpty else {return}
        guard let password = passwordTextField.text,!password.isEmpty else {return}
        
        
        viewModel.signIn(email: email, password: password) { result in
            if result == true {
                print("result bool \(result)")
                let main = MainVC(collectionViewLayout: UICollectionViewFlowLayout())
                main.modalPresentationStyle = .fullScreen
                self.navigationController?.pushViewController(main, animated: true)
            }
            else {
                print("result bool \(result)")
                self.view.showHud(message: "Giriş yapılamadı", view: self.view)
            }
        }
      
        
        
      
    }
    
    
    @objc fileprivate func goSignUp(){
        let register = RegisterVC()
        navigationController?.pushViewController(register, animated: true)
    }
  
 

}
//MARK:UI Stuff
extension LoginVC {
   fileprivate func addSubView(){
        view.addSubview(welcomeBack)
        view.addSubview(emailAddressFont)
        view.addSubview(emailTextField)
        view.addSubview(emailView)
        view.addSubview(passwordFont)
        view.addSubview(passwordTextField)
        view.addSubview(passwordView)
        view.addSubview(loginButton)
        view.addSubview(registerButton)
    }
    
    fileprivate func setLayout(){
        welcomeBack.anchor(top: view.safeAreaLayoutGuide.topAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, paddingTop: 20, paddingBottom: 0, paddingLeft: 20, paddingRight: -20, width: 0, height: 100)
        emailAddressFont.anchor(top: nil, bottom: emailTextField.topAnchor, leading: emailTextField.leadingAnchor, trailing: emailTextField.trailingAnchor, paddingTop: 0, paddingBottom: -4, paddingLeft: 0, paddingRight: 0, width: 0, height: 20)
        emailTextField.anchor(top: nil, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 20, paddingRight: -20, width: 0, height: 50)
        emailTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        emailView.anchor(top: emailTextField.bottomAnchor, bottom: nil, leading: emailTextField.leadingAnchor, trailing: emailTextField.trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: 0, height: 0.5)
        passwordFont.anchor(top: emailTextField.bottomAnchor, bottom: passwordTextField.topAnchor, leading: emailTextField.leadingAnchor, trailing: emailTextField.trailingAnchor, paddingTop: 20, paddingBottom: -4, paddingLeft: 0, paddingRight: 0, width: 0, height: 20)
        passwordTextField.anchor(top:passwordFont.bottomAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, paddingTop: 8, paddingBottom: 0, paddingLeft: 20, paddingRight: -20, width: 0, height: 50)
        passwordView.anchor(top: passwordTextField.bottomAnchor, bottom: nil, leading: passwordTextField.leadingAnchor, trailing: passwordTextField.trailingAnchor, paddingTop: 0, paddingBottom: 0, paddingLeft: 0, paddingRight: 0, width: 0, height: 0.5)
        loginButton.anchor(top: nil, bottom: registerButton.topAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, paddingTop: 0, paddingBottom: -10, paddingLeft: 30, paddingRight: -30, width: 0, height: 50)
        registerButton.anchor(top: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, paddingTop: 0, paddingBottom: -10, paddingLeft: 30, paddingRight: -30, width: 0, height: 30)
    }
}
