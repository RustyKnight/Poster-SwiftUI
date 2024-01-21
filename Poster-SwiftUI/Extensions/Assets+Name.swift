//
//  Assets+Name.swift
//  Poster-SwiftUI
//
//  Created by Shane Whitehead on 21/1/2024.
//

import Foundation
#if canImport(AppKit)
import AppKit
#endif

struct Assets {
    #if canImport(UIKit)
    static let babyYodaPoster = "BabyYodaPoster"
    #elseif canImport(AppKit)
    static let babyYodaPoster = NSImage.Name("BabyYodaPoster")
    #endif
}
