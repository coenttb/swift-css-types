//
//  AnimationComposition Tests.swift
//  
//
//  Created on 03/30/2025.
//

import CSSPropertyTypes
import CSSTypeTypes
import Testing

@Suite("AnimationComposition Tests")
struct AnimationCompositionTests {

    @Test("AnimationComposition renders its Declaration correctly")
    func testDeclaration() {
        #expect(AnimationComposition.replace.declaration.description == "animation-composition:replace")
    }

    @Test("AnimationComposition renders basic values correctly")
    func testBasicValues() {
        #expect(AnimationComposition.replace.description == "replace")
        #expect(AnimationComposition.add.description == "add")
        #expect(AnimationComposition.accumulate.description == "accumulate")
    }

    @Test("AnimationComposition renders global values correctly")
    func testGlobalValues() {
        #expect(AnimationComposition.inherit.description == "inherit")
        #expect(AnimationComposition.initial.description == "initial")
        #expect(AnimationComposition.revert.description == "revert")
        #expect(AnimationComposition.revertLayer.description == "revert-layer")
        #expect(AnimationComposition.unset.description == "unset")
    }

    @Test("AnimationComposition conforms to Property protocol")
    func testPropertyProtocol() {
        #expect(AnimationComposition.property == "animation-composition")
    }

    @Test("AnimationComposition conforms to CaseIterable")
    func testCaseIterable() {
        let allCases = AnimationComposition.allCases
        #expect(allCases.contains(AnimationComposition.replace))
        #expect(allCases.contains(AnimationComposition.add))
        #expect(allCases.contains(AnimationComposition.accumulate))
        #expect(allCases.contains(AnimationComposition.inherit))
    }
}
