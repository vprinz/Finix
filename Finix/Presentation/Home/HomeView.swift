//
//  HomeView.swift
//  Finix
//
//  Created by Valerie N. Prinz on 09/10/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        Text("Home")
        Spacer()
        NavigationLink(value: HomeRoute.history) {
            VStack {
                Image(systemName: "banknote")
                Text("Tap to open history")
            }
            .padding()
            .background(Color.gray.opacity(0.75))
            .clipShape(.rect(cornerRadii: .init(topLeading: 16, bottomLeading: 8, bottomTrailing: 8, topTrailing: 16)))
        }
        Spacer()
    }
}

#Preview {
    HomeView()
}
