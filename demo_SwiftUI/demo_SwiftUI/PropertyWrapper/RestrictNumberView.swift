//
//  RestrictNumberView.swift
//  demo_SwiftUI
//
//  Created by li’Pro on 2020/11/14.
//

import SwiftUI

struct RestrictNumberView: View {
    var body: some View {
        VStack {
            Text("查看 RestrictNumberView.swift 文件")
            Button("约束数字上限") {
                testColorGrade()
            }.padding()
        }
    }
}

struct RestrictNumberView_Previews: PreviewProvider {
    static var previews: some View {
        RestrictNumberView()
    }
}

@propertyWrapper
struct ColorGrade {
    private var number: Int
    init() { self.number = 0 }
    var wrappedValue: Int {
        get { return number }
        set { number = max(0, min(newValue, 255)) }
    }
}

struct ColorType {
    @ColorGrade var red: Int
    @ColorGrade var green: Int
    @ColorGrade var blue: Int
    
    public func showColorInformation() {
        print("red:\(red) green:\(green) blue:\(blue)")
    }
}

func testColorGrade() -> Void {
    print("------ testColorGrade() ----")
    var c = ColorType()
    c.showColorInformation() // red:0 green:0 blue:0
    c.red = 300
    c.green = -12
    c.blue = 100
    c.showColorInformation() // red:255 green:0 blue:100
}

@propertyWrapper
struct CapWrapper {
    private var maximum: Int
    private var number: Int
    
    init() {
        self.number = 0
        self.maximum = 255
    }
    init(wrappedValue: Int) {
        maximum = 255
        number = min(wrappedValue, maximum)
    }
    init(wrappedValue: Int, maximum: Int) {
        self.maximum = maximum
        number = min(wrappedValue, maximum)
    }
    
    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, maximum) }
    }
}

struct ColorTypeUseCapWrapper {
    @CapWrapper
    var red: Int // use  init()
    
    @CapWrapper var green: Int = 100 // (wrappedValue: 100)
    // 和下面的写法一样
//    @CapWrapper(wrappedValue: 100)
//    var green: Int //
    
    @CapWrapper(wrappedValue: 90, maximum: 255)
    var blue: Int // (wrappedValue: 90, maximum:255)
}
