//
//  todoExpView.swift
//  ExpensesApp
//
//  Created by devxcode on 02/10/2024.
//

import SwiftUI


class todoExpView : ObservableObject {
    @Published var todos: [todoExp] = []
    
    init(){
        getTodos()
    }
    func getTodos(){
        todos.append(contentsOf: todoExp.testData)
    }
    
    
    func addTodo(_title: String,_price:Int, _tag: Tag){
        
        let newTodo = todoExp(title: _title, price: _price, bool:false, tag: _tag, dateExp: Date.now)
        todos.append(newTodo)
        
    }
    
    func delTodo(indexSet : IndexSet){
        
        todos.remove(atOffsets: indexSet)
        
        
    }
    
    func moveTodo(from: IndexSet, to: Int){
        todos.move(fromOffsets: from, toOffset: to)
    }
    
    // sumPerso("Perso")
    func sumPerso(tagType: String) -> Int{
        var result:Int = 0
        for t in todos{
            if(t.tag.rawValue == tagType || tagType == "All")  {
                result += t.price
            }
        }
        return result
    }
    
    func getLowestDate() -> Date {
        var min:Date = todos[0].dateExp ;
        for t in todos{
            if(t.dateExp < min){
                min = t.dateExp;
            }
        }
        return min;
    }
    
    func getHigherDate() -> Date {
        var max:Date = todos[0].dateExp ;
        for t in todos{
            if(t.dateExp > max){
                max = t.dateExp;
            }
        }
        return max;
    }
    
    
    
    /*func updateTodo(todo:todoExp){
        for(index, t) in todos.enumerated(){
            if(todo.id == t.id){
                //todos[index].isCompleted.toggle()
            }
        }
    }*/
    
}


