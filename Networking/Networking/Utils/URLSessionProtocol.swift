//
//  URLSessionProtocol.swift
//  Networking
//
//  Created by bastian.veliz.vega on 09-08-22.
//

import Foundation

public protocol URLSessionProtocol {
    func data(for request: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocol {}
