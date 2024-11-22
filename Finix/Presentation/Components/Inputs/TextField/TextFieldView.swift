// Created by Valerie N. Prinz on 24/10/2024.

import SwiftUI

struct TextFieldView: View {
    @StateObject var viewModel: TextFieldViewModel
    @FocusState private var isFocused: Bool
    
    var body: some View {
        HStack {
            TextField(
                "",
                text: $viewModel.value,
                prompt: Text(viewModel.placeholder)
                    .foregroundColor(Color.textTertiary)
            )
            .foregroundStyle(viewModel.textColor)
            .focused($isFocused)
            .disabled(viewModel.state == .disabled)
            .tint(Color.customPrimary)
            .padding(12)
            .onChange(of: isFocused) { _, newValue in
                withAnimation {
                    viewModel.state = newValue ? .focused : .inactive
                }
            }
            
            if let buttonConfig = viewModel.buttonConfig {
                Button {
                    buttonConfig.action()
                } label: {
                    Image(buttonConfig.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 24, height: 24)
                        .foregroundStyle(Color.customPrimary)
                        .padding(12)
                }
            }

        }
        .walletCardFrame(
            height: 48,
            backgroundColor: viewModel.backgroundColor,
            cornerRadius: 12,
            strokeColor: viewModel.borderColor
        )
    }
}

#Preview {
    @Previewable @State var tf1: String = ""
    @Previewable @State var tf3: String = "Current value"
    
    let buttonConfig1 = TextFieldViewModel.ButtonConfiguration(
        imageName: "clear-circle") {
            print("Button Config 1")
        }
    let buttonConfig2 = TextFieldViewModel.ButtonConfiguration(
        imageName: "pencil") {
            print("Button Config 2")
        }

    VStack {
        TextFieldView(viewModel: .init(value: $tf1))
        TextFieldView(viewModel: .init(
            value: $tf3,
            buttonConfig: buttonConfig1
        ))
        TextFieldView(viewModel: TextFieldViewModel(
            value: $tf3,
            disabled: true,
            buttonConfig: buttonConfig2
        ))
        TextFieldView(viewModel: TextFieldViewModel(
            value: .init(get: {
                "Some text"
            }, set: { _ in
                
            })
        ))
        TextFieldView(viewModel: TextFieldViewModel(
            value: .init(get: {
                "Some text"
            }, set: { _ in
                
            }),
            disabled: true
        ))
    }
    .padding()
    .background(Color.finixBackground)
}
