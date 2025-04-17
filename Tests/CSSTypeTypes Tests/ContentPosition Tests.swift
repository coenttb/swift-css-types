//
//  ContentPosition Tests.swift
//  
//
//  Created on 04/02/2025.
//

import CSSTypeTypes
import Testing

@Suite("ContentPosition Tests")
struct ContentPositionTests {
    
    @Test("ContentPosition enum cases render correctly")
    func testContentPositionValues() {
        #expect(ContentPosition.center.description == "center")
        #expect(ContentPosition.start.description == "start")
        #expect(ContentPosition.end.description == "end")
        #expect(ContentPosition.flexStart.description == "flex-start")
        #expect(ContentPosition.flexEnd.description == "flex-end")
        #expect(ContentPosition.left.description == "left")
        #expect(ContentPosition.right.description == "right")
    }
    
    @Test("ContentPosition enum conforms to Hashable")
    func testHashable() {
        let center1 = ContentPosition.center
        let center2 = ContentPosition.center
        let start = ContentPosition.start
        
        #expect(center1 == center2)
        #expect(center1 != start)
        #expect(ContentPosition.flexStart != ContentPosition.flexEnd)
        #expect(ContentPosition.left != ContentPosition.right)
    }
    
    @Test("ContentPosition uses rawValue for description")
    func testRawValueDescription() {
        for position in ContentPosition.allCases {
            #expect(position.description == position.rawValue)
        }
    }
    
    @Test("ContentPosition raw values match CSS specifications")
    func testRawValuesMatchSpec() {
        #expect(ContentPosition.center.rawValue == "center")
        #expect(ContentPosition.start.rawValue == "start")
        #expect(ContentPosition.end.rawValue == "end")
        #expect(ContentPosition.flexStart.rawValue == "flex-start")
        #expect(ContentPosition.flexEnd.rawValue == "flex-end")
        #expect(ContentPosition.left.rawValue == "left")
        #expect(ContentPosition.right.rawValue == "right")
    }
    
    @Test("ContentPosition is used correctly in CSS properties context")
    func testUsageInCSSContext() {
        // Create a sample CSS property string using ContentPosition values
        let justifyContent = "justify-content: \(ContentPosition.center)"
        #expect(justifyContent == "justify-content: center")
        
        let alignContent = "align-content: \(ContentPosition.flexStart)"
        #expect(alignContent == "align-content: flex-start")
    }
}
