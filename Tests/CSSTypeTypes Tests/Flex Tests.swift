//
//  Flex Tests.swift
//  
//
//  Created on 04/02/2025.
//

import CSSTypeTypes
import Testing

@Suite("Flex Tests")
struct FlexTests {

    @Test("Flex values render correctly with Number values")
    func testFlexWithNumber() {
        let flex1 = Flex(Number(1))
        #expect(flex1.description == "1fr")

        let flex2 = Flex(Number(2.5))
        #expect(flex2.description == "2.5fr")

        let flexNegative = Flex(Number(-1))
        #expect(flexNegative.description == "-1fr")
    }

    @Test("Flex initializes correctly with Integer values")
    func testFlexWithInteger() {
        let flex1 = Flex(1)
        #expect(flex1.description == "1fr")

        let flex3 = Flex(3)
        #expect(flex3.description == "3fr")

        let flexZero = Flex(0)
        #expect(flexZero.description == "0fr")
    }

    @Test("Flex conforms to ExpressibleByIntegerLiteral")
    func testExpressibleByIntegerLiteral() {
        let flex: Flex = 2
        #expect(flex.description == "2fr")
    }

    @Test("Flex conforms to ExpressibleByFloatLiteral")
    func testExpressibleByFloatLiteral() {
        let flex: Flex = 1.5
        #expect(flex.description == "1.5fr")
    }

    @Test("Flex conforms to Hashable")
    func testHashable() {
        let flex1a: Flex = 1
        let flex1b: Flex = 1
        let flex2: Flex = 2

        #expect(flex1a == flex1b)
        #expect(flex1a != flex2)

        let flexFloat: Flex = 1.0
        #expect(flex1a == flexFloat) // 1 and 1.0 should be considered equal
    }

    @Test("Flex is used in grid layout context")
    func testFlexInGridContext() {
        // Create a sample grid template string
        let gridTemplate = "grid-template-columns: \(Flex(1)) \(Flex(2)) \(Flex(1))"
        #expect(gridTemplate == "grid-template-columns: 1fr 2fr 1fr")
    }
}
