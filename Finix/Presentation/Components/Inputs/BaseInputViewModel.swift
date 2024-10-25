// Created by Valerie N. Prinz on 25/10/2024.

import Foundation
import SwiftUI

class BaseInputViewModel: ObservableObject {
    enum BorderColorType {
        case plain
        case focused
        case error
        
        var color: Color {
            switch self {
            case .plain: Color.borderStroke
            case .focused: Color.customPrimary
            case .error: Color.error
            }
        }
    }
    
    @Published var value: String = ""
    @Published var borderColor: Color = BorderColorType.plain.color
    
    
    func changeBorderColor(borderColorType: BorderColorType) {
        borderColor = borderColorType.color
    }
}
