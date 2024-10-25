// Created by Valerie N. Prinz on 24/10/2024.

import SwiftUI

extension TextFieldView {
    struct Model {
        let defaultValue: String
        let isDisabled: Bool
        
        var backgroundColor: Color {
            isDisabled == true ? Color.disabledBackground : Color.white
        }
    }
}

struct TextFieldView: View {
    let model: Model
    @StateObject private var viewModel = BaseInputViewModel()
    
    var body: some View {
        HStack {
            TextField(
                model.defaultValue,
                text: $viewModel.value,
                onEditingChanged: { changed in
                    withAnimation {
                        viewModel.changeBorderColor(
                            borderColorType: changed ? .focused : .plain
                        )
                    }
                }
            )
            .disabled(model.isDisabled)
            .tint(Color.customPrimary)
            .padding(12)
        }
        .frame(height: 48)
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
        TextFieldView(model: TextFieldView.Model(
            defaultValue: "Input",
            isDisabled: false
        ))
        TextFieldView(model: TextFieldView.Model(
            defaultValue: "Input",
            isDisabled: false
        ))
        TextFieldView(model: TextFieldView.Model(
            defaultValue: "Input",
            isDisabled: true
        ))
    }
    .padding()
    .background(Color.figmaBackground)
}
