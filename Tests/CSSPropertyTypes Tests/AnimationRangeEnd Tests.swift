//
//  AnimationRangeEnd Tests.swift
//  
//
//  Created on 03/30/2025.
//

import CSSPropertyTypes
import CSSTypeTypes
import Testing

@Suite("AnimationRangeEnd Tests")
struct AnimationRangeEndTests {

    @Test("AnimationRangeEnd renders its Declaration correctly")
    func testDeclaration() {
        #expect(AnimationRangeEnd.normal.declaration.description == "animation-range-end:normal")
    }

    @Test("AnimationRangeEnd renders normal value correctly")
    func testNormalValue() {
        #expect(AnimationRangeEnd.normal.description == "normal")
    }

    @Test("AnimationRangeEnd renders named range values correctly")
    func testNamedRangeValues() {
        #expect(AnimationRangeEnd.namedRange(.cover).description == "cover")
        #expect(AnimationRangeEnd.namedRange(.contain).description == "contain")
        #expect(AnimationRangeEnd.namedRange(.entry).description == "entry")
        #expect(AnimationRangeEnd.namedRange(.exit).description == "exit")
        #expect(AnimationRangeEnd.namedRange(.entryCrossing).description == "entry-crossing")
        #expect(AnimationRangeEnd.namedRange(.exitCrossing).description == "exit-crossing")
    }

    @Test("AnimationRangeEnd renders percentage values correctly")
    func testPercentageValues() {
        #expect(AnimationRangeEnd.percentage(75).description == "75%")
    }

    @Test("AnimationRangeEnd renders named range with percentage values correctly")
    func testNamedRangeWithPercentage() {
        #expect(AnimationRangeEnd.namedRange(.exit, 75).description == "exit 75%")
        #expect(AnimationRangeEnd.namedRange(.contain, 90).description == "contain 90%")
    }

    @Test("AnimationRangeEnd renders global values correctly")
    func testGlobalValues() {
        #expect(AnimationRangeEnd.inherit.description == "inherit")
        #expect(AnimationRangeEnd.initial.description == "initial")
        #expect(AnimationRangeEnd.revert.description == "revert")
        #expect(AnimationRangeEnd.revertLayer.description == "revert-layer")
        #expect(AnimationRangeEnd.unset.description == "unset")
    }

    @Test("AnimationRangeEnd conforms to Property protocol")
    func testPropertyProtocol() {
        #expect(AnimationRangeEnd.property == "animation-range-end")
    }
}
