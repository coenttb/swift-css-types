//
//  AlignItems Tests.swift
//  
//
//  Created on 03/28/2025.
//

import CSSPropertyTypes
import CSSTypeTypes
import Testing

@Suite("AlignItems Tests")
struct AlignItemsTests {

    @Test("AlignItems renders its Declaration correctly")
    func testDeclaration() {
        #expect(AlignItems.normal.declaration.description == "align-items:normal")
    }

    @Test("AlignItems renders normal and stretch values correctly")
    func testBasicValues() {
        #expect(AlignItems.normal.description == "normal")
        #expect(AlignItems.stretch.description == "stretch")
        #expect(AlignItems.anchorCenter.description == "anchor-center")
    }

    @Test("AlignItems renders baseline positions correctly")
    func testBaselinePositions() {
        #expect(AlignItems.baseline.description == "baseline")
        #expect(AlignItems.firstBaseline.description == "first baseline")
        #expect(AlignItems.lastBaseline.description == "last baseline")
        #expect(AlignItems.baseline(.firstBaseline).description == "first baseline")
        #expect(AlignItems.baseline(.lastBaseline).description == "last baseline")
    }

    @Test("AlignItems renders self position values correctly")
    func testSelfPosition() {
        #expect(AlignItems.center.description == "center")
        #expect(AlignItems.start.description == "start")
        #expect(AlignItems.end.description == "end")
        #expect(AlignItems.selfStart.description == "self-start")
        #expect(AlignItems.selfEnd.description == "self-end")
        #expect(AlignItems.flexStart.description == "flex-start")
        #expect(AlignItems.flexEnd.description == "flex-end")
        #expect(AlignItems.center.description == "center")
        #expect(AlignItems.start.description == "start")
    }

    @Test("AlignItems renders overflow position with self position correctly")
    func testOverflowSelfPosition() {
        #expect(AlignItems.safe(.center).description == "safe center")
        #expect(AlignItems.unsafe(.start).description == "unsafe start")
        #expect(AlignItems.safe(.end).description == "safe end")
        #expect(AlignItems.unsafe(.flexStart).description == "unsafe flex-start")
        #expect(AlignItems.safe(.selfStart).description == "safe self-start")
        #expect(AlignItems.unsafe(.selfEnd).description == "unsafe self-end")
        #expect(AlignItems.safe(.flexEnd).description == "safe flex-end")

        // Using the position function with overflow parameter
        #expect(AlignItems.position(.safe, .center).description == "safe center")
        #expect(AlignItems.position(.unsafe, .end).description == "unsafe end")
    }

    @Test("AlignItems renders global values correctly")
    func testGlobalValues() {
        #expect(AlignItems.inherit.description == "inherit")
        #expect(AlignItems.initial.description == "initial")
        #expect(AlignItems.revert.description == "revert")
        #expect(AlignItems.revertLayer.description == "revert-layer")
        #expect(AlignItems.unset.description == "unset")
    }

    @Test("AlignItems conforms to Property protocol")
    func testPropertyProtocol() {
        #expect(AlignItems.property == "align-items")
    }
}
