//
//  SaveViewModel.swift
//  ModernToDoList
//
//  Created by batuhan on 21.02.2023.
//

import Foundation
import UIKit
import CoreData

protocol SaveViewModelProtocol{
    func save(title:String,content:String,color:String)
}


class SaveViewModel:SaveViewModelProtocol{
    func save(title:String,content:String,color:String) {
        DoListData().save(title: title, content: content, color: color)
    }
    
    
    
    
}
