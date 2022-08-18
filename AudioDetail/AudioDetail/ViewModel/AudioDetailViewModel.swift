//
//  AudioDetailViewModel.swift
//  AudioDetail
//
//  Created by bastian.veliz.vega on 18-08-22.
//

import Combine
import Foundation

class AudioDetailViewModel: ObservableObject {
    private var currentTask: Task<Void, Never>?
    private let provider: ItunesAudioLookupProviderProtocol
    @Published var state: AudioDetailViewState<AudioDetailModel> = .loading

    init(provider: ItunesAudioLookupProviderProtocol = ItunesAudioLookupProvider()) {
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

    func updateState(_ state: AudioDetailViewState<AudioDetailModel>) {
        DispatchQueue.main.async {
            self.state = state
        }
    }
}

enum AudioDetailViewState<T> {
    case loading
    case withData(T)
    case error(Error)
}
