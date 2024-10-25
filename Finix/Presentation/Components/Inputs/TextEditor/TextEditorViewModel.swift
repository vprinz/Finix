// Created by Valerie N. Prinz on 25/10/2024.

import Foundation
import SwiftUI

class TextEditorViewModel: ObservableObject {
    var value: String = ""
    var borderColor: Color = Color.borderStroke
    
    func changeBorderColor(_ isChanged: Bool) {
        borderColor = isChanged ? Color.customPrimary : Color.borderStroke
    }
}
