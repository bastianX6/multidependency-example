//
//  SearchType.swift
//  Search
//
//  Created by bastian.veliz.vega on 18-08-22.
//

import Foundation

enum SearchType: Int {
    case music
    case musicVideo
    case tvShow
}

extension SearchType {
    var urlValue: String {
        switch self {
        case .music:
            return "music"
        case .musicVideo:
            return "musicVideo"
        case .tvShow:
            return "tvShow"
        }
    }
}
