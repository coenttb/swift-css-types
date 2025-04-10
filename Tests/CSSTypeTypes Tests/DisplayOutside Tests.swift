//
//  DisplayOutside Tests.swift
//  
//
//  Created on 04/02/2025.
//

import CSSTypeTypes
import Testing

@Suite("DisplayOutside Tests")
struct DisplayOutsideTests {
    
    @Test("DisplayOutside enum has correct cases and raw values")
    func testEnumCases() {
        #expect(DisplayOutside.block.rawValue == "block")
        #expect(DisplayOutside.inline.rawValue == "inline")
        #expect(DisplayOutside.runIn.rawValue == "run-in")
    }
    
    @Test("DisplayOutside description returns raw value")
    func testDescription() {
        #expect(DisplayOutside.block.description == "block")
        #expect(DisplayOutside.inline.description == "inline")
        #expect(DisplayOutside.runIn.description == "run-in")
    }
    
    @Test("DisplayOutside conforms to Equatable")
    func testEquatable() {
        // Same cases should be equal
        let display1 = DisplayOutside.block
        let display2 = DisplayOutside.block
        #expect(display1 == display2)
        
        // Different cases should not be equal
        let display3 = DisplayOutside.inline
        #expect(display1 != display3)
    }
    
    @Test("DisplayOutside can be created from raw values")
    func testRawValueInitialization() {
        #expect(DisplayOutside(rawValue: "block") == DisplayOutside.block)
        #expect(DisplayOutside(rawValue: "inline") == DisplayOutside.inline)
        #expect(DisplayOutside(rawValue: "run-in") == DisplayOutside.runIn)
        #expect(DisplayOutside(rawValue: "invalid") == nil)
    }
    
    @Test("DisplayOutside is used correctly in CSS display property")
    func testUsageInContext() {
        // Used in display property
        let displayBlock = "display: \(DisplayOutside.block)"
        #expect(displayBlock == "display: block")
        
        let displayInline = "display: \(DisplayOutside.inline)"
        #expect(displayInline == "display: inline")
        
        let displayRunIn = "display: \(DisplayOutside.runIn)"
        #expect(displayRunIn == "display: run-in")
    }
    
    @Test("DisplayOutside cases match CSS specification")
    func testCSSSpecification() {
        // Test that we have all the spec-defined values for display-outside
        #expect(DisplayOutside.block.description == "block") // Block-level element
        #expect(DisplayOutside.inline.description == "inline") // Inline element
        #expect(DisplayOutside.runIn.description == "run-in") // Run-in element
    }
    
    @Test("DisplayOutside can be combined with DisplayInside")
    func testCombinationWithDisplayInside() {
        // Block + flow example
        let blockFlow = "\(DisplayOutside.block) \(DisplayInside.flow)"
        #expect(blockFlow == "block flow")
        
        // Block + flex example
        let blockFlex = "\(DisplayOutside.block) \(DisplayInside.flex)"
        #expect(blockFlex == "block flex")
        
        // Inline + grid example
        let inlineGrid = "\(DisplayOutside.inline) \(DisplayInside.grid)"
        #expect(inlineGrid == "inline grid")
    }
}
