//
//  Global Tests.swift
//  
//
//  Created on 04/02/2025.
//

import CSSTypeTypes
import Testing

@Suite("Global Tests")
struct GlobalTests {
    
    @Test("Global enum cases render correctly")
    func testGlobalValues() {
        #expect(Global.inherit.description == "inherit")
        #expect(Global.initial.description == "initial")
        #expect(Global.revert.description == "revert")
        #expect(Global.revertLayer.description == "revert-layer")
        #expect(Global.unset.description == "unset")
    }
    
    @Test("Global enum conforms to Hashable")
    func testHashable() {
        let inherit1 = Global.inherit
        let inherit2 = Global.inherit
        let initial = Global.initial
        
        #expect(inherit1 == inherit2)
        #expect(inherit1 != initial)
    }
    
    @Test("Global enum conforms to CaseIterable")
    func testCaseIterable() {
        // Check we can iterate through all cases
        let allGlobals = Global.allCases
        
        // Verify the count is correct
        #expect(allGlobals.count == 5)
        
        // Verify specific values are included
        #expect(allGlobals.contains(.inherit))
        #expect(allGlobals.contains(.initial))
        #expect(allGlobals.contains(.revert))
        #expect(allGlobals.contains(.revertLayer))
        #expect(allGlobals.contains(.unset))
    }
    
    @Test("Global uses rawValue for description")
    func testRawValueDescription() {
        for global in Global.allCases {
            #expect(global.description == global.rawValue)
        }
    }
    
    @Test("Global is used correctly in CSS properties context")
    func testUsageInCSSContext() {
        // Create sample CSS property strings using Global values
        let colorProperty = "color: \(Global.inherit)"
        #expect(colorProperty == "color: inherit")
        
        let marginProperty = "margin: \(Global.initial)"
        #expect(marginProperty == "margin: initial")
        
        let paddingProperty = "padding: \(Global.unset)"
        #expect(paddingProperty == "padding: unset")
    }
}
