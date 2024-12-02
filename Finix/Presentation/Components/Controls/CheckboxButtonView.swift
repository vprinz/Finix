// Created by Valerie N. Prinz on 27/11/2024.

import SwiftUI

extension CheckboxButtonView {
    struct Model {
        let selected: Bool
        let disabled: Bool
        
        var fillColor: Color {
            selected ?
                .customPrimary.opacity(disabledOpacity) :
                .clear
        }
        
        var strokeColor: Color {
            switch (disabled, selected) {
            case (true, true):
                return .clear
            case (false, true):
                return .customPrimary.opacity(disabledOpacity)
            case (_, false):
                return .finixGray.opacity(disabledOpacity)
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

struct CheckboxButtonView: View {
    let model: Model
    
    var body: some View {
        RoundedRectangle(cornerRadius: 4)
            .stroke(model.strokeColor, lineWidth: 2)
            .frame(width: 22, height: 22)
            .background(
                RoundedRectangle(cornerRadius: 4)
                    .fill(model.fillColor)
            )
            .overlay(
                Image("check-mark")
                    .foregroundColor(.white)
                    .opacity(model.overlayOpacity)
            )
    }
}

#Preview {
    let modelNotSelected: CheckboxButtonView.Model = .init()
    let modelSelected: CheckboxButtonView.Model = .init(
        selected: true
    )
    let modelDisabled: CheckboxButtonView.Model = .init(
        disabled: true
    )
    let modelSelectedDisabled: CheckboxButtonView.Model = .init(
        selected: true,
        disabled: true
    )
    
    HStack(spacing: 42) {
        CheckboxButtonView(model: modelNotSelected)
        CheckboxButtonView(model: modelSelected)
        CheckboxButtonView(model: modelDisabled)
        CheckboxButtonView(model: modelSelectedDisabled)
    }
    .padding()
    .background(Color.finixBackground)
}
