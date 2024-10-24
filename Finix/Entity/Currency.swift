//  Created by Valerie N. Prinz on 16/10/2024.

enum Currency: String, Codable {
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
    
    var isoCode: String {
        self.rawValue.uppercased()
    }
}
