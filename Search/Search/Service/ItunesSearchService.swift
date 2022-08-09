//
//  ItunesSearchService.swift
//  Search
//
//  Created by bastian.veliz.vega on 09-08-22.
//

import Foundation
import Networking

protocol ItunesSearchServiceProtocol {
    func getSearchResults(for text: String) async throws -> ItunesSearchResponse
}

class ItunesSearchService: ItunesSearchServiceProtocol {
    private let client: NetworkClientProtocol

    init(client: NetworkClientProtocol = NetworkClient()) {
        self.client = client
    }

    func getSearchResults(for text: String) async throws -> ItunesSearchResponse {
        let urlString = Endpoints.search.path

        guard let query = text.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: urlString + "?term=" + query)
        else {
            throw NetworkClientError.noUrl
        }

        let data = try await self.client.getData(url: url, httpMethod: Endpoints.search.httpMethod, body: nil)
        let response = try JSONDecoder().decode(ItunesSearchResponse.self, from: data)
        return response
    }
}
