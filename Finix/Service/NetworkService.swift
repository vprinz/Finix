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


enum APIEndpoint: String {
    case latest = "/latest"
    case historical = "/historical"
}


struct NetworkService {
    
    let apiKey = Bundle.main.infoDictionary?["FREE_CURRENCY_API_KEY"] as? String
    let baseUrl = "https://api.freecurrencyapi.com/v1"
    
    func getLatestExchangeRates(
        baseCurrency: String,
        currencies: [String]
    ) async -> Result<LatestExchangeRates, NetworkError> {
        let url = "\(baseUrl)\(APIEndpoint.latest.rawValue)"
        let parameters = [
            "base_currency": baseCurrency,
            "currencies": currencies.joined(separator: ",")
        ]
        return await getExchangeRates(url: url, parameters: parameters, decodeTo: LatestExchangeRates.self)
    }
    
    private func getExchangeRates<T: Decodable>(
        url: String,
        parameters: [String: String],
        decodeTo type: T.Type
    ) async -> Result<T, NetworkError> {
        switch createRequest(url: url, parameters: parameters) {
        case .success(let request):
            print("1 Decoding to type: \(type)")
            let result = await performRequest(request, decodeTo: type)
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
    
    private func createRequest(url: String, parameters: [String: String]) -> Result<URLRequest, NetworkError> {
        switch validateAPIConfig() {
        case .success():
            guard var urlComponents = URLComponents(string: url) else { return .failure(.badUrl) }
            
            var queryItems = [URLQueryItem(name: "apikey", value: apiKey!)]
            for (key, value) in parameters {
                queryItems.append(URLQueryItem(name: key, value: value))
            }
            urlComponents.queryItems = queryItems
            
            guard let urlWithParams = urlComponents.url else { return .failure(.badUrl) }
            
            let request = URLRequest(url: urlWithParams)
            return .success(request)
        case .failure(let error):
            return .failure(error)
        }
    }
    
    private func performRequest<T: Decodable>(
        _ request: URLRequest,
        decodeTo type: T.Type
    ) async -> Result<T, NetworkError> {
        do {
            print("2 Decoding to type: \(type)")
            print(request.url!)
            let (data, _) = try await URLSession.shared.data(for: request)
            let decoder = JSONDecoder()
            let response = try decoder.decode(type, from: data)
            return .success(response)
        } catch _ as URLError {
            return .failure(.badUrl)
        } catch let error as DecodingError {
            print(error)
            return .failure(.decodingError)
        } catch {
            return .failure(.unknown(error))
        }
    }
    
    private func validateAPIConfig() -> Result<Void, NetworkError> {
        guard apiKey != nil else { return .failure(.missingAPIKey) }
//        guard baseUrl != nil else { return .failure(.missingBaseURL) }
        
        return .success(())
    }
}
