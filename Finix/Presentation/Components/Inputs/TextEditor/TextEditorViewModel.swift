// Created by Valerie N. Prinz on 22/11/2024.

import SwiftUI

class TextEditorViewModel: BaseTextInputViewModel {
    
    override var backgroundColor: Color {
        switch state {
        case .disabled: Color.disabledBackground
        default: Color.foreground
        }
    }
}
