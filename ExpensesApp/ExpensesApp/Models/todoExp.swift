//
//  todoExp.swift
//  ExpensesApp
//
//  Created by devxcode on 26/09/2024.
//

import Foundation

enum Tag: String, CaseIterable{
    case all = "All"
    case perso = "Perso"
    case pro = "Pro"
    case vacation = "Vacation"
}

struct todoExp: Identifiable{
    var id = UUID()
    

    var title:String
    var price:Int
    var bool:Bool
    //var tag:String
    var tag: Tag
    var dateExp:Date

    
    static var testData = [
        todoExp(title: "Apple", price: 1, bool:true,tag:.perso,dateExp: Date(timeIntervalSince1970: 1480366260)),
        todoExp(title: "Actemium", price: 1200, bool:false,tag:.pro,dateExp:  Date(timeIntervalSince1970: 148036260)),
        todoExp(title: "Microsoft", price: 100000, bool:true, tag: .vacation,dateExp: Date(timeIntervalSince1970: 1180366260)),
        todoExp(title: "Ubisoft", price: 5475, bool:false, tag: .perso,dateExp:Date(timeIntervalSince1970: 2080366260)),
        todoExp(title: "UBF", price: 845, bool:true, tag:.perso,dateExp:Date(timeIntervalSince1970: 1080366260)),
        todoExp(title: "Airbnb", price: 845, bool:true, tag:.vacation,dateExp:Date.now ),
    ]
}
