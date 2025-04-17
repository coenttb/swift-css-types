//
//  NamedColor Tests.swift
//  
//
//  Created on 04/02/2025.
//

import CSSTypeTypes
import Testing

@Suite("NamedColor Tests")
struct NamedColorTests {
    
    @Test("Basic named colors render correctly")
    func testBasicNamedColors() {
        #expect(NamedColor.red.description == "red")
        #expect(NamedColor.blue.description == "blue")
        #expect(NamedColor.green.description == "green")
        #expect(NamedColor.black.description == "black")
        #expect(NamedColor.white.description == "white")
    }
    
    @Test("Extended named colors render correctly")
    func testExtendedNamedColors() {
        #expect(NamedColor.cornflowerblue.description == "cornflowerblue")
        #expect(NamedColor.rebeccapurple.description == "rebeccapurple")
        #expect(NamedColor.hotpink.description == "hotpink")
        #expect(NamedColor.mediumseagreen.description == "mediumseagreen")
    }
    
    @Test("Special color values render correctly")
    func testSpecialColorValues() {
        #expect(NamedColor.transparent.description == "transparent")
        #expect(NamedColor.currentColor.description == "currentColor")
        #expect(NamedColor.current.description == "currentColor")
    }
    
    @Test("NamedColor conforms to CaseIterable")
    func testCaseIterable() {
        // Make sure we can iterate over all colors
        var count = 0
        for _ in NamedColor.allCases {
            count += 1
        }
        
        // Just verify we have a significant number of colors
        #expect(count > 100)
        
        // Verify certain colors are in the collection
        #expect(NamedColor.allCases.contains(.red))
        #expect(NamedColor.allCases.contains(.transparent))
        #expect(NamedColor.allCases.contains(.rebeccapurple))
    }
    
    @Test("NamedColor conforms to Hashable")
    func testHashable() {
        let red1 = NamedColor.red
        let red2 = NamedColor.red
        let blue = NamedColor.blue
        
        #expect(red1 == red2)
        #expect(red1 != blue)
        
        // Aliases work correctly
        #expect(NamedColor.current == NamedColor.currentColor)
    }
    
    @Test("NamedColor uses rawValue for description")
    func testRawValueDescription() {
        for color in NamedColor.allCases {
            #expect(color.description == color.rawValue)
        }
    }
    
    @Test("NamedColor is used correctly in CSS properties context")
    func testUsageInCSSContext() {
        // Create sample CSS property strings using NamedColor values
        let colorProperty = "color: \(NamedColor.blue)"
        #expect(colorProperty == "color: blue")
        
        let backgroundColorProperty = "background-color: \(NamedColor.transparent)"
        #expect(backgroundColorProperty == "background-color: transparent")
    }
}
