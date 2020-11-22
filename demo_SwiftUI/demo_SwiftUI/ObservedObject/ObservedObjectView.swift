//
//  ObservedObjectView.swift
//  demo_SwiftUI
//
//  Created by li’Pro on 2020/11/13.
//

import SwiftUI

/// model
class UserSettings: ObservableObject {
    @Published var score = 0
}
struct ObservedSubview: View {
    @ObservedObject var settings: UserSettings
    
    var body: some View {
        VStack {
            Text("Subview score:\(settings.score)")
            Button(action: {
                self.settings.score += 1
            }) {
                Text("Subview Increase Score")
            }
        }
    }
}

/// View
struct ObservedObjectView: View {
    @ObservedObject var settings: UserSettings
    
    var body: some View {
        VStack {
            Text("Your score is \(settings.score)")
            Button(action: {
                self.settings.score += 1
            }) {
                Text("Increase Score")
            }
            
            ObservedSubview(settings: settings)
                .padding()
        }
    }
}

struct ObservedObjectView_Previews: PreviewProvider {
    static var previews: some View {
        ObservedObjectView(settings: UserSettings())
    }
}
