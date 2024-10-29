// Created by Valerie N. Prinz on 25/10/2024.

import SwiftUI

struct TextEditorView: View {
    @StateObject var viewModel: BaseTextInputViewModel
    @FocusState private var isFocused: Bool
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            TextEditor(text: $viewModel.value)
                .disabled(viewModel.state == .disabled)
                .tint(Color.customPrimary)
                .textEditorStyle(.plain)
                .focused($isFocused)
                .padding(12)
                .onChange(of: isFocused) { _, newValue in
                    withAnimation {
                        viewModel.state = newValue ? .focused : .inactive
                    }
                }
            
            if viewModel.value.isEmpty && !isFocused {
                Text(viewModel.placeholder) // TODO: add Font extension
                    .padding(.leading, 12)
                    .padding(.top, 20)
            }
        }
        .frame(height: 80)
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
    @Previewable @State var value1: String = ""
    var value2: String = ""
    VStack {
        TextEditorView(viewModel: BaseTextInputViewModel(
            value: $value1,
            placeholder: "Enter text"
        ))
        TextEditorView(viewModel: BaseTextInputViewModel(
            value: .init(get: {
                value2
            }, set: { newValue in
                value2 = newValue
            }),
            placeholder: "Enter text"
        ))
        TextEditorView(viewModel: BaseTextInputViewModel(
            value: .init(get: {
                ""
            }, set: { _ in
                
            }),
            placeholder: "Enter text",
            disabled: true
        ))
    }
    .padding()
    .background(Color.figmaBackground)
}
