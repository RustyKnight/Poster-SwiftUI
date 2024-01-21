//
//  LocalPosterViewDelegate.swift
//  Poster-SwiftUI
//
//  Created by Shane Whitehead on 21/1/2024.
//

import Foundation
import SwiftUI

struct RemotePosterViewDelegate: PosterViewDelegate {
    
    private let resourceUrl: URL
    
    init(resourceUrl: URL) {
        self.resourceUrl = resourceUrl
    }
    
    func imageForPoster() async throws -> Image? {
        // In a real world scenario, I'd consider having a image cache system
        // in plce to first look up the image locally, if not found (or if the
        // cache had expired the image), I'd touch the remote end to download
        // and put the image in the cache
        let data = try await URLSession.shared.data(from: resourceUrl).0
        return Image(data: data)
    }
}
