//
//  ItunesAudioLookupService.swift
//  AudioDetail
//
//  Created by bastian.veliz.vega on 18-08-22.
//

import Foundation
import Networking

protocol ItunesAudioLookupServiceProtocol {
    func getAudioDetail(for id: Int64) async throws -> ItunesAudioResponse
}

class ItunesAudioLookupService: ItunesAudioLookupServiceProtocol {
    private let client: NetworkClientProtocol

    init(client: NetworkClientProtocol = NetworkClient()) {
        self.client = client
    }

    func getAudioDetail(for id: Int64) async throws -> ItunesAudioResponse {
        let urlString = Endpoints.lookup.path
        let query = "\(id)"

        guard let url = URL(string: urlString + "?id=" + query) else {
            throw NetworkClientError.noUrl
        }

        let data = try await self.client.getData(url: url, httpMethod: Endpoints.search.httpMethod, body: nil)
        let response = try JSONDecoder().decode(ItunesAudioResponse.self, from: data)
        return response
    }
}
