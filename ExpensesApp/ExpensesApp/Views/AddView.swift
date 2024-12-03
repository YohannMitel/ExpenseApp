//
//  AddView.swift
//  Todo
//
//  Created by devxcode on 26/09/2024.
//

import SwiftUI

struct AddView: View {
    @State var todoTitle: String = ""
    @State var todoPrice: Int = 0

    @State var tag: Tag = .perso
    
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var todoVM: todoExpView

    var body: some View {
        VStack{
            TextField("Enter the destination expense ", text: $todoTitle)
                .padding(.horizontal)
                .frame(height:55)
                .background(Color(.systemGray4))
                .cornerRadius(10)
            
        
            
            TextField("enter your price: ", value: $todoPrice,formatter: NumberFormatter())
                .padding(.horizontal)
                .frame(height:55)
                .background(Color(.systemGray4))
                .cornerRadius(10)
            
            
            Picker("Tag", selection: $tag){
            ForEach(Tag.allCases, id: \.self){ tag
                in
                
                if(tag.rawValue != "All"){
                    Text(tag.rawValue)
                }
                
                
                
            }
        }
            .pickerStyle(SegmentedPickerStyle())
            
            Button{
                todoVM.addTodo(_title: todoTitle,_price: todoPrice, _tag: tag)
                self.presentationMode.wrappedValue.dismiss()
            } label:{
                Text("ADD")
                    .foregroundStyle(.white)
                    .font(.headline)
                    .frame(height:55)
                    .frame(maxWidth:.infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                
              
            }
            Spacer()
        }
        .padding(14)
        .navigationTitle("💵 Add an expense")
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
            .environmentObject(todoExpView())
    }
}
