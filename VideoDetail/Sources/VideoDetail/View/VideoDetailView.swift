//
//  VideoDetailView.swift
//
//
//  Created by bastian.veliz.vega on 21-08-22.
//

import AVKit
import SDWebImageSwiftUI
import SwiftUI

public struct VideoDetailView: View {
    @ObservedObject private var viewModel: VideoDetailViewModel

    private let trackId: Int64

    init(trackId: Int64, viewModel: VideoDetailViewModel) {
        self.trackId = trackId
        self.viewModel = viewModel
    }

    public init(trackId: Int64) {
        self.init(trackId: trackId, viewModel: VideoDetailViewModel())
    }

    public var body: some View {
        self.viewForState
            .onAppear {
                self.viewModel.loadDetail(trackId: self.trackId)
            }
            .onDisappear {
                self.viewModel.currentPlayer?.replaceCurrentItem(with: nil)
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
        case let .withData(model):
            self.getDetailView(model: model)
        }
    }

    func getDetailView(model: VideoDetailModel) -> some View {
        ScrollView {
            VStack {
                WebImage(url: model.coverUrl)
                    .resizable()
                    .placeholder(Image(systemName: "play.circle.fill"))
                    .scaledToFit()
                    .frame(width: 100, height: 100, alignment: .center)
                    .cornerRadius(50)
                Text(model.songName)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                Text(model.albumName)
                    .italic()
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                Text(model.artistName)
                    .bold()
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                if let url = model.previewUrl {
                    self.getVideoPlayer(url: url)
                }
            }
        }
    }

    func getVideoPlayer(url: URL) -> some View {
        self.viewModel.currentPlayer?.replaceCurrentItem(with: nil)
        let player = AVPlayer(url: url)
        self.viewModel.currentPlayer = player
        return VideoPlayer(player: player)
            .frame(height: 400)
    }
}
