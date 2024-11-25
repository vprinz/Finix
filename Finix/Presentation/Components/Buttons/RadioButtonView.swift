// Created by Valerie N. Prinz on 25/11/2024.

import SwiftUI

extension RadioButtonView {
    class ViewModel: ObservableObject {
        @Published var selected: Bool
        let disabled: Bool
        
        var styleColor: Color {
            if selected {
                .customPrimary.opacity(disabledOpacity)
            } else {
                .finixGray.opacity(disabledOpacity)
            }
        }
        
        var overlayOpacity: Double {
            selected ? 1 : 0
        }
        
        private var disabledOpacity: Double {
            disabled ? 0.6 : 1
        }
        
        init(
            selected: Bool = false,
            disabled: Bool = false
        ) {
            self.selected = selected
            self.disabled = disabled
        }
    }
}

struct RadioButtonView: View {
    let model: ViewModel
    
    var body: some View {
        Circle()
            .stroke(model.styleColor, lineWidth: 2)
            .frame(width: 22, height: 22)
            .overlay(
                Circle()
                    .fill(model.styleColor)
                    .frame(width: 14, height: 14)
                    .opacity(model.overlayOpacity)
            )
    }
}

#Preview {
    let modelNotSelected: RadioButtonView.ViewModel = .init()
    let modelSelected: RadioButtonView.ViewModel = .init(
        selected: true
    )
    let modelDisabled: RadioButtonView.ViewModel = .init(
        disabled: true
    )
    let modelSelectedDisabled: RadioButtonView.ViewModel = .init(
        selected: true,
        disabled: true
    )
    
    HStack(spacing: 42) {
        RadioButtonView(model: modelNotSelected)
        RadioButtonView(model: modelSelected)
        RadioButtonView(model: modelDisabled)
        RadioButtonView(model: modelSelectedDisabled)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.finixBackground)
}
