// Created by Valerie N. Prinz on 25/10/2024.

import Foundation
import SwiftUI

struct BaseInputModel {
    enum BackgroundColorType {
        case white
        case gray
        
        var color: Color {
            switch self {
            case .white: Color.white
            case .gray: Color.borderStroke // TODO: change name of color
            }
        }
    }
    
    let defaultValue: String
    let isDisabled: Bool
    var backgroundColorType: BackgroundColorType = .white
    
    var backgroundColor: Color {
        isDisabled ? Color.disabledBackground : backgroundColorType.color
    }
}
