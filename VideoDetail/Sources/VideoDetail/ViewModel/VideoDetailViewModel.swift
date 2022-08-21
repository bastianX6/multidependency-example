//
//  VideoDetailViewModel.swift
//
//
//  Created by bastian.veliz.vega on 21-08-22.
//

import AVKit
import Combine
import Foundation

class VideoDetailViewModel: ObservableObject {
    private var currentTask: Task<Void, Never>?
    private let provider: ItunesVideoLookupProviderProtocol
    @Published var state: VideoDetailViewState<VideoDetailModel> = .loading
    var currentPlayer: AVPlayer?

    init(provider: ItunesVideoLookupProviderProtocol = ItunesVideoLookupProvider()) {
        self.provider = provider
    }

    func loadDetail(trackId: Int64) {
        self.updateState(.loading)
        self.currentTask?.cancel()

        let task = Task.init { [unowned self] in
            do {
                let model = try await self.provider.getDetail(for: trackId)
                self.updateState(.withData(model))
            } catch {
                self.updateState(.error(error))
            }
        }
        self.currentTask = task
    }

    func updateState(_ state: VideoDetailViewState<VideoDetailModel>) {
        DispatchQueue.main.async {
            self.state = state
        }
    }
}

enum VideoDetailViewState<T> {
    case loading
    case withData(T)
    case error(Error)
}
