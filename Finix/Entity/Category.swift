// Created by Valerie N. Prinz on 03/12/2024.

import SwiftData
import SwiftUI

@Model
final class Category {
    @Attribute(.unique) var id: UUID
    var name: String
    var iconName: String
    var iconColorHex: String
    var isDefault: Bool
    
    var iconColor: Color {
        Color(hex: iconColorHex)
    }
    
    init(
        id: UUID = UUID(),
        name: String,
        iconName: String,
        iconColor: Color,
        isDefault: Bool = false
    ) {
        self.id = id
        self.name = name
        self.iconName = iconName
        self.iconColorHex = iconColor.toHex()
        self.isDefault = isDefault
    }
}
