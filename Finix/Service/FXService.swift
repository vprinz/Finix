//
//  FXService.swift
//  Finix
//
//  Created by Valerie N. Prinz on 08/10/2024.
//

import Foundation


struct FXService {
    
    let apiKey = Bundle.main.infoDictionary?["FREE_CURRENCY_API_KEY"] as? String
    let baseUrl = "https://api.freecurrencyapi.com/v1/latest"
    
    func getLatestExchangeRates(baseCurrency: String, currencies: [String]) async -> Result<Double, NetworkError> {
        guard apiKey != nil else {
            return .failure(.missingAPIKey)
        }
        
        guard var urlComponents = URLComponents(string: baseUrl) else {
            return .failure(.badUrl)
        }
        
        let currenciesString = currencies.joined(separator: ",")
        urlComponents.queryItems = [
            URLQueryItem(name: "apikey", value: apiKey!),
            URLQueryItem(name: "base_currency", value: baseCurrency),
            URLQueryItem(name: "currencies", value: currenciesString),
        ]
        
        guard let urlWithParams = urlComponents.url else {
            return .failure(.badUrl)
        }
        
        let request = URLRequest(url: urlWithParams)
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decoder = JSONDecoder()
            let response = try decoder.decode(LatestExchangeRates.self, from: data)
            if let rate = response.data[baseCurrency] {
                return .success(rate)
            } else {
                return .failure(.decodingError)
            }
        } catch {
            return .failure(.unknown(error))
        }
    }
}
