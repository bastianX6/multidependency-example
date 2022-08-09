//
//  NetworkClientError+Id.swift
//  NetworkingTests
//
//  Created by bastian.veliz.vega on 09-08-22.
//

import Foundation
@testable import Networking

extension NetworkClientError {
    var identifier: String {
        switch self {
        case .badHttpStatus:
            return "badHttpStatus"
        case .noData:
            return "noData"
        case .noHttpResponse:
            return "noHttpResponse"
        case .noUrl:
            return "noUrl"
        }
    }
}
