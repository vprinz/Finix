// Created by Valerie N. Prinz on 25/10/2024.

import SwiftUI

struct SecureFieldView: View {
    let model: BaseInputModel
    @StateObject private var viewModel = SecureFieldViewModel()
    @FocusState private var isFocused: Bool
    
    var body: some View {
        HStack {
            Group {
                if viewModel.isSecureMode {
                    SecureField(model.defaultValue, text: $viewModel.value)
                } else {
                    TextField(model.defaultValue, text: $viewModel.value)
                }
            }
            .disabled(model.isDisabled)
            .focused($isFocused)
            .tint(Color.customPrimary)
            .padding(12)
            .onChange(of: isFocused) { _, newValue in
                withAnimation {
                    viewModel.changeBorderColor(
                        borderColorType: newValue ? .focused : .plain
                    )
                }
            }
            
            Spacer()
            
            Button {
                viewModel.isSecureMode.toggle()
            } label: {
                Image(viewModel.isSecureMode ? "closed-eye" : "opened-eye")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 24, height: 24)
                    .foregroundStyle(Color.gray)
                    .padding(12)
            }
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
        SecureFieldView(model: BaseInputModel(
            defaultValue: "Input",
            isDisabled: false,
            backgroundColorType: .white
        ))
        SecureFieldView(model: BaseInputModel(
            defaultValue: "Input",
            isDisabled: false,
            backgroundColorType: .gray
        ))
        SecureFieldView(model: BaseInputModel(
            defaultValue: "Input",
            isDisabled: true
        ))
    }
    .padding()
    .background(Color.figmaBackground)
}
