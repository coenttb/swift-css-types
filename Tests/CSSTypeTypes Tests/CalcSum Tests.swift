//
//  CalcSum Tests.swift
//  
//
//  Created on 04/02/2025.
//

import CSSTypeTypes
import Testing

@Suite("CalcSum Tests")
struct CalcSumTests {

    @Test("CalcSum initializer creates proper instances")
    func testInitializer() {
        let calcExpression = CalcSum("100% - 20px")
        #expect(calcExpression.description == "calc(100% - 20px)")

        let complexCalc = CalcSum("3 * (2em + 5px)")
        #expect(complexCalc.description == "calc(3 * (2em + 5px))")
    }

    @Test("Factory method calc() creates proper instances")
    func testCalcFactory() {
        let calc1 = CalcSum.calc("50% + 1rem")
        #expect(calc1.description == "calc(50% + 1rem)")

        let calc2 = CalcSum.calc("(100vw - 2 * 3rem) / 2")
        #expect(calc2.description == "calc((100vw - 2 * 3rem) / 2)")
    }

    @Test("Factory method min() creates proper instances")
    func testMinFactory() {
        let min1 = CalcSum.min("10px, 2em")
        #expect(min1.description == "min(10px, 2em)")

        let min2 = CalcSum.min("50%, 300px, 20em")
        #expect(min2.description == "min(50%, 300px, 20em)")
    }

    @Test("Factory method max() creates proper instances")
    func testMaxFactory() {
        let max1 = CalcSum.max("100px, 50%")
        #expect(max1.description == "max(100px, 50%)")

        let max2 = CalcSum.max("10vw, 50px, 4em")
        #expect(max2.description == "max(10vw, 50px, 4em)")
    }

    @Test("Factory method clamp() creates proper instances")
    func testClampFactory() {
        let clamp1 = CalcSum.clamp(min: "10px", preferred: "5vw", max: "50px")
        #expect(clamp1.description == "clamp(10px, 5vw, 50px)")

        let clamp2 = CalcSum.clamp(min: "1rem", preferred: "5vw", max: "2rem")
        #expect(clamp2.description == "clamp(1rem, 5vw, 2rem)")
    }

    @Test("CalcSum handles nested math functions correctly")
    func testNestedMathFunctions() {
        // calc() inside another calc()
        let nestedCalc = CalcSum("calc(100% - 20px) + 1rem")
        #expect(nestedCalc.description == "calc(calc(100% - 20px) + 1rem)")

        // min() as a complete expression not wrapped in calc()
        let minFunction = CalcSum("min(10px, 2em)")
        #expect(minFunction.description == "min(10px, 2em)")

        // max() as a complete expression not wrapped in calc()
        let maxFunction = CalcSum("max(100px, 50%)")
        #expect(maxFunction.description == "max(100px, 50%)")

        // clamp() as a complete expression not wrapped in calc()
        let clampFunction = CalcSum("clamp(10px, 5vw, 50px)")
        #expect(clampFunction.description == "clamp(10px, 5vw, 50px)")

        // min() nested in an expression
        let nestedMin = CalcSum("min(10%, 20px) + 1rem")
        #expect(nestedMin.description == "calc(min(10%, 20px) + 1rem)")
    }

    @Test("CalcSum conforms to Hashable")
    func testHashable() {
        // Same expressions should be equal
        let calc1 = CalcSum("100% - 20px")
        let calc2 = CalcSum("100% - 20px")
        #expect(calc1 == calc2)

        // Different expressions should not be equal
        let calc3 = CalcSum("50% + 1rem")
        #expect(calc1 != calc3)

        // Functions should be equal when expressions match
        let min1 = CalcSum.min("10px, 2em")
        let min2 = CalcSum.min("10px, 2em")
        #expect(min1 == min2)

        // Different functions should not be equal
        let max = CalcSum.max("10px, 2em")
        #expect(min1 != max)
    }

    @Test("CalcSum works with expressions containing CSS keywords like e and pi")
    func testKeywords() {
        let withE = CalcSum("e * 10px")
        #expect(withE.description == "calc(e * 10px)")

        let withPi = CalcSum("pi * 1rem")
        #expect(withPi.description == "calc(pi * 1rem)")

        let complex = CalcSum("2 * pi * 5rem")
        #expect(complex.description == "calc(2 * pi * 5rem)")
    }

    @Test("CalcSum is used correctly in CSS properties")
    func testUsageInContext() {
        // CalcSum in width context
        let width = "width: \(CalcSum("100% - 20px"))"
        #expect(width == "width: calc(100% - 20px)")

        // CalcSum with min in height context
        let height = "height: \(CalcSum.min("100vh, 500px"))"
        #expect(height == "height: min(100vh, 500px)")

        // CalcSum with max in margin context
        let margin = "margin: \(CalcSum.max("1rem, 10px"))"
        #expect(margin == "margin: max(1rem, 10px)")

        // CalcSum with clamp in font-size context
        let fontSize = "font-size: \(CalcSum.clamp(min: "1rem", preferred: "5vw", max: "2rem"))"
        #expect(fontSize == "font-size: clamp(1rem, 5vw, 2rem)")

        // Nested functions
        let complex = "padding: \(CalcSum("min(10%, 20px) + 1rem"))"
        #expect(complex == "padding: calc(min(10%, 20px) + 1rem)")
    }
}
