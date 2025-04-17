//
//  Ident Tests.swift
//  
//
//  Created on 04/02/2025.
//

import CSSTypeTypes
import Testing

@Suite("Ident Tests")
struct IdentTests {
    
    @Test("Ident initializer creates proper instances")
    func testInitializer() {
        let simpleIdent = Ident("header")
        #expect(simpleIdent.value == "header")
        #expect(simpleIdent.description == "header")
        
        let complexIdent = Ident("nav-menu-item")
        #expect(complexIdent.value == "nav-menu-item")
        #expect(complexIdent.description == "nav-menu-item")
    }
    
    @Test("Ident supports string literal initialization")
    func testStringLiteralInitialization() {
        let stringLiteral: Ident = "footer"
        #expect(stringLiteral.value == "footer")
        #expect(stringLiteral.description == "footer")
    }
    
    @Test("Ident validates identifiers correctly")
    func testValidation() {
        // Valid identifiers
        #expect(Ident("valid").isValid)
        #expect(Ident("valid-ident").isValid)
        #expect(Ident("_private").isValid)
        #expect(Ident("-webkit-feature").isValid)
        #expect(Ident("valid123").isValid)
        
        // Invalid identifiers
        #expect(!Ident("123invalid").isValid) // Starts with a digit
        #expect(!Ident("-123invalid").isValid) // Starts with hyphen followed by digit
        #expect(!Ident("").isValid) // Empty string
        
        // Unicode identifiers should be valid
        #expect(Ident("ñavigation").isValid)
        #expect(Ident("東京").isValid)
    }
    
    @Test("Ident escapes special characters correctly")
    func testEscaping() {
        // Basic identifier doesn't need escaping
        #expect(Ident("basic").escaped() == "basic")
        
        // Identifier starting with a digit needs escaping
        #expect(Ident("1section").escaped() == "\\31 section")
        
        // Special characters need escaping
        #expect(Ident("my:section").escaped() != "my:section")
        
        // Space should be escaped
        let identWithSpace = Ident("my section")
        let escaped = identWithSpace.escaped()
        #expect(escaped != "my section")
        #expect(escaped.contains("\\"))
    }
    
    @Test("Ident conforms to Hashable")
    func testHashable() {
        // Same values should be equal
        let ident1 = Ident("same")
        let ident2 = Ident("same")
        #expect(ident1 == ident2)
        
        // Different values should not be equal
        let ident3 = Ident("different")
        #expect(ident1 != ident3)
    }
    
    @Test("Ident is used correctly in CSS properties context")
    func testUsageInContext() {
        // Identifier in property
        let animationName = "animation-name: \(Ident("fadeIn"))"
        #expect(animationName == "animation-name: fadeIn")
        
        // Identifier in property with hyphen
        let transitionName = "transition-property: \(Ident("background-color"))"
        #expect(transitionName == "transition-property: background-color")
        
        // Multiple identifiers
        let transformOrigin = "transform-origin: \(Ident("top")) \(Ident("center"))"
        #expect(transformOrigin == "transform-origin: top center")
    }
}
