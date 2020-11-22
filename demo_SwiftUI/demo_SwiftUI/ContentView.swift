//
//  ContentView.swift
//  demo_SwiftUI
//
//  Created by li’Pro on 2020/11/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink( destination: OmitReturn()) {
                    Text("Omit return")
                }
                NavigationLink( destination: StringBuilderView(), label: {
                    Text("StringBuilder")
                })
                NavigationLink( destination: PlayerView(), label: {
                    Text("@State Demo")
                })
                NavigationLink( destination: BindingUseView(), label: {
                    Text("@Binding Demo")
                })
                NavigationLink( destination: ObservedObjectView(settings: UserSettings()), label: {
                    Text("@ObservedObject Demo")
                })
                NavigationLink( destination: EnvironmentView().environmentObject(UserSettings()), label: {
                    Text("@EnvironmentObject Demo")
                })
                
                NavigationLink( destination: StateObjectView(), label: {
                    Text("@StateObject Demo")
                })
                NavigationLink( destination: NSCopying_View(), label: {
                    Text("@NSCopying 问题")
                })
                NavigationLink( destination: RestrictNumberView(), label: {
                    Text("约束数字范围")
                })
                NavigationLink( destination: VersionedUseView(), label: {
                    Text("记录状态变化")
                })
                
            }.navigationTitle("SwiftUI Demo")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
