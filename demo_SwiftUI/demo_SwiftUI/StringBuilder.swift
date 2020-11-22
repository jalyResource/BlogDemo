//
//  StringBuilder.swift
//  demo_SwiftUI
//
//  Created by li’Pro on 2020/11/13.
//

import SwiftUI

struct StringBuilderView: View {
    var body: some View {
        VStack {
            Text("{")
            Text("    \"1\"")
            Text("    \"2\"")
            Text("    \"3\"")
            Text("    if testCondition {")
            Text("        \"true\"")
            Text("    }")
            Text("}")
            Text("result:")
            Text(testStringBuilder())
        }
    }
}

struct StringBuilderView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

@_functionBuilder
struct StringBuilder {
    static func buildBlock(_ items: String...) -> String {
        var string: String = ""
        items.forEach { string += $0 }
        return string
    }
    static func buildIf(_ items: String?) -> String {
        items ?? ""
    }
    
    static func buildEither(first: String) -> String {
        first
    }
    static func buildEither(second: String) -> String {
        second
    }
}

let testCondition = false
@StringBuilder
func testStringBuilder() -> String {
    "1"
    "2"
    "3"
    if testCondition {
        "true"
    } else {
        "false"
    }
}

// -----------------  AttributedStringBuilder  -------------------

@_functionBuilder
struct AttributedStringBuilder {
    static func buildBlock(_ segments: NSAttributedString...) -> NSAttributedString {
        let string = NSMutableAttributedString()
        segments.forEach { string.append($0) }
        return string
    }
    
    static func buildIf(_ segment: NSAttributedString?) -> NSAttributedString {
        segment ?? NSAttributedString()
    }
    
    static func buildEither(first: NSAttributedString) -> NSAttributedString {
        first
    }

    static func buildEither(second: NSAttributedString) -> NSAttributedString {
        second
    }
}

extension NSAttributedString {
    convenience init(@AttributedStringBuilder _ content: () -> NSAttributedString) {
        self.init(attributedString: content())
    }
}

let useAttIf = false
@AttributedStringBuilder
func testAaddString() -> NSAttributedString {
    NSAttributedString(string: "AA")
    NSAttributedString(string: "BB")
    if useAttIf {
        NSAttributedString(string: " add if")
    } else {
        NSAttributedString(string: " not contain if")
    }
}
