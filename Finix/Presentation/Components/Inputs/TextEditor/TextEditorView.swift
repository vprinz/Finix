// Created by Valerie N. Prinz on 25/10/2024.

import SwiftUI

struct TextEditorView: View {
    @StateObject var viewModel: TextEditorViewModel
    @FocusState private var isFocused: Bool
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            TextEditor(text: $viewModel.value)
                .foregroundStyle(viewModel.textColor)
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
                Text(viewModel.placeholder)
                    .foregroundStyle(Color.textTertiary)
                    .padding(.leading, 12)
                    .padding(.top, 20)
            }
        }
        .cardFrame(
            height: 80,
            backgroundColor: viewModel.backgroundColor,
            cornerRadius: 12,
            strokeColor: viewModel.borderColor
        )
    }
}

#Preview {
    @Previewable @State var value1: String = ""
    var value2: String = "Some text"
    VStack {
        TextEditorView(viewModel: .init(
            value: $value1
        ))
        TextEditorView(viewModel: .init(
            value: .init(get: {
                value2
            }, set: { newValue in
                value2 = newValue
            })
        ))
        TextEditorView(viewModel: .init(
            value: .init(get: {
                ""
            }, set: { _ in
                
            }),
            disabled: true
        ))
    }
    .padding()
    .background(Color.finixBackground)
}
