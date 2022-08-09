//
//  ItunesElement.swift
//  Search
//
//  Created by bastian.veliz.vega on 09-08-22.
//

import Foundation

struct ItunesElement: Codable {
    let wrapperType: String?
    let kind: String?
    let artistId: Int64?
    let collectionId: Int64?
    let trackId: Int64?
    let artistName: String?
    let collectionName: String?
    let trackName: String?
    let collectionCensoredName: String?
    let trackCensoredName: String?
    let artistViewUrl: String?
    let collectionViewUrl: String?
    let trackViewUrl: String?
    let previewUrl: String?
    let artworkUrl60: String?
    let artworkUrl100: String?
    let collectionPrice: Float?
    let trackPrice: Float?
    let collectionExplicitness: String?
    let trackExplicitness: String?
    let discCount: Int?
    let discNumber: Int?
    let trackCount: Int?
    let trackNumber: Int?
    let trackTimeMillis: Int64?
    let country: String?
    let currency: String?
    let primaryGenreName: String?
}
