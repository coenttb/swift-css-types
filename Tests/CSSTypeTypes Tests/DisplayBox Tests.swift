//
//  DisplayBox Tests.swift
//
//
//  Created on 04/02/2025.
//

import CSSTypeTypes
import Testing

@Suite("DisplayBox Tests")
struct DisplayBoxTests {

    @Test("DisplayBox enum has correct cases and raw values")
    func testEnumCases() {
        #expect(DisplayBox.none.rawValue == "none")
        #expect(DisplayBox.contents.rawValue == "contents")
    }

    @Test("DisplayBox description returns raw value")
    func testDescription() {
        #expect(DisplayBox.none.description == "none")
        #expect(DisplayBox.contents.description == "contents")
    }

    @Test("DisplayBox conforms to Hashable")
    func testHashable() {
        // Same cases should be equal
        let display1 = DisplayBox.none
        let display2 = DisplayBox.none
        #expect(display1 == display2)

        // Different cases should not be equal
        let display3 = DisplayBox.contents
        #expect(display1 != display3)
    }

    @Test("DisplayBox can be created from raw values")
    func testRawValueInitialization() {
        #expect(DisplayBox(rawValue: "none") == DisplayBox.none)
        #expect(DisplayBox(rawValue: "contents") == DisplayBox.contents)
        #expect(DisplayBox(rawValue: "invalid") == nil)
    }

    @Test("DisplayBox is used correctly in CSS display property")
    func testUsageInContext() {
        // Used in display property
        let displayNone = "display: \(DisplayBox.none)"
        #expect(displayNone == "display: none")

        let displayContents = "display: \(DisplayBox.contents)"
        #expect(displayContents == "display: contents")
    }

    @Test("DisplayBox cases match CSS specification")
    func testCSSSpecification() {
        // Test that we have all the spec-defined values for display-box
        #expect(DisplayBox.none.description == "none")  // The element and its descendants generate no boxes
        #expect(DisplayBox.contents.description == "contents")  // The element itself doesn't generate boxes
    }
}
