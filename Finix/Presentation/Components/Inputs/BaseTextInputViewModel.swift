// Created by Valerie N. Prinz on 25/10/2024.

import Foundation
import SwiftUI

class BaseTextInputViewModel: ObservableObject {
    enum Style {
        case white
        case gray
        
        var color: Color {
            switch self {
            case .white: Color.white
            case .gray: Color.borderStroke // TODO: change name of color
            }
        }
    }
    
    enum State {
        case inactive
        case focused
        case disabled
    }
    
    var placeholder: String
    var style: Style
    
    var backgroundColor: Color {
        switch state {
        case .disabled:
            Color.disabledBackground
        default:
            style.color
        }
    }
    
    var borderColor: Color {
        if error != nil {
            return Color.error
        }
        switch state {
        case .inactive:
            return Color.borderStroke
        case .focused:
            return Color.customPrimary
        case .disabled:
            return Color.disabledBackground
        }
    }
    
    @Binding var value: String
    @Published var state: State = .inactive
    @Published var error: String?
    
    init(
        value: Binding<String>,
        placeholder: String = "", // TODO: Add default placeholder
        style: Style = .white,
        disabled: Bool = false
    ) {
        self._value = value
        self.placeholder = placeholder
        self.style = style
        if disabled {
            state = .disabled
        }
    }
}
