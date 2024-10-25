// Created by Valerie N. Prinz on 24/10/2024.

import Foundation
import SwiftUI

class TextFieldViewModel: ObservableObject {
    @Published var value: String = ""
    @Published var borderColor: Color = .borderStroke
    @Published var text: String = ""
    
    func changeBorderColor(_ isChanged: Bool) {
        borderColor = isChanged ? .customPrimary : .borderStroke
    }
}
