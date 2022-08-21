//
//  ItunesAudioResponse.swift
//  AudioDetail
//
//  Created by bastian.veliz.vega on 18-08-22.
//

import Foundation

struct ItunesAudioResponse: Codable {
    let resultCount: Int?
    let results: [ItunesAudioElement]?
}
