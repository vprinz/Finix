//  Created by Valerie N. Prinz on 16/10/2024.

import SwiftUI

enum Currency: String, Codable, Identifiable, CaseIterable {
    case eur
    case usd
    case jpy
    case bgn
    case czk
    case dkk
    case gbp
    case huf
    case pln
    case ron
    case sek
    case chf
    case isk
    case nok
    case hrk
    case rub
    case `try`
    case aud
    case brl
    case cad
    case cny
    case hkd
    case idr
    case ils
    case inr
    case krw
    case mxn
    case myr
    case nzd
    case php
    case sgd
    case thb
    case zar
    
    var id: String {
        return self.isoCode
    }
    
    var isoCode: String {
        self.rawValue.uppercased()
    }
    
    var fullName: String? {
        Locale.current.localizedString(forCurrencyCode: isoCode)
    }
}
