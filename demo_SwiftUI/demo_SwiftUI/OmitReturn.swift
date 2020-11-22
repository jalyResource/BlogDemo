//
//  OmitReturn.swift
//  demo_SwiftUI
//
//  Created by li’Pro on 2020/11/13.
//

import SwiftUI

struct OmitReturn: View {
    var body: some View {
        VStack {
            VStack {
                Text("omit return").foregroundColor(Color.red)
            }
            VStack {
                return Text("not omit return")
            }
        }
    }
}

struct OmitReturn_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OmitReturn()
        }
    }
}
