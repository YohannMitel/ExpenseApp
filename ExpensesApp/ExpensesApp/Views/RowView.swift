//
//  RowView.swift
//  ExpensesApp
//
//  Created by devxcode on 26/09/2024.
//

import SwiftUI

struct RowView: View {
    let todo:todoExp
    

    
    var body: some View {
        HStack{
            /*Image(systemName: todo.bool ? "checkmark.circle" : "circle")
                .foregroundColor(todo.bool ? .green : .red)*/
            
            VStack{
                Text(todo.title)
                Text("\(todo.dateExp.formatted(date: .long, time: .shortened))")
                    .font(.footnote)
            }
            
            Spacer()
            
            Text("\(todo.price) €")
            Text(todo.tag.rawValue)
                .font(.subheadline)
                .padding(7)
                    .overlay(
                        /*RoundedRectangle(cornerRadius: 30)
                            .stroke(.red, lineWidth: 2)*/
                        Capsule().stroke(todo.tag.rawValue == "Perso" ? Color(.red) : todo.tag.rawValue == "Pro" ? Color(.green) : todo.tag.rawValue == "Vacation" ? Color(.orange) : Color(.gray), lineWidth: 1)
                    )
                    .foregroundColor( todo.tag.rawValue == "Perso" ? Color(.red) : todo.tag.rawValue == "Pro" ? Color(.green) : todo.tag.rawValue == "Vacation" ? Color(.orange) : Color(.gray) )
            
            
            /*Image(systemName: "circle")
                .foregroundColor(.red)*/
            
        }
        .font(.title2)
        .padding()
    }
    
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(todo:todoExp.testData[0])
            .previewLayout(.sizeThatFits)
    }
}
