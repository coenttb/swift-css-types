//
//  AnimationPlayState Tests.swift
//  
//
//  Created on 03/30/2025.
//

import CSSPropertyTypes
import Testing
import CSSTypeTypes

@Suite("AnimationPlayState Tests")
struct AnimationPlayStateTests {
    
    @Test("AnimationPlayState renders its Declaration correctly")
    func testDeclaration() {
        #expect(AnimationPlayState.running.declaration.description == "animation-play-state:running")
    }
    
    @Test("AnimationPlayState renders basic values correctly")
    func testBasicValues() {
        #expect(AnimationPlayState.running.description == "running")
        #expect(AnimationPlayState.paused.description == "paused")
    }
    
    @Test("AnimationPlayState renders global values correctly")
    func testGlobalValues() {
        #expect(AnimationPlayState.inherit.description == "inherit")
        #expect(AnimationPlayState.initial.description == "initial")
        #expect(AnimationPlayState.revert.description == "revert")
        #expect(AnimationPlayState.revertLayer.description == "revert-layer")
        #expect(AnimationPlayState.unset.description == "unset")
    }
    
    @Test("AnimationPlayState conforms to Property protocol")
    func testPropertyProtocol() {
        #expect(AnimationPlayState.property == "animation-play-state")
    }
    
    @Test("AnimationPlayState conforms to CaseIterable")
    func testCaseIterable() {
        let allCases = AnimationPlayState.allCases
        #expect(allCases.contains(AnimationPlayState.running))
        #expect(allCases.contains(AnimationPlayState.paused))
        #expect(allCases.contains(AnimationPlayState.inherit))
    }
}
