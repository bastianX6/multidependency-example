//
//  ItunesSearchService.swift
//  Search
//
//  Created by bastian.veliz.vega on 09-08-22.
//

import Foundation
import Networking

protocol ItunesSearchServiceProtocol {
    func getSearchResults(for text: String, type: SearchType) async throws -> ItunesSearchResponse
}

class ItunesSearchService: ItunesSearchServiceProtocol {
    private let client: NetworkClientProtocol

    init(client: NetworkClientProtocol = NetworkClient()) {
        self.client = client
    }

    func getSearchResults(for text: String, type: SearchType) async throws -> ItunesSearchResponse {
        guard let query = text.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            throw NetworkClientError.noUrl
        }

        let baseUrlString = Endpoints.search.path
        let urlString = String(format: "%@?term=%@&media=%@", baseUrlString, query, type.urlValue)
        guard let url = URL(string: urlString)
        else {
            throw NetworkClientError.noUrl
        }

        let data = try await self.client.getData(url: url, httpMethod: Endpoints.search.httpMethod, body: nil)
        let response = try JSONDecoder().decode(ItunesSearchResponse.self, from: data)
        return response
    }
}
