//  Created by Valerie N. Prinz on 05/10/2024.

import SwiftUI
import SwiftData

struct ContentView: View {

    var body: some View {
        VStack {
            Text("Hello")
        }
        .onAppear {
            print(UUID())
        }
    }
}

#Preview {
    ContentView()
}
