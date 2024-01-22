//
//  ContentView.swift
//  Poster-SwiftUI
//
//  Created by Shane Whitehead on 21/1/2024.
//

import SwiftUI

private struct PosterModel: Identifiable {
    let id: String = UUID().uuidString
    let delegate: any PosterViewDelegate
}

struct ContentView: View {
    private let gridItems = [
        GridItem(.adaptive(minimum: 77 * 2)),
    ]
    
    private let model: [PosterModel] = [
        PosterModel(delegate: LocalPosterViewDelegate(resourceName: Assets.babyYodaPoster)),
        PosterModel(delegate: RemotePosterViewDelegate(resourceUrl: URL(string: "https://media.themoviedb.org/t/p/original/eU1i6eHXlzMOlEq0ku1Rzq7Y4wA.jpg")!)),
        PosterModel(delegate: RemotePosterViewDelegate(resourceUrl: URL(string: "https://image.tmdb.org/t/p/original/sWgBv7LV2PRoQgkxwlibdGXKz1S.jpg")!)),
        PosterModel(delegate: RemotePosterViewDelegate(resourceUrl: URL(string: "https://image.tmdb.org/t/p/original/x4b89IkzxfGnA26coS5nRpkEzPo.jpg")!)),
        PosterModel(delegate: RemotePosterViewDelegate(resourceUrl: URL(string: "https://image.tmdb.org/t/p/original/cEIQ02lTGLCTeLcT21MrzVVtiOa.jpg")!)),
        PosterModel(delegate: RemotePosterViewDelegate(resourceUrl: URL(string: "https://image.tmdb.org/t/p/original/rAwwD29i8hOhvvxiO0wH8pQq4DS.jpg")!)),
        PosterModel(delegate: RemotePosterViewDelegate(resourceUrl: URL(string: "https://image.tmdb.org/t/p/original/tQ07JcQg6dUX3RVFflF0F1saVjB.jpg")!)),
        PosterModel(delegate: RemotePosterViewDelegate(resourceUrl: URL(string: "https://image.tmdb.org/t/p/original/z4BCiJp2INv2i34XatIRuI2NlL5.jpg")!)),
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItems, alignment: .leading, spacing: 8) {
                ForEach(model) {
                    DynamicPosterView(
                        prototypeImage: Image.posterFilled,
                        prototypeText: "Poster here",
                        delegate: $0.delegate
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .shadow(
                        color: .black.opacity(0.25),
                        radius: 8, x: 8, y: 8
                    )
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
