//
//  LocalPosterViewDelegate.swift
//  Poster-SwiftUI
//
//  Created by Shane Whitehead on 21/1/2024.
//

import Foundation
#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif
import SwiftUI

struct LocalPosterViewDelegate: PosterViewDelegate {
    
    private let resourceName: String
    
    init(resourceName: String) {
        self.resourceName = resourceName
    }
    
    func imageForPoster() async throws -> Image? {
        guard let url = Bundle.main.url(forResource: "BabyYoda", withExtension: ".jpg") else { return nil }
        let data = try Data(contentsOf: url)
        return Image(data: data)
    }
}
