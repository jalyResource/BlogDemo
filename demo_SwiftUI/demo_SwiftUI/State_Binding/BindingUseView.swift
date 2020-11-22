//
//  BindingUseView.swift
//  demo_SwiftUI
//
//  Created by li’Pro on 2020/11/13.
//

import SwiftUI

struct BindingUseView: View {
    let episode = Episode(title: "WWDC 2019", showTitle: "Data Flow Throght SwiftUI")

    @State private var isPlaying: Bool = false

    var body: some View {
        VStack {
            Text(episode.title).foregroundColor(isPlaying ? .white: .gray)
            Text(episode.showTitle).font(.caption).foregroundColor(.gray)
            PlayerButton(isPlaying: $isPlaying).padding()
                .padding()
        }
        .background(Color.black)
    }
}

struct PlayerButton : View {
    @Binding var isPlaying: Bool
    var body: some View {
        return Button(action: {
            self.isPlaying.toggle()
        }) {
            Image(systemName: isPlaying ? "pause.circle" : "play.circle")
        }
    }
}

struct BindingUseView_Previews: PreviewProvider {
    static var previews: some View {
        BindingUseView()
    }
}
