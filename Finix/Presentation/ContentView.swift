//
//  ContentView.swift
//  Finix
//
//  Created by Valerie N. Prinz on 05/10/2024.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        TabView {
            Tab("Home", systemImage: "house.fill") {
                HomeView()
            }
            Tab("Add", systemImage: "plus.app") {
                AddExpenseView()
            }
            Tab("Account", systemImage: "person.crop.circle.fill") {
                AccountView()
            }
        }
    }
}

#Preview {
    ContentView()
}
