//
//  AlignSelf Tests.swift
//
//
//  Created on 03/30/2025.
//

import CSSPropertyTypes
import CSSTypeTypes
import Testing

@Suite("AlignSelf Tests")
struct AlignSelfTests {

    @Test("AlignSelf renders its Declaration correctly")
    func testDeclaration() {
        #expect(AlignSelf.auto.declaration.description == "align-self:auto")
    }

    @Test("AlignSelf renders auto value correctly")
    func testAutoValue() {
        #expect(AlignSelf.auto.description == "auto")
    }

    @Test("AlignSelf renders normal and stretch values correctly")
    func testBasicValues() {
        #expect(AlignSelf.normal.description == "normal")
        #expect(AlignSelf.stretch.description == "stretch")
    }

    @Test("AlignSelf renders baseline positions correctly")
    func testBaselinePositions() {
        #expect(AlignSelf.baseline.description == "baseline")
        #expect(AlignSelf.firstBaseline.description == "first baseline")
        #expect(AlignSelf.lastBaseline.description == "last baseline")
    }

    @Test("AlignSelf renders self position values correctly")
    func testSelfPositions() {
        #expect(AlignSelf.center.description == "center")
        #expect(AlignSelf.start.description == "start")
        #expect(AlignSelf.end.description == "end")
        #expect(AlignSelf.selfStart.description == "self-start")
        #expect(AlignSelf.selfEnd.description == "self-end")
        #expect(AlignSelf.flexStart.description == "flex-start")
        #expect(AlignSelf.flexEnd.description == "flex-end")
    }

    @Test("AlignSelf renders overflow position with self position correctly")
    func testOverflowSelfPosition() {
        #expect(AlignSelf.safe(.center).description == "safe center")
        #expect(AlignSelf.unsafe(.start).description == "unsafe start")
        #expect(AlignSelf.safe(.flexEnd).description == "safe flex-end")
        #expect(AlignSelf.unsafe(.selfStart).description == "unsafe self-start")
    }

    @Test("AlignSelf renders anchor-center value correctly")
    func testAnchorCenter() {
        #expect(AlignSelf.anchorCenter.description == "anchor-center")
    }

    @Test("AlignSelf renders global values correctly")
    func testGlobalValues() {
        #expect(AlignSelf.inherit.description == "inherit")
        #expect(AlignSelf.initial.description == "initial")
        #expect(AlignSelf.revert.description == "revert")
        #expect(AlignSelf.revertLayer.description == "revert-layer")
        #expect(AlignSelf.unset.description == "unset")
    }

    @Test("AlignSelf conforms to Property protocol")
    func testPropertyProtocol() {
        #expect(AlignSelf.property == "align-self")
    }
}
