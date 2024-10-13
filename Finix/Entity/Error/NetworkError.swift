//  Created by Igor Uglev on 13.10.24.

import Foundation

enum NetworkError: AppError {
    case badResponse
    case decodingError // TODO: Remove?
    case httpStatusCode(code: Int)
    case invalidUrl
    case unknown // TODO: Remove?
    
    var description: String {
        switch self {
        case .badResponse:
            "Bad response"
        case .decodingError:
            "Error while decoding response"
        case .httpStatusCode(let code):
            "HTTP Error \(code)"
        case .invalidUrl:
            "URL is invalid"
        case .unknown:
            "An unknown error occured"
        }
    }
}
