// Created by Valerie N. Prinz on 25/10/2024.

import SwiftUI

extension TextEditorView {
    struct Model {
        let defaultValue: String
        let isDisabled: Bool
        
        var backgroundColor: Color {
            isDisabled == true ? Color.disabledBackground : Color.white
        }
    }
}

struct TextEditorView: View {
    var model: Model
    @StateObject private var viewModel = TextEditorViewModel()
    @FocusState private var isFocused: Bool
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            TextEditor(text: $viewModel.value)
                .disabled(model.isDisabled)
                .tint(Color.customPrimary)
                .textEditorStyle(.plain)
                .focused($isFocused)
                .padding(12)
            
            if viewModel.value.isEmpty && !isFocused {
                Text("Input") // TODO: add Font extension
                    .padding(.leading, 12)
                    .padding(.top, 20)
            }
        }
        .frame(height: 80)
        .background(model.backgroundColor)
        .clipShape(.rect(cornerRadius: 12))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .inset(by: 0.5)
                .stroke(viewModel.borderColor, lineWidth: 1)
        )
    }
}

#Preview {
    VStack {
        TextEditorView(model: TextEditorView.Model(
            defaultValue: "Input",
            isDisabled: false
        ))
        TextEditorView(model: TextEditorView.Model(
            defaultValue: "Input",
            isDisabled: false
        ))
        TextEditorView(model: TextEditorView.Model(
            defaultValue: "Input",
            isDisabled: true
        ))
    }
    .padding()
    .background(Color.figmaBackground)
}
