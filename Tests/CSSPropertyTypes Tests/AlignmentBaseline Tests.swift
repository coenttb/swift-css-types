//
//  AlignmentBaseline Tests.swift
//
//
//  Created on 03/30/2025.
//

import CSSPropertyTypes
import CSSTypeTypes
import Testing

@Suite("AlignmentBaseline Tests")
struct AlignmentBaselineTests {

    @Test("AlignmentBaseline renders its Declaration correctly")
    func testDeclaration() {
        #expect(AlignmentBaseline.baseline.declaration.description == "alignment-baseline:baseline")
    }

    @Test("AlignmentBaseline renders baseline value correctly")
    func testBaselineValue() {
        #expect(AlignmentBaseline.baseline.description == "baseline")
    }

    @Test("AlignmentBaseline renders textTop and textBottom values correctly")
    func testTextEdgeValues() {
        #expect(AlignmentBaseline.textTop.description == "text-top")
        #expect(AlignmentBaseline.textBottom.description == "text-bottom")
    }

    @Test("AlignmentBaseline renders main alignment values correctly")
    func testMainAlignmentValues() {
        #expect(AlignmentBaseline.alphabetic.description == "alphabetic")
        #expect(AlignmentBaseline.central.description == "central")
        #expect(AlignmentBaseline.ideographic.description == "ideographic")
        #expect(AlignmentBaseline.mathematical.description == "mathematical")
        #expect(AlignmentBaseline.middle.description == "middle")
    }

    @Test("AlignmentBaseline renders deprecated values correctly")
    func testDeprecatedValues() {
        #expect(AlignmentBaseline.auto.description == "auto")
        #expect(AlignmentBaseline.beforeEdge.description == "before-edge")
        #expect(AlignmentBaseline.afterEdge.description == "after-edge")
        #expect(AlignmentBaseline.hanging.description == "hanging")
        #expect(AlignmentBaseline.textBeforeEdge.description == "text-before-edge")
        #expect(AlignmentBaseline.textAfterEdge.description == "text-after-edge")
    }

    @Test("AlignmentBaseline renders global values correctly")
    func testGlobalValues() {
        #expect(AlignmentBaseline.inherit.description == "inherit")
        #expect(AlignmentBaseline.initial.description == "initial")
        #expect(AlignmentBaseline.revert.description == "revert")
        #expect(AlignmentBaseline.revertLayer.description == "revert-layer")
        #expect(AlignmentBaseline.unset.description == "unset")
    }

    @Test("AlignmentBaseline conforms to Property protocol")
    func testPropertyProtocol() {
        #expect(AlignmentBaseline.property == "alignment-baseline")
    }
}
