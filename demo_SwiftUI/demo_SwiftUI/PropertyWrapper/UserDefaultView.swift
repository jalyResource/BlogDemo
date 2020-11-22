//
//  UserDefaultView.swift
//  demo_SwiftUI
//
//  Created by li’Pro on 2020/11/13.
//

import SwiftUI

struct UserDefaultView: View {
    var body: some View {
        Text("查看 UserDefaultView.swift 文件")
    }
}

struct UserDefaultView_Previews: PreviewProvider {
    static var previews: some View {
        UserDefaultView()
    }
}

// https://juejin.im/post/6844904018121064456

struct GlobalSetting_0 {
    static var isFirstLanch: Bool {
        get {
            return UserDefaults.standard.object(forKey: "isFirstLanch") as? Bool ?? false
        } set {
            UserDefaults.standard.set(newValue, forKey: "isFirstBoot")
        }
    }
    static var uiFontValue: Float {
        get {
            return UserDefaults.standard.object(forKey: "uiFontValue") as? Float ?? 14
        } set {
            UserDefaults.standard.set(newValue, forKey: "uiFontValue")
        }
    }
}
    
@propertyWrapper
struct UserDefault<T> {
    let key: String
    let defaultValue: T
    
    var wrappedValue: T {
        get {
            UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}

struct GlobalSetting {
    @UserDefault(key: "isFirstLaunch", defaultValue: true)
    static var isFirstLaunch: Bool
    
    @UserDefault(key: "uiFontValue", defaultValue: 12.0)
    static var uiFontValue: Float
}
