//
//  RelativeSize Tests.swift
//  
//
//  Created on 03/26/2025.
//

import CSSTypeTypes
import Testing

@Suite("RelativeSize Tests")
struct RelativeSizeTests {
    
    @Test("RelativeSize values render correctly")
    func testRelativeSizeValues() {
        let smaller = RelativeSize.smaller
        #expect(smaller.description == "smaller")
        
        let larger = RelativeSize.larger
        #expect(larger.description == "larger")
    }
    
    @Test("RelativeSize conforms to CaseIterable")
    func testCaseIterable() {
        let allCases = RelativeSize.allCases
        #expect(allCases.count == 2)
        #expect(allCases.contains(RelativeSize.smaller))
        #expect(allCases.contains(RelativeSize.larger))
    }
    
    @Test("RelativeSize conforms to Hashable")
    func testHashable() {
        let smaller1 = RelativeSize.smaller
        let smaller2 = RelativeSize.smaller
        let larger = RelativeSize.larger
        
        #expect(smaller1 == smaller2)
        #expect(smaller1 != larger)
    }
    
    @Test("Raw values are correct")
    func testRawValues() {
        #expect(RelativeSize.smaller.rawValue == "smaller")
        #expect(RelativeSize.larger.rawValue == "larger")
    }
    
    @Test("Initiative from raw value works correctly")
    func testRawValueInitializer() {
        let smallerFromRaw = RelativeSize(rawValue: "smaller")
        #expect(smallerFromRaw == RelativeSize.smaller)
        
        let largerFromRaw = RelativeSize(rawValue: "larger")
        #expect(largerFromRaw == RelativeSize.larger)
        
        // Invalid raw value
        let invalidFromRaw = RelativeSize(rawValue: "invalid")
        #expect(invalidFromRaw == nil)
    }
}
