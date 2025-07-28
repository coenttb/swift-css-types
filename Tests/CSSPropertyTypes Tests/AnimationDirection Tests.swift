//
//  AnimationDirection Tests.swift
//  
//
//  Created on 03/30/2025.
//

import CSSPropertyTypes
import CSSTypeTypes
import Testing

@Suite("AnimationDirection Tests")
struct AnimationDirectionTests {

    @Test("AnimationDirection renders its Declaration correctly")
    func testDeclaration() {
        #expect(AnimationDirection.normal.declaration.description == "animation-direction:normal")
    }

    @Test("AnimationDirection renders basic values correctly")
    func testBasicValues() {
        #expect(AnimationDirection.normal.description == "normal")
        #expect(AnimationDirection.reverse.description == "reverse")
        #expect(AnimationDirection.alternate.description == "alternate")
        #expect(AnimationDirection.alternateReverse.description == "alternate-reverse")
    }

    @Test("AnimationDirection renders global values correctly")
    func testGlobalValues() {
        #expect(AnimationDirection.inherit.description == "inherit")
        #expect(AnimationDirection.initial.description == "initial")
        #expect(AnimationDirection.revert.description == "revert")
        #expect(AnimationDirection.revertLayer.description == "revert-layer")
        #expect(AnimationDirection.unset.description == "unset")
    }

    @Test("AnimationDirection conforms to Property protocol")
    func testPropertyProtocol() {
        #expect(AnimationDirection.property == "animation-direction")
    }

    @Test("AnimationDirection provides allCases")
    func testCaseIterable() {
        let allCases = AnimationDirection.allCases
        #expect(allCases.contains(AnimationDirection.normal))
        #expect(allCases.contains(AnimationDirection.reverse))
        #expect(allCases.contains(AnimationDirection.alternate))
        #expect(allCases.contains(AnimationDirection.alternateReverse))
        #expect(allCases.contains(AnimationDirection.inherit))
    }
}
