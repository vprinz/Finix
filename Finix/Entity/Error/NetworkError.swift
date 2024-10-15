//  Created by Igor Uglev on 13.10.24.

import Foundation

enum NetworkError: AppError {
    case badResponse
    case httpStatusCode(code: Int)
    case invalidUrl
    
    var description: String {
        switch self {
        case .badResponse:
            "Bad Response."
        case .httpStatusCode(let code):
            "HTTP Error \(code)."
        case .invalidUrl:
            "URL is invalid."
        }
    }
}
