//
//  MainViewModel.swift
//  ModernToDoList
//
//  Created by batuhan on 21.02.2023.
//

import Foundation
import UIKit
import CoreData

protocol MainModelProtocol{
   
}

class MainViewModel:MainModelProtocol{
  
    
    func fetchData(liste:[DoList]){
        let appDel = UIApplication.shared.delegate as! AppDelegate
        let context = appDel.persistentContainer.viewContext
        
        do{
    
            
        }catch{
            print("getirilemedi")
        }
    }
    
}
