//
//  ExpensesAppApp.swift
//  ExpensesApp
//
//  Created by devxcode on 26/09/2024.
//

import SwiftUI

@main
struct ExpensesAppApp: App {
    var body: some Scene {
        WindowGroup {
            TabAppView()
                .environmentObject(todoExpView())
        }
    }
}
