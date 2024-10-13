//  Created by Igor Uglev on 13.10.24.

import Foundation

enum NetworkError: AppError {
    case badResponse
    case decodingError // TODO: Remove?
    case httpStatusCode(code: Int)
    case invalidUrl
    case unknown // TODO: Remove?
}
