//
//  FXService.swift
//  Finix
//
//  Created by Valerie N. Prinz on 08/10/2024.
//

import Foundation

protocol FXServiceProtocol {
    func getLatestExchangeRates(
        baseCurrency: String,
        currencies: [String]
    ) async -> Result<LatestExchangeRates, Error>
    func getHistoricalExchangeRates(
        date: String,
        baseCurrency: String,
        currencies: [String]
    ) async -> Result<HistoricalExchangeRates, Error>
}

class FXService: FXServiceProtocol {
    
    private let networkService: NetworkServiceProtocol
    
    private let apiKey: String
    
    init?(networkService: NetworkServiceProtocol) {
        guard let apiKey = Bundle.main.infoDictionary?["FREE_CURRENCY_API_KEY"] as? String else {
            return nil
        }
        
        self.networkService = networkService
        self.apiKey = apiKey
    }
    
    func getLatestExchangeRates(
        baseCurrency: String,
        currencies: [String]
    ) async -> Result<LatestExchangeRates, Error> {
        let requestModel = FXGetLatestRequestModel(
            apiKey: apiKey,
            baseCurrency: baseCurrency,
            currencies: currencies
        )
        let request = FXRequest.getLatest(model: requestModel)
        
        return await networkService.send(request)
    }
    
    func getHistoricalExchangeRates(
        date: String,
        baseCurrency: String,
        currencies: [String]
    ) async -> Result<HistoricalExchangeRates, Error> {
        let requestModel = FXGetHistoricalRequestModel(
            apiKey: apiKey,
            date: date,
            baseCurrency: baseCurrency,
            currencies: currencies
        )
        let request = FXRequest.getHistorical(model: requestModel)
        
        return await networkService.send(request)
    }
}
