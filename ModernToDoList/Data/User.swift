//
//  User.swift
//  ModernToDoList
//
//  Created by batuhan on 22.02.2023.
//

import Foundation
struct User {
    let username : String
    let userID : String
    
    init(userData : [String:Any]) {
        self.username = userData["username"] as? String ?? ""
        self.userID = userData["userID"] as? String ?? ""
    }
}
