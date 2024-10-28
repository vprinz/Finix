//// Created by Valerie N. Prinz on 25/10/2024.
//
//import SwiftUI
//
//struct TextEditorView: View {
//    var model: BaseInputModel
//    @StateObject private var viewModel = BaseInputViewModel()
//    @FocusState private var isFocused: Bool
//    
//    var body: some View {
//        ZStack(alignment: .topLeading) {
//            TextEditor(text: $viewModel.value)
//                .disabled(model.isDisabled)
//                .tint(Color.customPrimary)
//                .textEditorStyle(.plain)
//                .focused($isFocused)
//                .padding(12)
//                .onChange(of: isFocused) { _, newValue in
//                    withAnimation {
//                        viewModel.changeBorderColor(
//                            borderColorType: newValue ? .focused : .plain
//                        )
//                    }
//                }
//            
//            if viewModel.value.isEmpty && !isFocused {
//                Text("Input") // TODO: add Font extension
//                    .padding(.leading, 12)
//                    .padding(.top, 20)
//            }
//        }
//        .frame(height: 80)
//        .background(model.backgroundColor)
//        .clipShape(.rect(cornerRadius: 12))
//        .overlay(
//            RoundedRectangle(cornerRadius: 12)
//                .inset(by: 0.5)
//                .stroke(viewModel.borderColor, lineWidth: 1)
//        )
//    }
//}
//
//#Preview {
//    VStack {
//        TextEditorView(model: BaseInputModel(
//            defaultValue: "Input",
//            isDisabled: false
//        ))
//        TextEditorView(model: BaseInputModel(
//            defaultValue: "Input",
//            isDisabled: false,
//            backgroundColorType: .gray
//        ))
//        TextEditorView(model: BaseInputModel(
//            defaultValue: "Input",
//            isDisabled: true
//        ))
//    }
//    .padding()
//    .background(Color.figmaBackground)
//}
