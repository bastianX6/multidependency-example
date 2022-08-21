//
//  ItunesVideoLookupService.swift
//
//
//  Created by bastian.veliz.vega on 21-08-22.
//

import Foundation
import Networking

protocol ItunesVideoLookupServiceProtocol {
    func getVideoDetail(for id: Int64) async throws -> ItunesVideoResponse
}

class ItunesVideoLookupService: ItunesVideoLookupServiceProtocol {
    private let client: NetworkClientProtocol

    init(client: NetworkClientProtocol = NetworkClient()) {
        self.client = client
    }

    func getVideoDetail(for id: Int64) async throws -> ItunesVideoResponse {
        let urlString = Endpoints.lookup.path
        let query = "\(id)"

        guard let url = URL(string: urlString + "?id=" + query) else {
            throw NetworkClientError.noUrl
        }

        let data = try await self.client.getData(url: url, httpMethod: Endpoints.search.httpMethod, body: nil)
        let response = try JSONDecoder().decode(ItunesVideoResponse.self, from: data)
        return response
    }
}
