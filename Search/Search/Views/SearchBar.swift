//
//  SearchBar.swift
//  Search
//
//  Created by bastian.veliz.vega on 09-08-22.
//

import Foundation
import SwiftUI

// Code from: https://medium.com/@axelhodler/creating-a-search-bar-for-swiftui-e216fe8c8c7f
struct SearchBar: UIViewRepresentable {
    @Binding var text: String
    var placeholder: String

    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String

        init(text: Binding<String>) {
            self._text = text
        }

        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            self.text = searchBar.text ?? ""
            searchBar.resignFirstResponder()
        }
    }

    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: $text)
    }

    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.placeholder = self.placeholder
        searchBar.searchBarStyle = .minimal
        searchBar.autocapitalizationType = .none
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context _: UIViewRepresentableContext<SearchBar>) {
        uiView.text = self.text
    }
}
