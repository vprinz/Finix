// Created by Valerie N. Prinz on 03/12/2024.

import Foundation
import SwiftUI

class CategoryService: EntityService<Category> {
    var allСategories: [Category] {
        (defaultCategories + customCategories).sorted {
            $0.name < $1.name
        }
    }
    
    // TODO: Get data from corresponding place
    var customCategories: [Category] = []
    
    var defaultCategories: [Category] = [
        Category(
            name: String(localized: "Groceries"),
            iconName: "apple", iconColor: Color.finixGreen,
            isDefault: true
        ),
        Category(
            name: String(localized: "Cafe & Restaurants"),
            iconName: "cup", iconColor: Color.finixOrange,
            isDefault: true
        ),
        Category(
            name: String(localized: "Utilities"),
            iconName: "lamp", iconColor: Color.finixYellow,
            isDefault: true
        ),
        Category(
            name: String(localized: "Transportation"),
            iconName: "plane", iconColor: Color.finixBlue,
            isDefault: true
        ),
        Category(
            name: String(localized: "Multimedia"),
            iconName: "plane", iconColor: Color.aquamarine,
            isDefault: true
        ),
        Category(
            name: String(localized: "Fitness"),
            iconName: "human-body-in-circle", iconColor: Color.mint,
            isDefault: true
        ),
        Category(
            name: String(localized: "Personal Care"),
            iconName: "lipstick-and-mirror", iconColor: Color.rose,
            isDefault: true
        ),
        Category(
            name: String(localized: "Travel"),
            iconName: "luggage", iconColor: Color.cyan,
            isDefault: true
        ),
        Category(
            name: String(localized: "Pets"),
            iconName: "paw", iconColor: Color.wine,
            isDefault: true
        ),
        Category(
            name: String(localized: "Housing"),
            iconName: "buildings", iconColor: Color.lavender,
            isDefault: true
        ),
        Category(
            name: String(localized: "Education"),
            iconName: "academic-cap", iconColor: Color.finixTeal,
            isDefault: true
        ),
        Category(
            name: String(localized: "Clothes"),
            iconName: "hanger", iconColor: Color.finixPink,
            isDefault: true
        ),
        Category(
            name: String(localized: "Gadgets"),
            iconName: "computer-and-phone", iconColor: Color.asphalt,
            isDefault: true
        ),
        Category(
            name: String(localized: "Celebrations"),
            iconName: "giftbox", iconColor: Color.lemon,
            isDefault: true
        ),
        Category(
            name: String(localized: "Health"),
            iconName: "heart", iconColor: Color.coral,
            isDefault: true
        ),
        Category(
            name: String(localized: "Insurance"),
            iconName: "security-badge", iconColor: Color.violet,
            isDefault: true
        ),
        Category(
            name: String(localized: "Bank"),
            iconName: "bank", iconColor: Color.midnight,
            isDefault: true
        ),
        Category(
            name: String(localized: "Emergency"),
            iconName: "fire", iconColor: Color.finixRed,
            isDefault: true
        ),
        Category(
            name: String(localized: "Auto"),
            iconName: "car", iconColor: Color.ocean,
            isDefault: true
        ),
        Category(
            name: String(localized: "Children"),
            iconName: "horse-toy", iconColor: Color.emerald,
            isDefault: true
        ),
        Category(
            name: String(localized: "Entertainment"),
            iconName: "controller", iconColor: Color.sunset,
            isDefault: true
        ),
        Category(
            name: String(localized: "Furnishing"),
            iconName: "chair", iconColor: Color.turquoise,
            isDefault: true
        ),
        Category(
            name: String(localized: "Others"),
            iconName: "four-squares", iconColor: Color.finixGray,
            isDefault: true
        )
    ]
}
