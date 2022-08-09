//
//  NetworkClientProtocol.swift
//  Networking
//
//  Created by Bastián Véliz Vega on 08-08-22.
//

import Foundation

public protocol NetworkClientProtocol {
    func getData(url: URL,
                 httpMethod: HttpMethod,
                 body: [String: Any]?) async throws -> Data
}
