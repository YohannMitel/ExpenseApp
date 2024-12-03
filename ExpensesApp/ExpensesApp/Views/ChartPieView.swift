//
//  ChartPieView.swift
//  ExpensesApp
//
//  Created by devxcode on 04/10/2024.
//


import SwiftUI
import Charts

struct ChartPieView: View {
    @EnvironmentObject var todoVM: todoExpView
    var body: some View {
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
                
                
                //// Chart
                Chart{
                    ForEach(Tag.allCases, id: \.self) {
                        tag in
                        
                        if(tag.rawValue != "All"){
                            BarMark(
                                x: .value("Shape Type", tag.rawValue),
                                    y: .value("Total Count", todoVM.sumPerso(tagType: tag.rawValue))
                            )
                            .foregroundStyle(tag.rawValue == "Perso" ? Color(.red) : tag.rawValue == "Pro" ? Color(.green) : tag.rawValue == "Vacation" ? Color(.orange) : Color(.gray))
                            
                        }
                    }
                    
                }.navigationTitle("Expenses BarChart")
                    .chartForegroundStyleScale([
                        "Perso" : Color(.red),
                        "Vacation": Color(.orange),
                        "Pro":Color(.green)
                    ])
                    .padding(10)
                        
                    }
               
                Spacer()
                //VStack end
            }
        }
    
    
}

struct ChartPieView_Previews: PreviewProvider {
    static var previews: some View {
        ChartPieView()
            .environmentObject(todoExpView())
    }
}
