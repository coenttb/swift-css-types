//
//  AnimationDuration Tests.swift
//  
//
//  Created on 03/30/2025.
//

import CSSPropertyTypes
import Testing
import CSSTypeTypes

@Suite("AnimationDuration Tests")
struct AnimationDurationTests {
    
    @Test("AnimationDuration renders its Declaration correctly")
    func testDeclaration() {
        #expect(AnimationDuration.auto.declaration.description == "animation-duration:auto")
    }
    
    @Test("AnimationDuration renders auto value correctly")
    func testAutoValue() {
        #expect(AnimationDuration.auto.description == "auto")
    }
    
    @Test("AnimationDuration renders time values correctly")
    func testTimeValues() {
        #expect(AnimationDuration.s(3).description == "3s")
        #expect(AnimationDuration.ms(750).description == "750ms")
        #expect(AnimationDuration.zero.description == "0s")
    }
    
    @Test("AnimationDuration enforces non-negative values")
    func testNonNegativeValues() {
        #expect(AnimationDuration.s(-1).description == "0s")
        #expect(AnimationDuration.ms(-500).description == "0ms")
    }
    
    @Test("AnimationDuration renders Time objects correctly")
    func testTimeObjects() {
        #expect(AnimationDuration.time(Time.s(2.5)).description == "2.5s")
        #expect(AnimationDuration.time(Time.ms(250)).description == "250ms")
    }
    
    @Test("AnimationDuration renders global values correctly")
    func testGlobalValues() {
        #expect(AnimationDuration.inherit.description == "inherit")
        #expect(AnimationDuration.initial.description == "initial")
        #expect(AnimationDuration.revert.description == "revert")
        #expect(AnimationDuration.revertLayer.description == "revert-layer")
        #expect(AnimationDuration.unset.description == "unset")
    }
    
    @Test("AnimationDuration conforms to Property protocol")
    func testPropertyProtocol() {
        #expect(AnimationDuration.property == "animation-duration")
    }
}
