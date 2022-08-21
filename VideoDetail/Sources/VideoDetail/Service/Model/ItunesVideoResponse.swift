//
//  ItunesVideoResponse.swift
//
//
//  Created by bastian.veliz.vega on 21-08-22.
//

import Foundation

struct ItunesVideoResponse: Codable {
    let resultCount: Int?
    let results: [ItunesVideoElement]?
}
