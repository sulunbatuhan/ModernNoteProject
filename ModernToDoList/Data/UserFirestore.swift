//
//  UserFirestore.swift
//  ModernToDoList
//
//  Created by batuhan on 22.02.2023.
//

import Foundation
import Firebase
import FirebaseFirestore

class UserFirestore {
    let currentUser = Auth.auth().currentUser?.uid

    func getUser(completion:@escaping(User)->()){
        var user :User?
        if let currentUserID = currentUser{
            Firestore.firestore().collection("Users").document(currentUserID).getDocument { (snapshot, error) in
                if error != nil {
                    return
                }
                guard let userData = snapshot?.data() else {return}
                user = User(userData: userData)
                completion(user!)
            }
        }else {
        }
    }
    
    func singOut(completion : @escaping (Bool)->()){
     if (self.currentUser != nil) {
                do{
                    try Auth.auth().signOut()
                    //hud
                    completion(true)
                    return
                }catch{
                    print(error.localizedDescription)
                }
            }
            else {
                completion(false)
            }
        }
    
    
}
