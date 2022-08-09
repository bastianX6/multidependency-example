//
//  NetworkClientError.swift
//  Networking
//
//  Created by Bastián Véliz Vega on 08-08-22.
//

import Foundation

public enum NetworkClientError: LocalizedError {
    case badHttpStatus(statusCode: Int)
    case noData
    case noHttpResponse
    case noUrl
}

public extension NetworkClientError {
    var errorDescription: String? {
        switch self {
        case let .badHttpStatus(statusCode):
            return "The Http status code is: \(statusCode)"
        case .noData:
            return "The Http request does not have data"
        case .noHttpResponse:
            return "Couldn't map Http Response"
        case .noUrl:
            return "Couldn't parse Url"
        }
    }
}
