//
//  AnimationIterationCount Tests.swift
//  
//
//  Created on 03/30/2025.
//

import CSSPropertyTypes
import CSSTypeTypes
import Testing

@Suite("AnimationIterationCount Tests")
struct AnimationIterationCountTests {

    @Test("AnimationIterationCount renders its Declaration correctly")
    func testDeclaration() {
        #expect(AnimationIterationCount.infinite.declaration.description == "animation-iteration-count:infinite")
    }

    @Test("AnimationIterationCount renders infinite value correctly")
    func testInfiniteValue() {
        #expect(AnimationIterationCount.infinite.description == "infinite")
    }

    @Test("AnimationIterationCount renders count values correctly")
    func testCountValues() {
        #expect(AnimationIterationCount.count(3).description == "3")
        #expect(AnimationIterationCount.count(2.5).description == "2.5")
        #expect(AnimationIterationCount.count(1).description == "1")
    }

    @Test("AnimationIterationCount works with integer literals")
    func testIntegerLiterals() {
        let count1: AnimationIterationCount = 3
        let count2: AnimationIterationCount = 1

        #expect(count1.description == "3")
        #expect(count2.description == "1")
    }

    @Test("AnimationIterationCount works with float literals")
    func testFloatLiterals() {
        let count1: AnimationIterationCount = 2.5
        let count2: AnimationIterationCount = 1.75

        #expect(count1.description == "2.5")
        #expect(count2.description == "1.75")
    }

    @Test("AnimationIterationCount handles non-positive values")
    func testNonPositiveValues() {
        let count1: AnimationIterationCount = 0
        let count2: AnimationIterationCount = -2
        let count3: AnimationIterationCount = -0.5

        #expect(count1.description == "1")
        #expect(count2.description == "1")
        #expect(count3.description == "1")
    }

    @Test("AnimationIterationCount renders global values correctly")
    func testGlobalValues() {
        #expect(AnimationIterationCount.inherit.description == "inherit")
        #expect(AnimationIterationCount.initial.description == "initial")
        #expect(AnimationIterationCount.revert.description == "revert")
        #expect(AnimationIterationCount.revertLayer.description == "revert-layer")
        #expect(AnimationIterationCount.unset.description == "unset")
    }

    @Test("AnimationIterationCount conforms to Property protocol")
    func testPropertyProtocol() {
        #expect(AnimationIterationCount.property == "animation-iteration-count")
    }
}
