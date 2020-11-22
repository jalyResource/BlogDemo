//
//  NSCopying_View.swift
//  demo_SwiftUI
//
//  Created by li’Pro on 2020/11/13.
//

import SwiftUI

struct NSCopying_View: View {
    var body: some View {
        VStack {
            Text("查看 NSCopying_View.swift 文件")
            Button("测试 @NSCopying 初始化方法问题") {
                testNSCopyingProblem()
            }.padding()
            Button("PropertyWrapper Copying") {
                testCopying()
            }.padding()
        }
    }
}

struct NSCopying_View_Previews: PreviewProvider {
    static var previews: some View {
        NSCopying_View()
    }
}


class Person: NSObject, NSCopying {
    var firstName: String
    var lastName: String
    var job: String?
    
    init( firstName: String, lastName: String, job: String? = nil ) {
        self.firstName = firstName
        self.lastName = lastName
        self.job = job
        
        super.init()
    }
    
    /// Conformance to <NSCopying> protocol
    func copy( with zone: NSZone? = nil ) -> Any {
        let theCopy = Person.init( firstName: firstName, lastName: lastName )
        theCopy.job = job
        
        return theCopy
    }
    
    /// For convenience of debugging
    override var description: String {
        return "\(firstName) \(lastName)" + ( job != nil ? ", \(job!)" : "" )
    }
}

class Department: NSObject {
    // Here, we're expecting that `self.employee` would automatically
    // store the deeply-copied instance of `Person` class
    @NSCopying var employee: Person
    
    init( employee candidate: Person ) {
        // CAUTION! That's the key point:
        // `self.employee` has been marked with `@NSCopying` attribute
        // but what would take place here is only the shallow-copying.
        //
        // In the other words, `self.employee` will share identical underlying
        // object with `candidate`.
        // self.employee = candidate.copy() as! Person
        self.employee = candidate
        super.init()
        
        // Assertion will definitely fail since Swift do not actually
        // copy the value assigned to this property even though
        // `self.employee` has been marked as `@NSCoyping`:
        
        /* assert( self.employee !== employee ) */
    }
    
    override var description: String {
        return "A Department: [ ( \(employee) ) ]"
    }
    
}
// @NSCopying 存在的问题
func testNSCopyingProblem() -> Void {
    let isaacNewton = Person( firstName: "Isaac", lastName: "Newton", job: "Mathematician" )
    let lab = Department.init( employee: isaacNewton )
    
    isaacNewton.job = "Astronomer"

    print( isaacNewton )     // Prints "Isaac Newton, Astronomer"
    print( lab.employee )    // Prints "Isaac Newton, Astronomer"
    // Expected output printed here is "Isaac Newton, Mathematician" instead
}

// --------------- propertyWrapper  Copying ----------------------
@propertyWrapper
struct Copying<Value: NSCopying> {
  private var _value: Value
  
  init(wrappedValue value: Value) {
    // Copy the value on initialization.
    self._value = value.copy() as! Value
  }

  var wrappedValue: Value {
    get { return _value }
    set {
      // Copy the value on reassignment.
      _value = newValue.copy() as! Value
    }
  }
}

class Sector: NSObject {
    @Copying var employee: Person
    init( employee candidate: Person ) {
        self.employee = candidate
        super.init()
        assert( self.employee !== candidate )
    }
    override var description: String {
        return "A Sector: [ ( \(employee) ) ]"
    }
}

func testCopying() -> Void {
    let vinci = Person( firstName: "Da", lastName: "Vinci", job: "Artist" )
    let lab = Sector(employee: vinci)
    
    vinci.job = "engineer"

    print("---------- testCopying ---------- ")
    print( vinci )           // Prints "Da Vinci, engineer"
    print( lab.employee )    // Prints "Da Vinci, Artist"
}


