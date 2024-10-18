//  Created by Valerie N. Prinz on 05/10/2024.

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @Query private var wallets: [Wallet]

    var body: some View {
        Button {
            let walletService = WalletService(modelContext: context)
            do {
                let _ = try walletService.create(name: "Cibus", currency: .ils)
            } catch {
                print(error)
            }
        } label: {
            Text("Add new Wallet")
        }

        VStack {
            List {
                ForEach(wallets) { wallet in
                    Text(wallet.name)
                }
                .onDelete { indextSet in
                    indextSet.forEach { idx in
                        print(idx)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Wallet.self, inMemory: true)
}
