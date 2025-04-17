//
//  OverflowPosition Tests.swift
//  
//
//  Created on 04/02/2025.
//

import CSSTypeTypes
import Testing

@Suite("OverflowPosition Tests")
struct OverflowPositionTests {
    
    @Test("OverflowPosition enum has correct cases and raw values")
    func testEnumCases() {
        #expect(OverflowPosition.safe.rawValue == "safe")
        #expect(OverflowPosition.unsafe.rawValue == "unsafe")
    }
    
    @Test("OverflowPosition description returns raw value")
    func testDescription() {
        #expect(OverflowPosition.safe.description == "safe")
        #expect(OverflowPosition.unsafe.description == "unsafe")
    }
    
    @Test("OverflowPosition conforms to Hashable")
    func testHashable() {
        // Same cases should be equal
        let pos1 = OverflowPosition.safe
        let pos2 = OverflowPosition.safe
        #expect(pos1 == pos2)
        
        // Different cases should not be equal
        let pos3 = OverflowPosition.unsafe
        #expect(pos1 != pos3)
    }
    
    @Test("OverflowPosition conforms to CaseIterable")
    func testCaseIterable() {
        // All cases should be in allCases
        let allCases = OverflowPosition.allCases
        #expect(allCases.count == 2)
        #expect(allCases.contains(.safe))
        #expect(allCases.contains(.unsafe))
    }
    
    @Test("OverflowPosition can be created from raw values")
    func testRawValueInitialization() {
        #expect(OverflowPosition(rawValue: "safe") == OverflowPosition.safe)
        #expect(OverflowPosition(rawValue: "unsafe") == OverflowPosition.unsafe)
        #expect(OverflowPosition(rawValue: "invalid") == nil)
    }
    
    @Test("OverflowPosition is used correctly in CSS alignment properties")
    func testUsageInContext() {
        // Safe with alignment
        let alignSafeCenter = "align-items: \(OverflowPosition.safe) center"
        #expect(alignSafeCenter == "align-items: safe center")
        
        // Unsafe with alignment
        let justifyUnsafeEnd = "justify-content: \(OverflowPosition.unsafe) flex-end"
        #expect(justifyUnsafeEnd == "justify-content: unsafe flex-end")
        
        // Safe with self-alignment
        let alignSelfSafeStart = "align-self: \(OverflowPosition.safe) start"
        #expect(alignSelfSafeStart == "align-self: safe start")
        
        // Unsafe with self-alignment
        let justifySelfUnsafeStretch = "justify-self: \(OverflowPosition.unsafe) stretch"
        #expect(justifySelfUnsafeStretch == "justify-self: unsafe stretch")
    }
    
    @Test("OverflowPosition cases match CSS specification")
    func testCSSSpecification() {
        // Test that we have all the important spec-defined values
        #expect(OverflowPosition.safe.description == "safe") // Ensures content is visible
        #expect(OverflowPosition.unsafe.description == "unsafe") // Honors alignment even with overflow
    }
}
