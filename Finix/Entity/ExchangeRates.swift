//  Created by Valerie N. Prinz on d+/10/2024.

import Foundation


struct LatestExchangeRates: Decodable {
    let data: [String: Double]
}


struct HistoricalExchangeRates: Decodable {
    let data: [String: [String: Double]]
}
