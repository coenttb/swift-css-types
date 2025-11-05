//
//  Number Tests.swift
//
//
//  Created on 04/02/2025.
//

import CSSTypeTypes
import Testing

@Suite("Number Tests")
struct NumberTests {

    @Test("Number with integer value renders correctly")
    func testNumberWithIntegerValue() {
        let number = Number(5)
        #expect(number.description == "5")

        let zero = Number(0)
        #expect(zero.description == "0")

        let negative = Number(-10)
        #expect(negative.description == "-10")
    }

    @Test("Number with decimal value renders correctly")
    func testNumberWithDecimalValue() {
        let number = Number(3.5)
        #expect(number.description == "3.5")

        let smallDecimal = Number(0.25)
        #expect(smallDecimal.description == "0.25")

        let negativeDecimal = Number(-1.75)
        #expect(negativeDecimal.description == "-1.75")

        // Numbers with no fractional part should render as integers
        let wholeNumber = Number(2.0)
        #expect(wholeNumber.description == "2")
    }

    @Test("Number constants work correctly")
    func testNumberConstants() {
        #expect(Number.zero.description == "0")
        #expect(Number.one.description == "1")

        #expect(Number.zero.value == 0)
        #expect(Number.one.value == 1)
    }

    @Test("Number conforms to ExpressibleByIntegerLiteral")
    func testExpressibleByIntegerLiteral() {
        let number: Number = 42
        #expect(number.description == "42")
        #expect(number.value == 42)
    }

    @Test("Number conforms to ExpressibleByFloatLiteral")
    func testExpressibleByFloatLiteral() {
        let number: Number = 3.14
        #expect(number.description == "3.14")
        #expect(number.value == 3.14)
    }

    @Test("Number comparison works correctly")
    func testComparison() {
        #expect(Number(5) < Number(10))
        #expect(Number(10) > Number(5))
        #expect(!(Number(5) < Number(5)))
        #expect(Number(3.5) < Number(4))
    }

    @Test("Number arithmetic operations work correctly")
    func testArithmeticOperations() {
        // Addition
        #expect((Number(5) + Number(10)).description == "15")
        #expect((Number(2.5) + Number(3.5)).description == "6")

        // Subtraction
        #expect((Number(10) - Number(5)).description == "5")
        #expect((Number(5.5) - Number(2.5)).description == "3")

        // Multiplication
        #expect((Number(5) * Number(2)).description == "10")
        #expect((Number(2.5) * Number(2)).description == "5")

        // Division
        #expect((Number(10) / Number(2)).description == "5")
        #expect((Number(5) / Number(2)).description == "2.5")

        // Negation
        #expect((-Number(5)).description == "-5")
        #expect((-Number(-3)).description == "3")
    }

    @Test("Number manipulation methods work correctly")
    func testManipulationMethods() {
        // Absolute value
        #expect(Number(5).absolute.description == "5")
        #expect(Number(-5).absolute.description == "5")

        // Rounding
        #expect(Number(3.2).rounded.description == "3")
        #expect(Number(3.8).rounded.description == "4")
        #expect(Number(-2.7).rounded.description == "-3")

        // Floor
        #expect(Number(3.2).floor.description == "3")
        #expect(Number(3.8).floor.description == "3")
        #expect(Number(-2.2).floor.description == "-3")

        // Ceiling
        #expect(Number(3.2).ceil.description == "4")
        #expect(Number(3.8).ceil.description == "4")
        #expect(Number(-2.7).ceil.description == "-2")
    }

    @Test("Number is used correctly in CSS properties context")
    func testUsageInCSSContext() {
        // Create sample CSS property strings using Number values
        let opacity = "opacity: \(Number(0.5))"
        #expect(opacity == "opacity: 0.5")

        let lineHeight = "line-height: \(Number(1.2))"
        #expect(lineHeight == "line-height: 1.2")

        let iterations = "animation-iteration-count: \(Number(3))"
        #expect(iterations == "animation-iteration-count: 3")
    }
}
