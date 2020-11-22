//
//  StateObjectView.swift
//  demo_SwiftUI
//
//  Created by li’Pro on 2020/11/13.
//

import SwiftUI

struct StateObjectView: View {
    @State private var showName: Bool = false
    
    var body: some View {
        VStack {
            Button("name:\(showName ? "Jaly" : "Null")") {
                showName.toggle()
            }
            StateSubview().padding()
        }
    }
}

struct StateSubview: View {
    // @ObservedObject var settings: UserSettings = UserSettings()
    @StateObject var settings: UserSettings = UserSettings()
    
    var body: some View {
        VStack {
            Text("Your score is \(settings.score)")
            Button(action: {
                self.settings.score += 1
            }) {
                Text("Increase Score")
            }
        }
    }
}

struct StateObjectView_Previews: PreviewProvider {
    static var previews: some View {
        StateObjectView()
    }
}
