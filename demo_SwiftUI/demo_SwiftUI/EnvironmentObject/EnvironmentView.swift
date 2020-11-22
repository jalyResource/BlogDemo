//
//  EnvironmentView.swift
//  demo_SwiftUI
//
//  Created by li’Pro on 2020/11/13.
//

import SwiftUI

struct EnvironmentView: View {
    @EnvironmentObject var settings: UserSettings
    var body: some View {
        VStack {
            Text("EnvironmentView:\(settings.score)")
            HStack {
                EnvironmentOneView().padding()
                EnvironmentTwoView().padding()
            }
        }.border(Color.black, width: 1)
    }
}

struct EnvironmentOneView: View {
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
        VStack {
            Text("OneView:\(settings.score)")
        }.border(Color.red, width: 2)
    }
}

struct EnvironmentTwoView: View {
    @EnvironmentObject var settings: UserSettings
    var body: some View {
        VStack {
            Text("TwoView:\(settings.score)")
            Button("changeTopic") {
                self.settings.score += 1
            }
        }.border(Color.blue, width: 2)
    }
}


struct EnvironmentView_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentView().environmentObject(UserSettings())
    }
}
