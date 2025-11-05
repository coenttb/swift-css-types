//
//  CalcKeyword Tests.swift
//
//
//  Created on 04/02/2025.
//

import CSSTypeTypes
import Testing

@Suite("CalcKeyword Tests")
struct CalcKeywordTests {

    @Test("CalcKeyword enum cases render correctly")
    func testCalcKeywordRawValues() {
        #expect(CalcKeyword.e.description == "e")
        #expect(CalcKeyword.pi.description == "pi")
        #expect(CalcKeyword.infinity.description == "infinity")
        #expect(CalcKeyword.negativeInfinity.description == "-infinity")
        #expect(CalcKeyword.NaN.description == "NaN")
    }

    @Test("CalcKeyword enum conforms to Hashable")
    func testHashable() {
        let e1 = CalcKeyword.e
        let e2 = CalcKeyword.e
        let pi = CalcKeyword.pi

        #expect(e1 == e2)
        #expect(e1 != pi)
        #expect(CalcKeyword.infinity != CalcKeyword.negativeInfinity)
    }

    @Test("CalcKeyword provides correct string representation")
    func testCustomStringConvertible() {
        let e = CalcKeyword.e
        #expect(e.description == e.rawValue)
        #expect(String(describing: e) == "e")

        let pi = CalcKeyword.pi
        #expect(pi.description == pi.rawValue)
        #expect(String(describing: pi) == "pi")

        let infinity = CalcKeyword.infinity
        #expect(infinity.description == infinity.rawValue)
        #expect(String(describing: infinity) == "infinity")
    }
}
