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
                SearchBar(text: self.$viewModel.text, placeholder: "seach an artist")
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
                List {
                    ForEach(elements, id: \.id) { item in
                        NavigationLink(destination: AudioDetailView(trackId: item.trackId)) {
                            SearchViewCell(model: item)
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
