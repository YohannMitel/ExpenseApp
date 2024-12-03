//
//  OverView.swift
//  ExpensesApp
//
//  Created by devxcode on 26/09/2024.
//

import SwiftUI

struct OverView: View {
    @EnvironmentObject var todoVM: todoExpView
    
    var body: some View {
        VStack{
            NavigationView{
                VStack{
                    VStack(spacing:20){
                        HStack{
                            Text("Period start date")
                            Spacer()
                            Text("\(todoVM.getLowestDate().formatted(date: .long, time: .omitted))")
                                .foregroundColor(.blue)
                                .padding(.horizontal)
                                .background(Color(.systemGray4))
                            
                                .overlay(
                                    RoundedRectangle(cornerRadius: 60)
                                        .stroke(Color(.systemGray4), lineWidth: 2)
                                        
           
                                )
                        }.padding(.horizontal)
                        
                        HStack{
                            Text("Period end date")
                            Spacer()
                            Text("\(todoVM.getHigherDate().formatted(date: .long, time: .omitted))")
                                
       
                                .foregroundColor(.blue)
                                .padding(.horizontal)
                                .background(Color(.systemGray4))
                            
                                .overlay(
                                    RoundedRectangle(cornerRadius: 60)
                                        .stroke(Color(.systemGray4), lineWidth: 2)
                                        
           
                                )
                        }.padding(.horizontal)
                        Divider()
                            .frame(minHeight: 7)
                            .background(Color(.systemGray4))
                            .padding(.horizontal)
                    }.padding(.vertical)
                    

                    
                    
                    VStack(spacing: 50){
                            Spacer()
                            ForEach(Tag.allCases, id: \.self) {
                                tag in
                                
                                if(tag.rawValue != "All"){
                                    SumRowView(tag:tag.rawValue)
                                }
                            }
                            Spacer()
                        
                    }
                    .padding(.horizontal)
                    
                    
                    VStack{
                        // Row content
                        
                        List{
                            
                        }
                        
                        Divider()
                            .frame(minHeight: 7)
                            .background(Color(.systemGray4))
                            .padding(.horizontal)
                        Text("Total : \(todoVM.sumPerso(tagType: "All")) €")
                            .bold()
                            .font(.title)
                    }
                    
                    Spacer()

                    
                    
                    
                }.listStyle(PlainListStyle())
                    .navigationTitle("Overview")
               
                
            }
        }
    }
}

struct OverView_Previews: PreviewProvider {
    static var previews: some View {
        OverView()
            .environmentObject(todoExpView())
    }
}
