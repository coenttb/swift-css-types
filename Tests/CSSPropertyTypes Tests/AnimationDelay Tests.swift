//
//  AnimationDelay Tests.swift
//
//
//  Created on 03/30/2025.
//

import CSSPropertyTypes
import CSSTypeTypes
import Testing

@Suite("AnimationDelay Tests")
struct AnimationDelayTests {

    @Test("AnimationDelay renders its Declaration correctly")
    func testDeclaration() {
        #expect(AnimationDelay.s(2).declaration.description == "animation-delay:2s")
    }

    @Test("AnimationDelay renders time values correctly")
    func testTimeValues() {
        #expect(AnimationDelay.s(2).description == "2s")
        #expect(AnimationDelay.ms(500).description == "500ms")
        #expect(AnimationDelay.s(-1).description == "-1s")
        #expect(AnimationDelay.zero.description == "0s")
    }

    @Test("AnimationDelay renders Time objects correctly")
    func testTimeObjects() {
        #expect(AnimationDelay.time(Time.s(3.5)).description == "3.5s")
        #expect(AnimationDelay.time(Time.ms(250)).description == "250ms")
    }

    @Test("AnimationDelay renders global values correctly")
    func testGlobalValues() {
        #expect(AnimationDelay.inherit.description == "inherit")
        #expect(AnimationDelay.initial.description == "initial")
        #expect(AnimationDelay.revert.description == "revert")
        #expect(AnimationDelay.revertLayer.description == "revert-layer")
        #expect(AnimationDelay.unset.description == "unset")
    }

    @Test("AnimationDelay conforms to Property protocol")
    func testPropertyProtocol() {
        #expect(AnimationDelay.property == "animation-delay")
    }
}
