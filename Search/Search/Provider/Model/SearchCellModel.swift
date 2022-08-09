//
//  SearchCellModel.swift
//  Search
//
//  Created by bastian.veliz.vega on 09-08-22.
//

import Foundation

struct SearchCellModel: Identifiable {
    let id: UUID = .init()

    let songName: String
    let artistName: String
    let coverUrlString: String
    let trackId: Int64
    var coverUrl: URL? {
        return URL(string: self.coverUrlString)
    }

    init(songName: String,
         artistName: String,
         coverUrlString: String,
         trackId: Int64)
    {
        self.songName = songName
        self.artistName = artistName
        self.coverUrlString = coverUrlString
        self.trackId = trackId
    }

    init?(element: ItunesElement) {
        guard let songName = element.trackName,
              let artistName = element.artistName,
              let coverUrl = element.artworkUrl60,
              let trackId = element.trackId
        else {
            return nil
        }
        self.songName = songName
        self.artistName = artistName
        self.coverUrlString = coverUrl
        self.trackId = trackId
    }
}
