//
//  NetworkClient.swift
//  Networking
//
//  Created by Bastián Véliz Vega on 08-08-22.
//

import Foundation

public class NetworkClient: NetworkClientProtocol {
    private let urlSession: URLSessionProtocol

    public init(urlSession: URLSessionProtocol = URLSession.shared) {
        self.urlSession = urlSession
    }

    public func getData(url: URL, httpMethod: HttpMethod, body: [String: Any]?) async throws -> Data {
        var httpBody: Data?

        if let body = body {
            httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
        }

        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        request.httpBody = httpBody
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let (data, response) = try await URLSession.shared.data(for: request, delegate: nil)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkClientError.noHttpResponse
        }

        guard httpResponse.statusCode == 200 else {
            throw NetworkClientError.badHttpStatus(statusCode: httpResponse.statusCode)
        }

        return data
    }
}
