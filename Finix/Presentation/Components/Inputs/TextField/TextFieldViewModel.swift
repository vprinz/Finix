// Created by Valerie N. Prinz on 29/10/2024.

import Foundation
import SwiftUI

class TextFieldViewModel: BaseTextInputViewModel {
    struct ButtonConfiguration {
        let imageName: String
        let action: () -> Void
    }
    
    var buttonConfig: ButtonConfiguration?
    
    init(
        value: Binding<String>,
        placeholder: String = "",
        style: BaseTextInputViewModel.Style = .white,
        disabled: Bool = false,
        buttonConfig: ButtonConfiguration? = nil
    ) {
        self.buttonConfig = buttonConfig
        super.init(value: value, placeholder: placeholder, style: style, disabled: disabled)
    }
}
