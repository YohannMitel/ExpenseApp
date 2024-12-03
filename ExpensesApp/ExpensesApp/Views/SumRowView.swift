//
//  SumRowView.swift
//  ExpensesApp
//
//  Created by devxcode on 02/10/2024.
//

import SwiftUI

struct SumRowView: View {

    let tag:String

    @EnvironmentObject var todoVM: todoExpView
    var body: some View {
        HStack{
            /*Image(systemName: todo.bool ? "checkmark.circle" : "circle")
                .foregroundColor(todo.bool ? .green : .red)*/
            Text(tag)
                //.font(.subheadline)
                .padding(7)
                    .overlay(
                        /*RoundedRectangle(cornerRadius: 30)
                            .stroke(.red, lineWidth: 2)*/
                        Capsule().stroke(tag == "Perso" ? Color(.red) : tag == "Pro" ? Color(.green) : tag == "Vacation" ? Color(.orange) : Color(.gray) , lineWidth: 1)
                    )
                    .foregroundColor( tag == "Perso" ? Color(.red) : tag == "Pro" ? Color(.green) : tag == "Vacation" ? Color(.orange) : Color(.gray) )
            /*Image(systemName: "circle")
                .foregroundColor(.red)*/
            
            Spacer()
            
            Text("\(todoVM.sumPerso(tagType: tag)) €")
            
            
        }
        .font(.title2)
        .padding()
    }
    
}

struct SumRowView_Previews: PreviewProvider {
    static var previews: some View {
        SumRowView(tag:"Perso")
            .previewLayout(.sizeThatFits)
            .environmentObject(todoExpView())
        
    }
}
