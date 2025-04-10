//
//  CustomIdent Tests.swift
//  
//
//  Created on 04/02/2025.
//

import CSSTypeTypes
import Testing

@Suite("CustomIdent Tests")
struct CustomIdentTests {
    
    @Test("CustomIdent values render correctly")
    func testCustomIdentValues() {
        let ident1 = CustomIdent("slideIn")
        #expect(ident1.description == "slideIn")
        
        let ident2 = CustomIdent("my-custom-value")
        #expect(ident2.description == "my-custom-value")
        
        let ident3 = CustomIdent("_internal")
        #expect(ident3.description == "_internal")
    }
    
    @Test("CustomIdent.custom static method works correctly")
    func testCustomStaticMethod() {
        let ident = CustomIdent.custom("fadeOut")
        #expect(ident.description == "fadeOut")
        
        // Test with a value that might need escaping
        let identWithSpace = CustomIdent.custom("slide in")
        #expect(identWithSpace.description == "slide in") // Note: the real implementation would escape this
    }
    
    @Test("CustomIdent conforms to ExpressibleByStringLiteral")
    func testExpressibleByStringLiteral() {
        let ident: CustomIdent = "bounce"
        #expect(ident.description == "bounce")
        
        // Multi-word identifiers
        let multiWord: CustomIdent = "fancy-animation"
        #expect(multiWord.description == "fancy-animation")
    }
    
    @Test("CustomIdent conforms to Equatable")
    func testEquatable() {
        let ident1a = CustomIdent("test")
        let ident1b = CustomIdent("test")
        let ident2 = CustomIdent("other")
        
        #expect(ident1a == ident1b)
        #expect(ident1a != ident2)
        
        // Case sensitivity
        let identUpper = CustomIdent("Test")
        #expect(ident1a != identUpper)
    }
    
    @Test("CustomIdent is used in CSS property context")
    func testUseInCSSContext() {
        // Create sample CSS property strings using CustomIdent
        let animationName = "animation-name: \(CustomIdent("slideIn"))"
        #expect(animationName == "animation-name: slideIn")
        
        let counterReset = "counter-reset: \(CustomIdent("section"))"
        #expect(counterReset == "counter-reset: section")
    }
}
