//
//  DetailViewModel.swift
//  ModernToDoList
//
//  Created by batuhan on 21.02.2023.
//

import Foundation

protocol DetailViewModelProtocol{
    func delete(row:DoList)
}

class DetailViewModel:DetailViewModelProtocol{
    
    func delete(row:DoList){
        DoListData().deleteNote(toDo: row)
    }
    func edit(row:DoList,content:String){
        row.content = content
        do {
            try context.save()
        }catch{
            
        }
    }
}
