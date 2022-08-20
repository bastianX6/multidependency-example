//
//  SearchView.swift
//  Search
//
//  Created by bastian.veliz.vega on 09-08-22.
//

import AudioDetail
import Foundation
import SwiftUI

public struct SearchView: View {
    @ObservedObject private var viewModel = SearchViewModel()

    init(viewModel: SearchViewModel) {
        self.viewModel = viewModel
    }

    public init() {
        self.init(viewModel: SearchViewModel())
    }

    public var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: self.$viewModel.text, placeholder: "search an artist")
                Picker("Search type", selection: self.$viewModel.searchType) {
                    Text("Audio").tag(SearchType.music.rawValue)
                    Text("Music Video").tag(SearchType.musicVideo.rawValue)
                    Text("TV Show").tag(SearchType.tvShow.rawValue)
                }
                .pickerStyle(.segmented)
                .padding([.leading, .trailing])
                self.viewForState
            }
            .navigationBarTitle("Itunes Search")
        }
    }

    @ViewBuilder var viewForState: some View {
        switch self.viewModel.state {
        case .loading:
            Text("Loading...")
                .frame(minHeight: 0, maxHeight: .infinity)
        case let .error(error):
            Text("Error: \(error.localizedDescription)")
                .frame(minHeight: 0, maxHeight: .infinity)
        case let .withData(elements):
            if elements.isEmpty {
                Text("No results")
                    .frame(minHeight: 0, maxHeight: .infinity)
            } else {
                VStack {
                    List {
                        ForEach(elements, id: \.id) { item in
                            switch item.type {
                            case .music:
                                NavigationLink(destination: AudioDetailView(trackId: item.trackId)) {
                                    SearchViewCell(model: item)
                                }
                            default:
                                NavigationLink(destination: Text("Coming soon..")) {
                                    SearchViewCell(model: item)
                                }
                            }
                        }
                    }
                }
            }
        case .initial:
            Text("Type an artist or song in search bar")
                .frame(minHeight: 0, maxHeight: .infinity)
        }
    }
}
