//
//  Data.swift
//  ModernToDoList
//
//  Created by batuhan on 21.02.2023.
//

import Foundation
import UIKit
import CoreData


class DoListData{
   
    func save(title:String,content:String,color:String) {
        let appDel = UIApplication.shared.delegate as! AppDelegate
        let context = appDel.persistentContainer.viewContext
        
        let newJob = DoList(context: context)
        newJob.title = title
        newJob.content = content
        newJob.color = color
        do{
            try context.save()
        }catch{
            print("hata")
        }
    }
    
    func deleteNote(toDo:DoList){
        context.delete(toDo)
        do {
            try context.save()
        }catch {
            print("silinemedi")
        }
    }
    
    func fetchData(){
      let appDel = UIApplication.shared.delegate as! AppDelegate
      let context = appDel.persistentContainer.viewContext
         do{
             let list = try context.fetch(DoList.fetchRequest())
             
             print(list.count)
         }catch{
             print("getirilemedi")
         }
     }
}

