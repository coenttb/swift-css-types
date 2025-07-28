//
//  AlignContent Tests.swift
//  
//
//  Created on 03/28/2025.
//

import CSSPropertyTypes
import CSSTypeTypes
import Testing

@Suite("AlignContent Tests")
struct AlignContentTests {

    @Test("AlignContent renders its Declaration correctly")
    func testDeclaration() {
        #expect(AlignContent.normal.declaration.description == "align-content:normal")
    }

    @Test("AlignContent renders normal value correctly")
    func testNormalValue() {
        #expect(AlignContent.normal.description == "normal")
    }

    @Test("AlignContent renders baseline positions correctly")
    func testBaselinePositions() {
        #expect(AlignContent.baseline.description == "baseline")
        #expect(AlignContent.firstBaseline.description == "first baseline")
        #expect(AlignContent.lastBaseline.description == "last baseline")
    }

    @Test("AlignContent renders content distribution values correctly")
    func testContentDistribution() {
        #expect(AlignContent.spaceBetween.description == "space-between")
        #expect(AlignContent.spaceAround.description == "space-around")
        #expect(AlignContent.spaceEvenly.description == "space-evenly")
        #expect(AlignContent.stretch.description == "stretch")
    }

    @Test("AlignContent renders content position values correctly")
    func testContentPosition() {
        #expect(AlignContent.start.description == "start")
        #expect(AlignContent.center.description == "center")
        #expect(AlignContent.end.description == "end")
        #expect(AlignContent.flexStart.description == "flex-start")
        #expect(AlignContent.flexEnd.description == "flex-end")
    }

    @Test("AlignContent renders overflow position with content position correctly")
    func testOverflowContentPosition() {
        #expect(AlignContent.safe(.center).description == "safe center")
        #expect(AlignContent.unsafe(.start).description == "unsafe start")
        #expect(AlignContent.safe(.end).description == "safe end")
        #expect(AlignContent.unsafe(.flexStart).description == "unsafe flex-start")
    }

    @Test("AlignContent renders global values correctly")
    func testGlobalValues() {
        #expect(AlignContent.inherit.description == "inherit")
        #expect(AlignContent.initial.description == "initial")
        #expect(AlignContent.revert.description == "revert")
        #expect(AlignContent.revertLayer.description == "revert-layer")
        #expect(AlignContent.unset.description == "unset")
    }

    @Test("AlignContent conforms to Property protocol")
    func testPropertyProtocol() {
        #expect(AlignContent.property == "align-content")
    }
}
