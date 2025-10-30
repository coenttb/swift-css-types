////
////  Double Tests.swift
////
////
////  Created on 04/02/2025.
////
//
// import CSSTypeTypes
// import Testing
//
// @Suite("Double Tests")
// struct DoubleTests {
//
//    @Test("Double.truncatingRemainder() formats whole numbers correctly")
//    func testTruncatingRemainderWithWholeNumbers() {
//        #expect(Double.truncatingRemainder(0.0) == "0")
//        #expect(Double.truncatingRemainder(1.0) == "1")
//        #expect(Double.truncatingRemainder(2.0) == "2")
//        #expect(Double.truncatingRemainder(10.0) == "10")
//        #expect(Double.truncatingRemainder(100.0) == "100")
//        #expect(Double.truncatingRemainder(-5.0) == "-5")
//    }
//
//    @Test("Double.truncatingRemainder() formats decimal numbers correctly")
//    func testTruncatingRemainderWithDecimalNumbers() {
//        #expect(Double.truncatingRemainder(0.5) == "0.5")
//        #expect(Double.truncatingRemainder(1.25) == "1.25")
//        #expect(Double.truncatingRemainder(3.14159) == "3.14159")
//        #expect(Double.truncatingRemainder(-2.75) == "-2.75")
//    }
//
//    @Test("Double.truncatingRemainder() instance method works correctly")
//    func testTruncatingRemainderInstanceMethod() {
//        #expect((0.0).truncatingRemainder() == "0")
//        #expect((1.0).truncatingRemainder() == "1")
//        #expect((0.5).truncatingRemainder() == "0.5")
//        #expect((1.25).truncatingRemainder() == "1.25")
//        #expect((-2.75).truncatingRemainder() == "-2.75")
//    }
//
//    @Test("Double.truncatingRemainder(digits:) formats whole numbers correctly")
//    func testTruncatingRemainderWithDigitsForWholeNumbers() {
//        #expect(Double.truncatingRemainder(5.0, digits: 2) == "5")
//        #expect(Double.truncatingRemainder(10.0, digits: 3) == "10")
//        #expect(Double.truncatingRemainder(100.0, digits: 1) == "100")
//    }
//
//    @Test("Double.truncatingRemainder(digits:) formats decimal numbers with specified precision")
//    func testTruncatingRemainderWithDigitsForDecimalNumbers() {
//        #expect(Double.truncatingRemainder(0.5, digits: 1) == "0.5")
//        #expect(Double.truncatingRemainder(0.567, digits: 2) == "0.57")
//        #expect(Double.truncatingRemainder(3.14159, digits: 3) == "3.142")
//        #expect(Double.truncatingRemainder(3.14159, digits: 2) == "3.14")
//        #expect(Double.truncatingRemainder(3.14159, digits: 1) == "3.1")
//        #expect(Double.truncatingRemainder(-2.75, digits: 1) == "-2.8")
//    }
//
//    @Test("Double.truncatingRemainder(digits:) instance method works correctly")
//    func testTruncatingRemainderWithDigitsInstanceMethod() {
//        #expect((0.5).truncatingRemainder(digits: 1) == "0.5")
//        #expect((0.567).truncatingRemainder(digits: 2) == "0.57")
//        #expect((3.14159).truncatingRemainder(digits: 3) == "3.142")
//        #expect((3.14159).truncatingRemainder(digits: 2) == "3.14")
//        #expect((3.14159).truncatingRemainder(digits: 1) == "3.1")
//        #expect((-2.75).truncatingRemainder(digits: 1) == "-2.8")
//    }
//
//    @Test("Double.truncatingRemainder() is used correctly in CSS context")
//    func testTruncatingRemainderInCSSContext() {
//        // Create sample CSS property strings using truncated double values
//        let opacity = "opacity: \((0.5).truncatingRemainder())"
//        #expect(opacity == "opacity: 0.5")
//
//        let lineHeight = "line-height: \((1.5).truncatingRemainder())"
//        #expect(lineHeight == "line-height: 1.5")
//
//        let scale = "transform: scale(\((2.0).truncatingRemainder()))"
//        #expect(scale == "transform: scale(2)")
//
//        let percentage = "width: \((33.333).truncatingRemainder(digits: 2))%"
//        #expect(percentage == "width: 33.33%")
//    }
// }
