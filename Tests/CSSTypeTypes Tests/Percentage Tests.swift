//
//  Percentage Tests.swift
//  
//
//  Created on 04/02/2025.
//

import CSSTypeTypes
import Testing

@Suite("Percentage Tests")
struct PercentageTests {

    @Test("Percentage with integer value renders correctly")
    func testPercentageWithIntegerValue() {
        let percentage = Percentage(50)
        #expect(percentage.description == "50%")

        let zero = Percentage(0)
        #expect(zero.description == "0%")

        let negative = Percentage(-10)
        #expect(negative.description == "-10%")
    }

    @Test("Percentage with decimal value renders correctly")
    func testPercentageWithDecimalValue() {
        let percentage = Percentage(33.3)
        #expect(percentage.description == "33.3%")

        let smallDecimal = Percentage(0.5)
        #expect(smallDecimal.description == "0.5%")

        let negativeDecimal = Percentage(-12.5)
        #expect(negativeDecimal.description == "-12.5%")

        // Percentages with no fractional part should render as integers
        let wholePercentage = Percentage(75.0)
        #expect(wholePercentage.description == "75%")
    }

    @Test("Percentage constants work correctly")
    func testPercentageConstants() {
        #expect(Percentage.zero.description == "0%")
        #expect(Percentage.half.description == "50%")
        #expect(Percentage.full.description == "100%")

        #expect(Percentage.zero.value == 0)
        #expect(Percentage.half.value == 50)
        #expect(Percentage.full.value == 100)
    }

    @Test("Percentage conforms to ExpressibleByIntegerLiteral")
    func testExpressibleByIntegerLiteral() {
        let percentage: Percentage = 75
        #expect(percentage.description == "75%")
        #expect(percentage.value == 75)
    }

    @Test("Percentage conforms to ExpressibleByFloatLiteral")
    func testExpressibleByFloatLiteral() {
        let percentage: Percentage = 42.5
        #expect(percentage.description == "42.5%")
        #expect(percentage.value == 42.5)
    }

//    @Test("Percentage dynamic member lookup works correctly")
//    func testDynamicMemberLookup() {
//        let percentage = Percentage(123.45)
//        
//        // Access Double properties through dynamic member lookup
//        #expect(percentage.isFinite == true)
//        #expect(percentage.isZero == false)
//        #expect(percentage.isLess(than: 200))
//    }

    @Test("Percentage comparison works correctly")
    func testComparison() {
        #expect(Percentage(25) < Percentage(50))
        #expect(Percentage(75) > Percentage(50))
        #expect(!(Percentage(50) < Percentage(50)))
        #expect(Percentage(33.3) < Percentage(33.4))
    }

    @Test("Percentage arithmetic operations work correctly")
    func testArithmeticOperations() {
        // Addition
        #expect((Percentage(25) + Percentage(25)).description == "50%")
        #expect((Percentage(33.3) + Percentage(33.3)).description == "66.6%")

        // Subtraction
        #expect((Percentage(75) - Percentage(25)).description == "50%")
        #expect((Percentage(100) - Percentage(33.3)).description == "66.7%")

        // Multiplication
        #expect((Percentage(50) * 2).description == "100%")
        #expect((Percentage(25) * 0.5).description == "12.5%")

        // Division
        #expect((Percentage(100) / 2).description == "50%")
        #expect((Percentage(25) / 5).description == "5%")
    }

    @Test("Percentage fraction method works correctly")
    func testFractionMethod() {
        let percentage = Percentage(100)

        #expect(percentage.fraction(0.5).description == "50%")
        #expect(percentage.fraction(0.25).description == "25%")
        #expect(percentage.fraction(1.5).description == "150%")
    }

    @Test("Int and Double extensions for Percentage creation work correctly")
    func testNumberExtensions() {
        // Int extensions
        #expect(50.percentage.description == "50%")
        #expect(50.percent.description == "50%")

        // Double extensions
        #expect(33.3.percentage.description == "33.3%")
        #expect(33.3.percent.description == "33.3%")
    }

    @Test("Percentage is used correctly in CSS properties context")
    func testUsageInCSSContext() {
        // Create sample CSS property strings using Percentage values
        let width = "width: \(Percentage(50))"
        #expect(width == "width: 50%")

        let margin = "margin-left: \(Percentage(20))"
        #expect(margin == "margin-left: 20%")

        let fontSize = "font-size: \(Percentage(150))"
        #expect(fontSize == "font-size: 150%")
    }
}
