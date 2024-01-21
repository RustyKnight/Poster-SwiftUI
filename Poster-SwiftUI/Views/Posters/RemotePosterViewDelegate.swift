//
//  LocalPosterViewDelegate.swift
//  Poster-SwiftUI
//
//  Created by Shane Whitehead on 21/1/2024.
//

import Foundation

struct RemotePosterViewDelegate: PosterViewDelegate {
    
    private let resourceUrl: URL
    
    init(resourceUrl: URL) {
        self.resourceUrl = resourceUrl
    }
    
    func imageForPoster() async throws -> Data? {
        try await URLSession.shared.data(from: resourceUrl).0
    }
}
