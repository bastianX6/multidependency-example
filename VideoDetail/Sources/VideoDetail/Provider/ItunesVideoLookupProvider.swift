//
//  ItunesVideoLookupProvider.swift
//
//
//  Created by bastian.veliz.vega on 21-08-22.
//

import Foundation
import Networking

protocol ItunesVideoLookupProviderProtocol {
    func getDetail(for id: Int64) async throws -> VideoDetailModel
}

class ItunesVideoLookupProvider: ItunesVideoLookupProviderProtocol {
    private let service: ItunesVideoLookupServiceProtocol

    init(service: ItunesVideoLookupServiceProtocol = ItunesVideoLookupService()) {
        self.service = service
    }

    func getDetail(for id: Int64) async throws -> VideoDetailModel {
        let response = try await self.service.getVideoDetail(for: id)
        guard let element = response.results?.first,
              let model = VideoDetailModel(element: element)
        else {
            throw NetworkClientError.noData
        }
        return model
    }
}
