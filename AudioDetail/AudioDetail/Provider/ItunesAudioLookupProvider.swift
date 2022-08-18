//
//  ItunesAudioLookupProvider.swift
//  AudioDetail
//
//  Created by bastian.veliz.vega on 18-08-22.
//

import Foundation
import Networking

protocol ItunesAudioLookupProviderProtocol {
    func getDetail(for id: Int64) async throws -> AudioDetailModel
}

class ItunesAudioLookupProvider: ItunesAudioLookupProviderProtocol {
    private let service: ItunesAudioLookupServiceProtocol

    init(service: ItunesAudioLookupServiceProtocol = ItunesAudioLookupService()) {
        self.service = service
    }

    func getDetail(for id: Int64) async throws -> AudioDetailModel {
        let response = try await self.service.getAudioDetail(for: id)
        guard let element = response.results?.first,
              let model = AudioDetailModel(element: element)
        else {
            throw NetworkClientError.noData
        }
        return model
    }
}
