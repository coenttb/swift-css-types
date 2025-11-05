//
//  AnimationRange Tests.swift
//
//
//  Created on 03/30/2025.
//

import CSSPropertyTypes
import CSSTypeTypes
import Testing

@Suite("AnimationRange Tests")
struct AnimationRangeTests {

    @Test("AnimationRange renders its Declaration correctly")
    func testDeclaration() {
        #expect(AnimationRange.normal.declaration.description == "animation-range:normal")
    }

    @Test("AnimationRange renders normal value correctly")
    func testNormalValue() {
        #expect(AnimationRange.normal.description == "normal")
        #expect(AnimationRange.single(.normal).description == "normal")
    }

    @Test("AnimationRange renders named range values correctly")
    func testNamedRangeValues() {
        #expect(AnimationRange.namedRange(.cover).description == "cover")
        #expect(AnimationRange.namedRange(.contain).description == "contain")
        #expect(AnimationRange.namedRange(.entry).description == "entry")
        #expect(AnimationRange.namedRange(.exit).description == "exit")
        #expect(AnimationRange.namedRange(.entryCrossing).description == "entry-crossing")
        #expect(AnimationRange.namedRange(.exitCrossing).description == "exit-crossing")
    }

    @Test("AnimationRange renders percentage values correctly")
    func testPercentageValues() {
        #expect(AnimationRange.percentage(20).description == "20%")
        #expect(AnimationRange.single(.percentage(50)).description == "50%")
    }

    @Test("AnimationRange renders named range with percentage values correctly")
    func testNamedRangeWithPercentage() {
        #expect(AnimationRange.single(.namedRange(.entry, 10)).description == "entry 10%")
        #expect(AnimationRange.single(.namedRange(.contain, 75)).description == "contain 75%")
    }

    @Test("AnimationRange renders start-end range correctly")
    func testStartEndRange() {
        #expect(AnimationRange.startEnd(.normal, .namedRange(.exit)).description == "normal exit")
        #expect(
            AnimationRange.startEnd(.namedRange(.entry), .percentage(50)).description == "entry 50%"
        )
        #expect(
            AnimationRange.startEnd(.namedRange(.entry, 10), .namedRange(.contain, 75)).description
                == "entry 10% contain 75%"
        )
    }

    @Test("AnimationRange renders global values correctly")
    func testGlobalValues() {
        #expect(AnimationRange.inherit.description == "inherit")
        #expect(AnimationRange.initial.description == "initial")
        #expect(AnimationRange.revert.description == "revert")
        #expect(AnimationRange.revertLayer.description == "revert-layer")
        #expect(AnimationRange.unset.description == "unset")
    }

    @Test("AnimationRange conforms to Property protocol")
    func testPropertyProtocol() {
        #expect(AnimationRange.property == "animation-range")
    }
}
