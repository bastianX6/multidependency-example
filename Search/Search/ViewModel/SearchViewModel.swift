//
//  SearchViewModel.swift
//  Search
//
//  Created by bastian.veliz.vega on 09-08-22.
//

import Foundation

class SearchViewModel: ObservableObject {
    private let provider: ItunesSearchProviderProtocol
    private var currentTask: Task<Void, Never>?
    @Published var state: SearchViewState<[SearchCellModel]> = .initial
    @Published var searchType: Int = SearchType.music.rawValue

    init(provider: ItunesSearchProviderProtocol = ItunesSearchProvider()) {
        self.provider = provider
    }

    var text: String = "" {
        didSet {
            self.search()
        }
    }

    func search() {
        self.updateState(.loading)
        self.currentTask?.cancel()
        let type = SearchType(rawValue: self.searchType) ?? .music

        let task = Task.init { [unowned self] in
            do {
                let elements = try await self.provider.search(text: self.text, type: type)
                self.updateState(.withData(elements))
            } catch {
                self.updateState(.error(error))
            }
        }
        self.currentTask = task
    }

    func updateState(_ state: SearchViewState<[SearchCellModel]>) {
        DispatchQueue.main.async {
            self.state = state
        }
    }
}

enum SearchViewState<T> {
    case loading
    case withData(T)
    case error(Error)
    case initial
}
