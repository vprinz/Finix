//  Created by Valerie N. Prinz on 05/10/2024.

import SwiftUI

struct ContentView: View {

    var body: some View {
        TabView {
            Tab("Home", systemImage: "house.fill") {
                HomeRouter()
            }
            Tab("Add", systemImage: "plus.app") {
                AddExpenseView()
            }
            Tab("Account", systemImage: "person.crop.circle.fill") {
                AccountView()
            }
        }
        .onAppear {
            let c: Currency = .try
            print(c.isoCode)
        }
    }
}

#Preview {
    ContentView()
}
