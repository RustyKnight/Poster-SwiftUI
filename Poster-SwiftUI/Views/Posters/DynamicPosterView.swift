//
//  DynamicPosterView.swift
//  Poster-SwiftUI
//
//  Created by Shane Whitehead on 21/1/2024.
//

import Foundation
import SwiftUI

public protocol PosterViewDelegate {
    //    func didTapPoster()
    func imageForPoster() async throws -> Data?
}

public struct DynamicPosterView: View {
    @State private var posterImage: Data?
    
    @State private var prototypeImage: Image
    @State private var prototypeText: String?
    private var delegate: PosterViewDelegate
    
    public var body: some View {
        posterCellView()
            .onAppear {
                Task {
                    do {
                        try await loadPosterImage()
                    } catch {
                        // Apply some kind of error state
                        // It would probably be better to make use
                        // the delegate in order to customise the
                        // error handling
                        withAnimation {
                            prototypeImage = Image.errorFilled
                        }
                    }
                }
            }
    }
    
    public init(prototypeImage: Image, prototypeText: String? = nil, delegate: PosterViewDelegate) {
        self._prototypeImage = State(initialValue: prototypeImage)
        self._prototypeText = State(initialValue: prototypeText)
        self.delegate = delegate
    }
    
    private func posterCellView() -> some View {
        return PosterViewBuilder.buildView(
            posterImage,
            prototypeImage: prototypeImage,
            prototypeText: prototypeText
        )
    }
    
    private func loadPosterImage() async throws {
        let data = try await delegate.imageForPoster()
        withAnimation {
            posterImage = data
        }
    }
}
