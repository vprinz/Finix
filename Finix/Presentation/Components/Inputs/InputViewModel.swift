// Created by Valerie N. Prinz on 24/10/2024.

import Foundation
import SwiftUI

class InputViewModel: ObservableObject {
    @Published var value: String = ""
    @Published var borderColor: Color = .border
    
    func changeBorderColor(_ isChanged: Bool) {
        borderColor = isChanged ? .customPrimary : .border
    }
}
