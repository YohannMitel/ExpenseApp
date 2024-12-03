//
//  ContentView.swift
//  ExpensesApp
//
//  Created by devxcode on 26/09/2024.
//

import SwiftUI

struct ExpensesView: View {
    //let data:[todoExp]
    @State var tag: Tag = .all
    @EnvironmentObject var todoVM: todoExpView
    var body: some View {
        NavigationView{
            VStack{
                
            
                List{
                    
                    Picker("Tag", selection: $tag){
                        ForEach(Tag.allCases, id: \.self) {
                            tag in Text(tag.rawValue)
                        }
                        
                    }.pickerStyle(SegmentedPickerStyle())
                    
                    ForEach(self.todoVM.todos) { datum in
                        if(datum.tag == tag || tag.rawValue == "All" ){
                            RowView(todo:datum)
                        }
                            
       
                    }
                    .onDelete(perform: todoVM.delTodo)
                    .onMove(perform: todoVM.moveTodo)
                    //list end here
                }.listStyle(PlainListStyle())
                    .navigationTitle("Expenses")
                    .toolbar{
                        ToolbarItem(placement: .navigationBarLeading){
                            EditButton()
                                        
                        }
                        ToolbarItem(placement: .navigationBarTrailing){
                            NavigationLink("Add", destination: AddView())
                                        
                        }
                        
                    }
                Divider()
                    .frame(minHeight: 7)
                    .background(Color(.systemGray4))
                    .padding(.horizontal)
                Text("Total : \(todoVM.sumPerso(tagType: tag.rawValue)) €")
                    .bold()
                    .font(.title)
                Spacer()
                //VStack end
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ExpensesView()
            .environmentObject(todoExpView())
    }
}
