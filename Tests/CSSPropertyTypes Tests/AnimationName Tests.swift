//
//  AnimationName Tests.swift
//  
//
//  Created on 03/30/2025.
//

import CSSPropertyTypes
import Testing
import CSSTypeTypes

@Suite("AnimationName Tests")
struct AnimationNameTests {
    
    @Test("AnimationName renders its Declaration correctly")
    func testDeclaration() {
        #expect(AnimationName.none.declaration.description == "animation-name:none")
    }
    
    @Test("AnimationName renders none value correctly")
    func testNoneValue() {
        #expect(AnimationName.none.description == "none")
    }
    
    @Test("AnimationName renders keyframe names correctly")
    func testKeyframeNames() {
        #expect(AnimationName.keyframes(.init("slide-in")).description == "slide-in")
        #expect(AnimationName.keyframes(.init("bounce")).description == "bounce")
        #expect(AnimationName.keyframes(.init("fade-out")).description == "fade-out")
    }
    
    @Test("AnimationName works with string literals")
    func testStringLiterals() {
        // Regular identifiers
        let name1: AnimationName = "slide-in"
        let name2: AnimationName = "bounce"
        let name3: AnimationName = "none"
        
        #expect(name1.description == "slide-in")
        #expect(name2.description == "bounce")
        #expect(name3.description == "none")
    }
    
    @Test("AnimationName handles quoted strings correctly")
    func testQuotedStrings() {
        // Using double quotes
        let doubleQuotedName1: AnimationName = "\"my animation\""
        let doubleQuotedName2: AnimationName = "\"special-name\""
        
        #expect(doubleQuotedName1.description == "\"my animation\"")
        #expect(doubleQuotedName2.description == "\"special-name\"")
        
        // Using single quotes
        let singleQuotedName1: AnimationName = "'my animation'"
        let singleQuotedName2: AnimationName = "'special-name'"
        
        #expect(singleQuotedName1.description == "'my animation'")
        #expect(singleQuotedName2.description == "'special-name'")
    }
    
    @Test("AnimationName renders global values correctly")
    func testGlobalValues() {
        #expect(AnimationName.inherit.description == "inherit")
        #expect(AnimationName.initial.description == "initial")
        #expect(AnimationName.revert.description == "revert")
        #expect(AnimationName.revertLayer.description == "revert-layer")
        #expect(AnimationName.unset.description == "unset")
    }
    
    @Test("AnimationName conforms to Property protocol")
    func testPropertyProtocol() {
        #expect(AnimationName.property == "animation-name")
    }
}
