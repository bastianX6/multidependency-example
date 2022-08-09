//
//  ItunesSearchResponse.swift
//  Search
//
//  Created by bastian.veliz.vega on 09-08-22.
//

import Foundation

struct ItunesSearchResponse: Codable {
    let resultCount: Int?
    let results: [ItunesElement]?
}
