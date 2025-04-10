//
//  AnimationFillMode Tests.swift
//  
//
//  Created on 03/30/2025.
//

import CSSPropertyTypes
import Testing
import CSSTypeTypes

@Suite("AnimationFillMode Tests")
struct AnimationFillModeTests {
    
    @Test("AnimationFillMode renders its Declaration correctly")
    func testDeclaration() {
        #expect(AnimationFillMode.none.declaration.description == "animation-fill-mode:none")
    }
    
    @Test("AnimationFillMode renders basic values correctly")
    func testBasicValues() {
        #expect(AnimationFillMode.none.description == "none")
        #expect(AnimationFillMode.forwards.description == "forwards")
        #expect(AnimationFillMode.backwards.description == "backwards")
        #expect(AnimationFillMode.both.description == "both")
    }
    
    @Test("AnimationFillMode renders global values correctly")
    func testGlobalValues() {
        #expect(AnimationFillMode.inherit.description == "inherit")
        #expect(AnimationFillMode.initial.description == "initial")
        #expect(AnimationFillMode.revert.description == "revert")
        #expect(AnimationFillMode.revertLayer.description == "revert-layer")
        #expect(AnimationFillMode.unset.description == "unset")
    }
    
    @Test("AnimationFillMode conforms to Property protocol")
    func testPropertyProtocol() {
        #expect(AnimationFillMode.property == "animation-fill-mode")
    }
    
    @Test("AnimationFillMode conforms to CaseIterable")
    func testCaseIterable() {
        let allCases = AnimationFillMode.allCases
        #expect(allCases.contains(AnimationFillMode.none))
        #expect(allCases.contains(AnimationFillMode.forwards))
        #expect(allCases.contains(AnimationFillMode.backwards))
        #expect(allCases.contains(AnimationFillMode.both))
        #expect(allCases.contains(AnimationFillMode.inherit))
    }
}
