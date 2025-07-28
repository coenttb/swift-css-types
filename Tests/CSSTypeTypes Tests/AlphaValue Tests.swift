//
//  AlphaValue Tests.swift
//  
//
//  Created on 03/26/2025.
//

import CSSTypeTypes
import Testing

@Suite("AlphaValue Tests")
struct AlphaValueTests {

    @Test("Number alpha values render correctly")
    func testNumberValues() {
        let transparent = AlphaValue.number(0)
        #expect(transparent.description == "0")

        let semiTransparent = AlphaValue.number(0.5)
        #expect(semiTransparent.description == "0.5")

        let opaque = AlphaValue.number(1)
        #expect(opaque.description == "1")

        // Values that would be clamped in rendering still output their actual value
        let overOne = AlphaValue.number(1.5)
        #expect(overOne.description == "1.5")

        let negative = AlphaValue.number(-0.2)
        #expect(negative.description == "-0.2")
    }

    @Test("Percentage alpha values render correctly")
    func testPercentValues() {
        let transparent = AlphaValue.percentage(0)
        #expect(transparent.description == "0%")

        let semiTransparent = AlphaValue.percentage(50)
        #expect(semiTransparent.description == "50%")

        let opaque = AlphaValue.percentage(100)
        #expect(opaque.description == "100%")

        // Percentages can include decimal points
        let decimalPercent = AlphaValue.percentage(33.33)
        #expect(decimalPercent.description == "33.33%")

        // Values that would be clamped in rendering still output their actual value
        let overOneHundred = AlphaValue.percentage(120)
        #expect(overOneHundred.description == "120%")

        let negative = AlphaValue.percentage(-10)
        #expect(negative.description == "-10%")
    }

    @Test("Integer literal conversion works correctly")
    func testIntegerLiteralConversion() {
        let transparent: AlphaValue = 0
        #expect(transparent.description == "0")

        let opaque: AlphaValue = 1
        #expect(opaque.description == "1")

        if case let .number(value) = transparent {
            #expect(value == 0.0)
        } else {
            #expect(false, "Expected .number case")
        }
    }

    @Test("Float literal conversion works correctly")
    func testFloatLiteralConversion() {
        let semiTransparent: AlphaValue = 0.5
        #expect(semiTransparent.description == "0.5")

        let almostOpaque: AlphaValue = 0.95
        #expect(almostOpaque.description == "0.95")

        if case let .number(value) = semiTransparent {
            #expect(value == 0.5)
        } else {
            #expect(false, "Expected .number case")
        }
    }

    @Test("AlphaValue conforms to Hashable")
    func testHashable() {
        let number1 = AlphaValue.number(0.5)
        let number2 = AlphaValue.number(0.5)
        let number3 = AlphaValue.number(0.7)

        #expect(number1 == number2)
        #expect(number1 != number3)

        let percent1 = AlphaValue.percentage(50)
        let percent2 = AlphaValue.percentage(50)
        let percent3 = AlphaValue.percentage(70)

        #expect(percent1 == percent2)
        #expect(percent1 != percent3)

        // Number and percentage with equivalent values are not equal
        #expect(number1 != percent1)
    }
}
