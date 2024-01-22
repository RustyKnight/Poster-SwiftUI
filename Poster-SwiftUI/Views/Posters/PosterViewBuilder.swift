//
//  PosterViewBuilder.swift
//  Poster-SwiftUI
//
//  Created by Shane Whitehead on 21/1/2024.
//

import Foundation
import SwiftUI

public struct PosterViewBuilder {
    public static let width: CGFloat = 77 * 2
    public static var height: CGFloat {
        return width / 0.666666666666667
    }
    
    static func buildView(_ posterImage: Image?, prototypeImage: Image, prototypeText: String? = nil) -> some View {
        return HStack(alignment: .center) {
            if let posterImage {
                ZStack {
                    posterImage
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipped()
                        .frame(width: width)
                }
            } else {
                ZStack {
                    Rectangle()
                        .foregroundColor(Color.secondary)
                        .background(Color.secondary, in: Rectangle())
                    //Image(systemName: "tv")
                    prototypeImage
                        .resizable()
                        .frame(width: width / 4, height: width / 4)
                        .foregroundColor(.primary)
                        .opacity(0.5)
                }
                .overlay(alignment: .bottom) {
                    if let prototypeText {
                        VStack(alignment: .center) {
                            Text(prototypeText)
                                .foregroundStyle(Color.primary)
                                .padding()
                        }
                    } else {
                        EmptyView()
                    }
                }
                .frame(width: width, height: height, alignment: .center)
                .fixedSize()
            }
        }
    }
}
