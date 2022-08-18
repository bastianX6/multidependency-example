//
//  ItunesSearchProvider.swift
//  Search
//
//  Created by bastian.veliz.vega on 09-08-22.
//

import Foundation

protocol ItunesSearchProviderProtocol {
    func search(text: String, type: SearchType) async throws -> [SearchCellModel]
}

class ItunesSearchProvider: ItunesSearchProviderProtocol {
    private let service: ItunesSearchServiceProtocol

    init(service: ItunesSearchServiceProtocol = ItunesSearchService()) {
        self.service = service
    }

    func search(text: String, type: SearchType) async throws -> [SearchCellModel] {
        let response = try await self.service.getSearchResults(for: text, type: type)
        let results = response.results ?? []
        return results.compactMap { SearchCellModel(element: $0, type: type) }
    }
}
