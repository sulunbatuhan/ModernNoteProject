//
//  RegisterViewModel.swift
//  ModernToDoList
//
//  Created by batuhan on 21.02.2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

protocol RegisterModelProtocol{
    
}
class RegisterViewModel:RegisterModelProtocol{
    
    func saveUser(username :String, email:String,password:String,completion:@escaping((Bool))->()){
       
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                completion(false)
            }
            guard let createdUser = result?.user.uid else {return}
            let saveData :[String:Any] = ["username":username,
                                          "userID":createdUser]
            
            Firestore.firestore().collection("Users").document(createdUser).setData(saveData){ error in
                if error != nil {
                    print("firestore kaydedilemedi")
                    completion(false)
                    return
                }
                print("createdUser")
                completion(true)
            }
           
        }
        
    }
}

