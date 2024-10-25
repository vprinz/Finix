// Created by Valerie N. Prinz on 24/10/2024.

import Foundation
import SwiftUI

class TextFieldViewModel: ObservableObject {
    @Published var value: String = ""
    @Published var borderColor: Color = Color.borderStroke
    
    func changeBorderColor(_ isChanged: Bool) {
        borderColor = isChanged ? Color.customPrimary : Color.borderStroke
    }
}
