// Created by Valerie N. Prinz on 24/10/2024.

import Foundation

struct CurrencyValue {
    let currency: Currency
    var value: Double
    
    func toString() -> String {
        let formattedCurrency = value.formatted(.currency(code: currency.isoCode))
        return formattedCurrency
    }
}
