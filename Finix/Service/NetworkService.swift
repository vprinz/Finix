//
//  NetworkService.swift
//  Finix
//
//  Created by Valerie N. Prinz on 09/10/2024.
//

import Foundation


enum NetworkError: Error {
    case missingAPIKey
    case badUrl
    case decodingError
    case unknown(Error)
}
