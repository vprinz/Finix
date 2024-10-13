//
//  NetworkRequest.swift
//  Finix
//
//  Created by Igor Uglev on 13.10.24.
//

import Foundation

protocol NetworkRequest {
    var url: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var query: [String: String]? { get }
    var body: [String: Any]? { get }
}
