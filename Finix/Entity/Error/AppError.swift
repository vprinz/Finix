//  Created by Igor Uglev on 13.10.24.

import Foundation

protocol AppError: Error {
    var description: String { get }
}
