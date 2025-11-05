//
//  Position Tests.swift
//
//
//  Created on 04/02/2025.
//

import CSSTypeTypes
import Testing

@Suite("Position Tests")
struct PositionTests {

    @Test("Position with single keyword renders correctly")
    func testSingleKeyword() {
        #expect(Position.keyword(.center).description == "center")
        #expect(Position.keyword(.top).description == "top")
        #expect(Position.keyword(.right).description == "right")
        #expect(Position.keyword(.bottom).description == "bottom")
        #expect(Position.keyword(.left).description == "left")
    }

    @Test("Position with single value renders correctly")
    func testSingleValue() {
        #expect(Position.value(.px(50)).description == "50px")
        #expect(Position.value(.percentage(25)).description == "25%")
    }

    @Test("Position with two keywords renders correctly")
    func testTwoKeywords() {
        #expect(Position.keywords(.top, .left).description == "top left")
        #expect(Position.keywords(.bottom, .right).description == "bottom right")
        #expect(Position.keywords(.center, .center).description == "center center")
    }

    @Test("Position with keyword and value renders correctly")
    func testKeywordValue() {
        #expect(Position.keywordValue(.top, .px(20)).description == "top 20px")
        #expect(Position.keywordValue(.left, .percentage(30)).description == "left 30%")
    }

    @Test("Position with value and keyword renders correctly")
    func testValueKeyword() {
        #expect(Position.valueKeyword(.px(20), .top).description == "20px top")
        #expect(Position.valueKeyword(.percentage(30), .left).description == "30% left")
    }

    @Test("Position with two values renders correctly")
    func testTwoValues() {
        #expect(Position.values(.px(10), .px(20)).description == "10px 20px")
        #expect(Position.values(.percentage(25), .percentage(75)).description == "25% 75%")
        #expect(Position.values(.px(10), .percentage(50)).description == "10px 50%")
    }

    @Test("Position with offsets renders correctly")
    func testOffsets() {
        #expect(Position.offsets(.top, .px(10), .left, .px(20)).description == "top 10px left 20px")
        #expect(
            Position.offsets(.bottom, .percentage(25), .right, .percentage(50)).description
                == "bottom 25% right 50%"
        )
    }

    @Test("Position static constants render correctly")
    func testStaticConstants() {
        #expect(Position.center.description == "center")
        #expect(Position.top.description == "top")
        #expect(Position.right.description == "right")
        #expect(Position.bottom.description == "bottom")
        #expect(Position.left.description == "left")
        #expect(Position.topLeft.description == "top left")
        #expect(Position.topRight.description == "top right")
        #expect(Position.bottomLeft.description == "bottom left")
        #expect(Position.bottomRight.description == "bottom right")
    }

    @Test("Position conforms to Hashable")
    func testHashable() {
        #expect(Position.center == Position.keyword(.center))
        #expect(Position.topLeft == Position.keywords(.top, .left))
        #expect(Position.value(.px(50)) == Position.value(.px(50)))
        #expect(Position.value(.px(50)) != Position.value(.px(75)))
        #expect(Position.values(.px(10), .px(20)) == Position.values(.px(10), .px(20)))
        #expect(Position.values(.px(10), .px(20)) != Position.values(.px(10), .px(30)))
    }

    @Test("Position is used correctly in CSS properties context")
    func testUsageInCSSContext() {
        // Create sample CSS property strings using Position values
        let backgroundPosition = "background-position: \(Position.center)"
        #expect(backgroundPosition == "background-position: center")

        let transformOrigin = "transform-origin: \(Position.topLeft)"
        #expect(transformOrigin == "transform-origin: top left")

        let objectPosition = "object-position: \(Position.values(.percentage(25), .px(10)))"
        #expect(objectPosition == "object-position: 25% 10px")
    }
}
