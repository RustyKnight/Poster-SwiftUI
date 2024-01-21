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
        let data = try await URLSession.shared.data(from: resourceUrl).0
        return Image(data: data)
    }
}
