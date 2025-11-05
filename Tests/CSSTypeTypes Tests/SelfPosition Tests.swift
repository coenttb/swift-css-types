//
//  SelfPosition Tests.swift
//
//
//  Created on 03/26/2025.
//

import CSSTypeTypes
import Testing

@Suite("SelfPosition Tests")
struct SelfPositionTests {

    @Test("SelfPosition values render correctly")
    func testSelfPositionValues() {
        #expect(SelfPosition.center.description == "center")
        #expect(SelfPosition.start.description == "start")
        #expect(SelfPosition.end.description == "end")
        #expect(SelfPosition.selfStart.description == "self-start")
        #expect(SelfPosition.selfEnd.description == "self-end")
        #expect(SelfPosition.flexStart.description == "flex-start")
        #expect(SelfPosition.flexEnd.description == "flex-end")
    }

    @Test("SelfPosition conforms to CaseIterable")
    func testCaseIterable() {
        let allCases = SelfPosition.allCases
        #expect(allCases.count == 7)
        #expect(allCases.contains(SelfPosition.center))
        #expect(allCases.contains(SelfPosition.start))
        #expect(allCases.contains(SelfPosition.end))
        #expect(allCases.contains(SelfPosition.selfStart))
        #expect(allCases.contains(SelfPosition.selfEnd))
        #expect(allCases.contains(SelfPosition.flexStart))
        #expect(allCases.contains(SelfPosition.flexEnd))
    }

    @Test("SelfPosition.allPositions contains all values")
    func testAllPositions() {
        let allPositions = SelfPosition.allPositions
        #expect(allPositions.count == 7)
        #expect(allPositions.contains(SelfPosition.center))
        #expect(allPositions.contains(SelfPosition.start))
        #expect(allPositions.contains(SelfPosition.end))
        #expect(allPositions.contains(SelfPosition.selfStart))
        #expect(allPositions.contains(SelfPosition.selfEnd))
        #expect(allPositions.contains(SelfPosition.flexStart))
        #expect(allPositions.contains(SelfPosition.flexEnd))
    }

    @Test("SelfPosition conforms to Hashable")
    func testHashable() {
        let center1 = SelfPosition.center
        let center2 = SelfPosition.center
        let flexStart = SelfPosition.flexStart

        #expect(center1 == center2)
        #expect(center1 != flexStart)
    }

    @Test("Raw values are correct")
    func testRawValues() {
        #expect(SelfPosition.center.rawValue == "center")
        #expect(SelfPosition.start.rawValue == "start")
        #expect(SelfPosition.end.rawValue == "end")
        #expect(SelfPosition.selfStart.rawValue == "self-start")
        #expect(SelfPosition.selfEnd.rawValue == "self-end")
        #expect(SelfPosition.flexStart.rawValue == "flex-start")
        #expect(SelfPosition.flexEnd.rawValue == "flex-end")
    }

    @Test("Initialization from raw value works correctly")
    func testRawValueInitializer() {
        let center = SelfPosition(rawValue: "center")
        #expect(center == SelfPosition.center)

        let selfStart = SelfPosition(rawValue: "self-start")
        #expect(selfStart == SelfPosition.selfStart)

        // Invalid raw value
        let invalid = SelfPosition(rawValue: "invalid")
        #expect(invalid == nil)
    }
}
