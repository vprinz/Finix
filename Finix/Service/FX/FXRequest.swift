// Created by Igor Uglev on 13.10.24.

import Foundation

struct FXGetLatestRequestModel {
    let apiKey: String
    let baseCurrency: String
    let currencies: [String]
}

struct FXGetHistoricalRequestModel {
    let apiKey: String
    let date: String
    let baseCurrency: String
    let currencies: [String]
}

enum FXRequest: NetworkRequest {
    case getLatest(model: FXGetLatestRequestModel)
    case getHistorical(model: FXGetHistoricalRequestModel)
    
    private var baseUrl: String { "https://api.freecurrencyapi.com/v1" }
    
    private var path: String {
        switch self {
        case .getLatest:
            "/latest"
        case .getHistorical:
            "/historical"
        }
    }
    
    var url: String {
        baseUrl + path
    }
    
    var method: HTTPMethod {
        .get
    }
    
    var headers: [String : String]? {
        nil
    }
    
    var query: [String : String]? {
        switch self {
        case let .getLatest(model):
            [
                "apiKey": model.apiKey,
                "base_currency": model.baseCurrency,
                "currencies": model.currencies.joined(separator: ",")
            ]
        case let .getHistorical(model):
            [
                "apiKey": model.apiKey,
                "date": model.date,
                "base_currency": model.baseCurrency,
                "currencies": model.currencies.joined(separator: ",")
            ]
        }
    }
    
    var body: [String : Any]? {
        nil
    }
}
