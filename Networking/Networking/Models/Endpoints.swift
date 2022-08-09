//
//  Endpoints.swift
//  Networking
//
//  Created by Bastián Véliz Vega on 08-08-22.
//

import Foundation

public enum Endpoints: String {
    case search
    case lookup
}

public extension Endpoints {
    var path: String {
        return BaseUrl.shared.baseUrlString + "/" + self.rawValue
    }

    var httpMethod: HttpMethod {
        switch self {
        case .search:
            return .get
        case .lookup:
            return .get
        }
    }
}
