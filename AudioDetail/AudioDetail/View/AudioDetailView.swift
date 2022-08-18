//
//  AudioDetailView.swift
//  AudioDetail
//
//  Created by bastian.veliz.vega on 18-08-22.
//

import SDWebImageSwiftUI
import SwiftUI

public struct AudioDetailView: View {
    @ObservedObject private var viewModel: AudioDetailViewModel
    private let trackId: Int64

    init(trackId: Int64, viewModel: AudioDetailViewModel) {
        self.trackId = trackId
        self.viewModel = viewModel
    }

    public init(trackId: Int64) {
        self.init(trackId: trackId, viewModel: AudioDetailViewModel())
    }

    public var body: some View {
        self.viewForState
            .onAppear {
                self.viewModel.loadDetail(trackId: self.trackId)
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

    func getDetailView(model: AudioDetailModel) -> some View {
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
            }
        }
    }
}
