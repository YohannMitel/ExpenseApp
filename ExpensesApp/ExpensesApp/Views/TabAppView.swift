//
//  TabAppView.swift
//  ExpensesApp
//
//  Created by devxcode on 26/09/2024.
//

import SwiftUI

struct TabAppView: View {
    var body: some View {
        TabView {
                ExpensesView()
                    .tabItem {

                        Label("Expensives", systemImage: "dollarsign.square")
                    }
                OverView()
                    .tabItem {

                        Label("Overview", systemImage: "chart.bar")
                    }
                ChartPieView()
                    .tabItem {

                        Label("Chart", systemImage: "chart.pie.fill")
                    }
        }
    }
}

struct TabAppView_Previews: PreviewProvider {
    static var previews: some View {
        TabAppView()
            .environmentObject(todoExpView())
    }
}
