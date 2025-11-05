//
//  PositionArea Tests.swift
//
//
//  Created on 04/02/2025.
//

import CSSTypeTypes
import Testing

@Suite("PositionArea Tests")
struct PositionAreaTests {

    @Test("PositionArea with single physical value renders correctly")
    func testSinglePhysicalValue() {
        #expect(PositionArea.physical(.center).description == "center")
        #expect(PositionArea.physical(.top).description == "top")
        #expect(PositionArea.physical(.spanAll).description == "span-all")
    }

    @Test("PositionArea with physical pair renders correctly")
    func testPhysicalPair() {
        #expect(PositionArea.physicalPair(.top, .left).description == "top left")
        #expect(PositionArea.physicalPair(.bottom, .right).description == "bottom right")
        #expect(PositionArea.physicalPair(.center, .center).description == "center center")
        #expect(PositionArea.physicalPair(.top, .spanAll).description == "top span-all")
    }

    @Test("PositionArea with single logical value renders correctly")
    func testSingleLogicalValue() {
        #expect(PositionArea.logical(.center).description == "center")
        #expect(PositionArea.logical(.start).description == "start")
        #expect(PositionArea.logical(.blockStart).description == "block-start")
        #expect(PositionArea.logical(.inlineEnd).description == "inline-end")
        #expect(PositionArea.logical(.spanAll).description == "span-all")
    }

    @Test("PositionArea with logical pair renders correctly")
    func testLogicalPair() {
        #expect(PositionArea.logicalPair(.start, .end).description == "start end")
        #expect(
            PositionArea.logicalPair(.blockStart, .inlineStart).description
                == "block-start inline-start"
        )
        #expect(PositionArea.logicalPair(.selfStart, .spanAll).description == "self-start span-all")
    }

    @Test("PositionArea with single coordinate value renders correctly")
    func testSingleCoordinateValue() {
        #expect(PositionArea.coordinate(.center).description == "center")
        #expect(PositionArea.coordinate(.xStart).description == "x-start")
        #expect(PositionArea.coordinate(.yEnd).description == "y-end")
        #expect(PositionArea.coordinate(.spanXStart).description == "span-x-start")
    }

    @Test("PositionArea with coordinate pair renders correctly")
    func testCoordinatePair() {
        #expect(PositionArea.coordinatePair(.xStart, .yStart).description == "x-start y-start")
        #expect(PositionArea.coordinatePair(.xEnd, .yEnd).description == "x-end y-end")
        #expect(
            PositionArea.coordinatePair(.center, .spanYStart).description == "center span-y-start"
        )
    }

    @Test("PositionArea static constants render correctly")
    func testStaticConstants() {
        #expect(PositionArea.topLeft.description == "top left")
        #expect(PositionArea.topRight.description == "top right")
        #expect(PositionArea.bottomLeft.description == "bottom left")
        #expect(PositionArea.bottomRight.description == "bottom right")
        #expect(PositionArea.center.description == "center")
        #expect(PositionArea.top.description == "top span-all")
        #expect(PositionArea.bottom.description == "bottom span-all")
        #expect(PositionArea.left.description == "left span-all")
        #expect(PositionArea.right.description == "right span-all")
        #expect(PositionArea.start.description == "start")
        #expect(PositionArea.end.description == "end")
    }

    @Test("PhysicalValue enum values render correctly")
    func testPhysicalValueEnumValues() {
        #expect(PositionArea.PhysicalValue.top.rawValue == "top")
        #expect(PositionArea.PhysicalValue.center.rawValue == "center")
        #expect(PositionArea.PhysicalValue.bottom.rawValue == "bottom")
        #expect(PositionArea.PhysicalValue.left.rawValue == "left")
        #expect(PositionArea.PhysicalValue.right.rawValue == "right")
        #expect(PositionArea.PhysicalValue.spanLeft.rawValue == "span-left")
        #expect(PositionArea.PhysicalValue.spanRight.rawValue == "span-right")
        #expect(PositionArea.PhysicalValue.spanTop.rawValue == "span-top")
        #expect(PositionArea.PhysicalValue.spanBottom.rawValue == "span-bottom")
        #expect(PositionArea.PhysicalValue.spanAll.rawValue == "span-all")
    }

    @Test("LogicalValue enum values render correctly")
    func testLogicalValueEnumValues() {
        #expect(PositionArea.LogicalValue.start.rawValue == "start")
        #expect(PositionArea.LogicalValue.end.rawValue == "end")
        #expect(PositionArea.LogicalValue.center.rawValue == "center")
        #expect(PositionArea.LogicalValue.selfStart.rawValue == "self-start")
        #expect(PositionArea.LogicalValue.selfEnd.rawValue == "self-end")
        #expect(PositionArea.LogicalValue.blockStart.rawValue == "block-start")
        #expect(PositionArea.LogicalValue.blockEnd.rawValue == "block-end")
        #expect(PositionArea.LogicalValue.inlineStart.rawValue == "inline-start")
        #expect(PositionArea.LogicalValue.inlineEnd.rawValue == "inline-end")
    }

    @Test("CoordinateValue enum values render correctly")
    func testCoordinateValueEnumValues() {
        #expect(PositionArea.CoordinateValue.xStart.rawValue == "x-start")
        #expect(PositionArea.CoordinateValue.xEnd.rawValue == "x-end")
        #expect(PositionArea.CoordinateValue.xSelfStart.rawValue == "x-self-start")
        #expect(PositionArea.CoordinateValue.xSelfEnd.rawValue == "x-self-end")
        #expect(PositionArea.CoordinateValue.yStart.rawValue == "y-start")
        #expect(PositionArea.CoordinateValue.yEnd.rawValue == "y-end")
        #expect(PositionArea.CoordinateValue.ySelfStart.rawValue == "y-self-start")
        #expect(PositionArea.CoordinateValue.ySelfEnd.rawValue == "y-self-end")
        #expect(PositionArea.CoordinateValue.center.rawValue == "center")
    }

    @Test("PositionArea conforms to Hashable")
    func testHashable() {
        #expect(PositionArea.center == PositionArea.physical(.center))
        #expect(PositionArea.topLeft == PositionArea.physicalPair(.top, .left))
        #expect(PositionArea.physical(.top) == PositionArea.physical(.top))
        #expect(PositionArea.physical(.top) != PositionArea.physical(.bottom))
        #expect(PositionArea.physicalPair(.top, .left) == PositionArea.physicalPair(.top, .left))
        #expect(PositionArea.physicalPair(.top, .left) != PositionArea.physicalPair(.top, .right))
    }

    @Test("PositionArea is used correctly in CSS positioning context")
    func testUsageInPositioningContext() {
        // Create sample CSS property strings using PositionArea values
        let positionArea = "position-area: \(PositionArea.center)"
        #expect(positionArea == "position-area: center")

        let positionAreaTopRight = "position-area: \(PositionArea.topRight)"
        #expect(positionAreaTopRight == "position-area: top right")

        let positionAreaLogical = "position-area: \(PositionArea.logical(.blockStart))"
        #expect(positionAreaLogical == "position-area: block-start")
    }
}
