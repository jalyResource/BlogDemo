//
//  DelayedImmutable_View.swift
//  demo_SwiftUI
//
//  Created by li’Pro on 2020/11/13.
//

import SwiftUI

struct DelayedImmutable_View: View {
    var body: some View {
        Text("查看 DelayedImmutable_View.swift 文件")
    }
}

struct DelayedImmutable_View_Previews: PreviewProvider {
    static var previews: some View {
        DelayedImmutable_View()
    }
}


@propertyWrapper
struct DelayedImmutable<Value> {
  private var _value: Value? = nil

  var wrappedValue: Value {
    get {
      guard let value = _value else {
        fatalError("property accessed before being initialized")
      }
      return value
    }

    set {
      if _value != nil {
        fatalError("property initialized twice")
      }
      _value = newValue
    }
  }
}
class Fooo {
  @DelayedImmutable var x: Int

  func initializeX(x: Int) {
    self.x = x // Will crash if 'self.x' is already initialized
  }
}
