//
//  AudioDetailModel.swift
//  AudioDetail
//
//  Created by bastian.veliz.vega on 18-08-22.
//

import Foundation

struct AudioDetailModel: Identifiable {
    let id = UUID()

    let artistName: String
    let songName: String
    let albumName: String
    let coverUrlString: String
    var coverUrl: URL? {
        return URL(string: self.coverUrlString)
    }

    let previewUrlString: String
    var previewUrl: URL? {
        return URL(string: self.previewUrlString)
    }

    init(artistName: String,
         songName: String,
         albumName: String,
         coverUrlString: String,
         previewUrlString: String)
    {
        self.artistName = artistName
        self.songName = songName
        self.albumName = albumName
        self.coverUrlString = coverUrlString
        self.previewUrlString = previewUrlString
    }

    init?(element: ItunesAudioElement) {
        guard let artistName = element.artistName,
              let songName = element.trackName,
              let albumName = element.collectionName,
              let coverUrlString = element.artworkUrl100,
              let previewUrlString = element.previewUrl
        else {
            return nil
        }
        self.artistName = artistName
        self.songName = songName
        self.albumName = albumName
        self.coverUrlString = coverUrlString
        self.previewUrlString = previewUrlString
    }
}
