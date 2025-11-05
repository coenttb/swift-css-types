//
//  NumberPercentage Tests.swift
//
//
//  Created on 04/02/2025.
//

import CSSTypeTypes
import Testing

@Suite("NumberPercentage Tests")
struct NumberPercentageTests {

    @Test("NumberPercentage initializes correctly with number case")
    func testNumberInitialization() {
        let num = NumberPercentage.number(Number(10))
        #expect(num.description == "10")

        // Double value
        let numDouble = NumberPercentage.number(Number(2.5))
        #expect(numDouble.description == "2.5")
    }

    @Test("NumberPercentage initializes correctly with percentage case")
    func testPercentageInitialization() {
        let percent = NumberPercentage.percentage(Percentage(50))
        #expect(percent.description == "50%")

        // Decimal percentage
        let decimalPercent = NumberPercentage.percentage(Percentage(33.333))
        #expect(decimalPercent.description == "33.333%")
    }

    @Test("NumberPercentage supports integer literal initialization")
    func testIntegerLiteralInitialization() {
        let intLiteral: NumberPercentage = 42
        if case .number(let num) = intLiteral {
            #expect(num.value == 42)
        } else {
            #expect(false, "Should be a number case")
        }
        #expect(intLiteral.description == "42")
    }

    @Test("NumberPercentage supports float literal initialization")
    func testFloatLiteralInitialization() {
        let floatLiteral: NumberPercentage = 3.14
        if case .number(let num) = floatLiteral {
            #expect(num.value == 3.14)
        } else {
            #expect(false, "Should be a number case")
        }
        #expect(floatLiteral.description == "3.14")
    }

    @Test("NumberPercentage conforms to Hashable")
    func testHashable() {
        // Same number values should be equal
        let num1 = NumberPercentage.number(Number(10))
        let num2 = NumberPercentage.number(Number(10))
        #expect(num1 == num2)

        // Same percentage values should be equal
        let percent1 = NumberPercentage.percentage(Percentage(75))
        let percent2 = NumberPercentage.percentage(Percentage(75))
        #expect(percent1 == percent2)

        // Different cases should not be equal
        #expect(num1 != percent1)

        // Different values should not be equal
        let num3 = NumberPercentage.number(Number(20))
        #expect(num1 != num3)

        let percent3 = NumberPercentage.percentage(Percentage(60))
        #expect(percent1 != percent3)

        // Integer literals should equal their number counterparts
        let literal: NumberPercentage = 10
        #expect(literal == num1)
    }

    @Test("NumberPercentage conforms to NumberConvertible and PercentageConvertible")
    func testConvertibles() {
        // Test NumberConvertible with number case
        let number: NumberPercentage = .number(Number(15))
        #expect(number.description == "15")

        // Test PercentageConvertible with percentage case
        let percentage: NumberPercentage = .percentage(Percentage(80))
        #expect(percentage.description == "80%")
    }

    @Test("NumberPercentage description returns correct string representation")
    func testDescription() {
        // Number case
        let num = NumberPercentage.number(Number(5))
        #expect(num.description == "5")

        // Percentage case
        let percent = NumberPercentage.percentage(Percentage(25))
        #expect(percent.description == "25%")
    }

    @Test("NumberPercentage is used correctly in CSS properties context")
    func testUsageInContext() {
        // Number value in opacity
        let opacity = "opacity: \(NumberPercentage.number(Number(0.5)))"
        #expect(opacity == "opacity: 0.5")

        // Percentage value in width
        let width = "width: \(NumberPercentage.percentage(Percentage(100)))"
        #expect(width == "width: 100%")

        // Number value in z-index
        let zIndex = "z-index: \(NumberPercentage.number(Number(10)))"
        #expect(zIndex == "z-index: 10")

        // Percentage value in transform scale
        let scale = "transform: scale(\(NumberPercentage.percentage(Percentage(120))))"
        #expect(scale == "transform: scale(120%)")
    }
}
