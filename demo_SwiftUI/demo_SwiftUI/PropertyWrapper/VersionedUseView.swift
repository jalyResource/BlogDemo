//
//  VersionedUseView.swift
//  demo_SwiftUI
//
//  Created by li’Pro on 2020/11/14.
//

import SwiftUI

struct VersionedUseView: View {
    var body: some View {
        VStack {
            Text("查看 VersionedUseView.swift  文件")
            Button("testProjecting()") {
                testProjecting()
            }.padding()
        }
    }
}

struct VersionedUseView_Previews: PreviewProvider {
    static var previews: some View {
        VersionedUseView()
    }
}


/// Projecting a Value From a Property Wrapper

@propertyWrapper
struct Versioned<Value> {
    private var value: Value
    private(set) var projectedValue: [(Date, Value)] = []

    var wrappedValue: Value {
        get { value }
        set {
            defer { projectedValue.append((Date(), value)) }
            value = newValue
        }
    }
    
    init(initalizeValue: Value) {
        self.value = initalizeValue
        projectedValue.append((Date(), value))
    }
}

class ExpenseReport {
    enum State { case submitted, received, approved, denied }

    @Versioned(initalizeValue: .submitted) var state: State
    
    func access() {   // 访问 propertyWrapper 的方式
        print(state)  // `wrappedValue`
        print(_state) //  wrapper type itself
        print($state) // `projectedValue`
    }
}

func testProjecting() {
    print("--- testProjecting() ----")
    let report = ExpenseReport()
    print(report.$state) // print : [(... State.submitted)]
    report.state = .received
    report.state = .approved

    print("count: \(report.$state.count)")  // print: count: 3
    print("\(report.$state)")
    // [
    //  (... State.submitted),
    //  (... State.received),
    //  (... State.approved)
    // ]
}
