//
//  NetworkService.swift
//  Finix
//
//  Created by Valerie N. Prinz on 09/10/2024.
//

import Foundation


enum NetworkError: Error {
    case missingAPIKey
    case missingBaseURL
    case badUrl
    case decodingError
    case unknown(Error)
}


struct NetworkService {
    
    let apiKey = Bundle.main.infoDictionary?["FREE_CURRENCY_API_KEY"] as? String
    let baseUrl = "https://api.freecurrencyapi.com/v1/latest"
    
    func getLatestExchangeRates(
        baseCurrency: String,
        currencies: [String]
    ) async -> Result<LatestExchangeRates, NetworkError> {
        let parameters = [
            "base_currency": baseCurrency,
            "currencies": currencies.joined(separator: ",")
        ]
        switch createRequest(parameters: parameters) {
        case .success(let request):
            let result = await performRequest(request, decodeTo: LatestExchangeRates.self)
            switch result {
            case .success(let exhangeRates):
                return .success(exhangeRates)
            case .failure(let error):
                return .failure(error)
            }
        case .failure(let error):
            return .failure(error)
        }
    }
    
    private func performRequest<T: Decodable>(
        _ request: URLRequest,
        decodeTo type: T.Type
    ) async -> Result<T, NetworkError> {
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decoder = JSONDecoder()
            let response = try decoder.decode(type, from: data)
            return .success(response)
        } catch {
            return .failure(.decodingError)
        }
    }
    
    private func createRequest(parameters: [String: String]) -> Result<URLRequest, NetworkError> {
        switch validateAPIConfig() {
        case .success():
            guard var urlComponents = URLComponents(string: baseUrl) else { return .failure(.badUrl) }
            var queryItems = [URLQueryItem(name: "apikey", value: apiKey!)]
            for (key, value) in parameters {
                queryItems.append(URLQueryItem(name: key, value: value))
            }
            guard let urlWithParams = urlComponents.url else { return .failure(.badUrl) }
            let request = URLRequest(url: urlWithParams)
            return .success(request)
        case .failure(let error):
            return .failure(error)
        }
    }
    
    private func validateAPIConfig() -> Result<Void, NetworkError> {
        guard apiKey != nil else { return .failure(.missingAPIKey) }
//        guard baseUrl != nil else { return .failure(.missingBaseURL) }
        
        return .success(())
    }
}
