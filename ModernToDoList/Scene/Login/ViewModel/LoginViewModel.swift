//
//  LoginViewModel.swift
//  ModernToDoList
//
//  Created by batuhan on 21.02.2023.
//

import Foundation
import FirebaseAuth



protocol LoginModelProtocol{
    
}

class LoginViewModel:LoginModelProtocol{
    
    func signIn(email:String,password:String,completion:@escaping (Bool)->()){
        Auth.auth().signIn(withEmail: email, password: password) { result , error in
            if error != nil {
                completion(false)
                return
            }else{
                completion(true)
                return
            }
            
        }
    }
    
}
