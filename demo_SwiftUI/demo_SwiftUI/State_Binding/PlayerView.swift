//
//  PlayerView.swift
//  demo_SwiftUI
//
//  Created by li’Pro on 2020/11/13.
//

import SwiftUI

struct Episode {
    var title: String
    var showTitle: String
}

struct PlayerView : View {
    let episode = Episode(title: "WWDC 2019", showTitle: "Data Flow Throght SwiftUI")

    @State private var isPlaying: Bool = false

    var body: some View {
        VStack {
            Text(episode.title).foregroundColor(isPlaying ? .white: .gray)
            Text(episode.showTitle).font(.caption).foregroundColor(.gray)
            Button(action: {
                // print("Hello WWDC 2019")
                isPlaying.toggle()
            }) {
                Image(systemName: isPlaying ? "pause.circle" : "play.circle")
            }.padding()
        }
        .background(Color.black)
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}
