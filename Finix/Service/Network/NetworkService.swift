//  Created by Valerie N. Prinz on d+/10/2024.

import Foundation

protocol NetworkServiceProtocol {
    func send<T: Decodable>(_ request: NetworkRequest) async -> Result<T, Error>
    func download(_ request: NetworkRequest) async throws -> Data
}

class NetworkService: NetworkServiceProtocol {
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    func send<T: Decodable>(_ request: NetworkRequest) async -> Result<T, Error> {
        do {
            let urlRequest = try buildUrlRequest(from: request)
            let (data, urlResponse) = try await URLSession.shared.data(for: urlRequest)
            try validate(response: urlResponse)
            let result = try decoder.decode(T.self, from: data)
            
            return .success(result)
        } catch {
            return .failure(error)
        }
    }
    
    func download(_ request: NetworkRequest) async throws -> Data {
        let urlRequest = try buildUrlRequest(from: request)
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        
        return data
    }
    
    func validate(response: URLResponse) throws {
        guard let httpResponse = response as? HTTPURLResponse else { throw NetworkError.badResponse }
        
        switch httpResponse.statusCode {
        case 200..<300:
            return
        default:
            throw NetworkError.httpStatusCode(code: httpResponse.statusCode)
        }
    }
    
    private func buildUrlRequest(from request: NetworkRequest) throws -> URLRequest {
        guard var urlComponents = URLComponents(string: request.url) else { throw NetworkError.invalidUrl }
        
        if let query = request.query {
            urlComponents.queryItems = query.map { URLQueryItem(name: $0.key, value: $0.value) }
        }
        
        guard let url = urlComponents.url else { throw NetworkError.invalidUrl }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.allHTTPHeaderFields = request.headers
        
        if let body = request.body {
            let bodyData = try JSONSerialization.data(withJSONObject: body)
            urlRequest.httpBody = bodyData
        }
        
        return urlRequest
    }
}
