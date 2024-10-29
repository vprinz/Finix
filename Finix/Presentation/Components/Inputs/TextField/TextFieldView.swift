// Created by Valerie N. Prinz on 24/10/2024.

import SwiftUI

struct TextFieldView: View {
    @StateObject var viewModel: TextFieldViewModel
    @FocusState private var isFocused: Bool
    
    var body: some View {
        HStack {
            TextField(
                viewModel.placeholder,
                text: $viewModel.value
            )
            .focused($isFocused)
            .disabled(viewModel.state == .disabled)
            .tint(Color.customPrimary)
            .padding(12)
            .onChange(of: isFocused) { _, newValue in
                withAnimation {
                    viewModel.state = newValue ? .focused : .inactive
                }
            }
        }
        .frame(height: 48)
        .background(viewModel.backgroundColor)
        .clipShape(.rect(cornerRadius: 12))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .inset(by: 0.5)
                .stroke(viewModel.borderColor, lineWidth: 1)
        )
    }
}

#Preview {
    @Previewable @State var tf2: String = ""
    var tf1: String = ""
    VStack {
        TextFieldView(viewModel: TextFieldViewModel(
            value: .init(get: {
                tf1
            }, set: { newValue in
                tf1 = newValue
            }),
            placeholder: "Enter text",
            disabled: false
        ))
        TextFieldView(viewModel: TextFieldViewModel(
            value: $tf2,
            placeholder: "Enter text",
            style: .gray,
            disabled: false
        ))
        TextFieldView(viewModel: TextFieldViewModel(
            value: .init(get: {
                ""
            }, set: { _ in
                
            }),
            placeholder: "Enter text",
            disabled: true
        ))
        TextFieldView(viewModel: TextFieldViewModel(
            value: .init(get: {
                "Some text"
            }, set: { _ in
                
            }),
            placeholder: "Enter text",
            disabled: true
        ))
    }
    .padding()
    .background(Color.figmaBackground)
}
