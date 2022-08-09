//
//  FakeURLSession.swift
//  NetworkingTests
//
//  Created by bastian.veliz.vega on 09-08-22.
//

import Foundation
@testable import Networking

class FakeURLSession: URLSessionProtocol {
    enum State {
        case success(Data)
        case failure(NetworkClientError)
    }

    var state: State = .success(Data())

    func data(for _: URLRequest, delegate _: URLSessionTaskDelegate?) async throws -> (Data, URLResponse) {
        switch state {
        case let .success(data):
            let url = URL(string: "http://github.com")!
            let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)!
            return (data, response)
        case let .failure(networkClientError):
            switch networkClientError {
            case let .badHttpStatus(statusCode):
                let url = URL(string: "http://github.com")!
                let response = HTTPURLResponse(url: url, statusCode: statusCode, httpVersion: nil, headerFields: nil)!
                return (Data(), response)
            case .noHttpResponse:
                return (Data(), URLResponse())
            default:
                break
            }
            throw networkClientError
        }
    }
}
