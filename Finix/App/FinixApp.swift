//  Created by Valerie N. Prinz on 05/10/2024.

import SwiftUI
import SwiftData

@main
struct FinixApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([Wallet.self, Transaction.self, Account.self])
        let modelConfiguration = ModelConfiguration(schema: schema)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
