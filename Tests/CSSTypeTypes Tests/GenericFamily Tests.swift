//
//  GenericFamily Tests.swift
//  
//
//  Created on 04/02/2025.
//

import CSSTypeTypes
import Testing

@Suite("GenericFamily Tests")
struct GenericFamilyTests {
    
    @Test("GenericFamily enum has correct traditional cases and raw values")
    func testTraditionalCases() {
        // Traditional generic families
        #expect(GenericFamily.serif.rawValue == "serif")
        #expect(GenericFamily.sansSerif.rawValue == "sans-serif")
        #expect(GenericFamily.monospace.rawValue == "monospace")
        #expect(GenericFamily.cursive.rawValue == "cursive")
        #expect(GenericFamily.fantasy.rawValue == "fantasy")
    }
    
    @Test("GenericFamily enum has correct modern UI cases and raw values")
    func testUIRelatedCases() {
        // Modern UI-related generic families
        #expect(GenericFamily.systemUi.rawValue == "system-ui")
        #expect(GenericFamily.uiSerif.rawValue == "ui-serif")
        #expect(GenericFamily.uiSansSerif.rawValue == "ui-sans-serif")
        #expect(GenericFamily.uiMonospace.rawValue == "ui-monospace")
        #expect(GenericFamily.uiRounded.rawValue == "ui-rounded")
    }
    
    @Test("GenericFamily enum has correct special purpose cases and raw values")
    func testSpecialPurposeCases() {
        // Special-purpose generic families
        #expect(GenericFamily.math.rawValue == "math")
        #expect(GenericFamily.emoji.rawValue == "emoji")
        #expect(GenericFamily.fangsong.rawValue == "fangsong")
    }
    
    @Test("GenericFamily description returns raw value")
    func testDescription() {
        #expect(GenericFamily.serif.description == "serif")
        #expect(GenericFamily.sansSerif.description == "sans-serif")
        #expect(GenericFamily.monospace.description == "monospace")
        #expect(GenericFamily.systemUi.description == "system-ui")
        #expect(GenericFamily.math.description == "math")
    }
    
    @Test("GenericFamily conforms to Hashable")
    func testHashable() {
        // Same cases should be equal
        let family1 = GenericFamily.sansSerif
        let family2 = GenericFamily.sansSerif
        #expect(family1 == family2)
        
        // Different cases should not be equal
        let family3 = GenericFamily.monospace
        #expect(family1 != family3)
    }
    
    @Test("GenericFamily can be created from raw values")
    func testRawValueInitialization() {
        #expect(GenericFamily(rawValue: "serif") == GenericFamily.serif)
        #expect(GenericFamily(rawValue: "sans-serif") == GenericFamily.sansSerif)
        #expect(GenericFamily(rawValue: "monospace") == GenericFamily.monospace)
        #expect(GenericFamily(rawValue: "system-ui") == GenericFamily.systemUi)
        #expect(GenericFamily(rawValue: "ui-serif") == GenericFamily.uiSerif)
        #expect(GenericFamily(rawValue: "math") == GenericFamily.math)
        #expect(GenericFamily(rawValue: "invalid") == nil)
    }
    
    @Test("GenericFamily is used correctly in CSS font-family property")
    func testUsageInContext() {
        // Single generic family
        let monoFont = "font-family: \(GenericFamily.monospace)"
        #expect(monoFont == "font-family: monospace")
        
        // Multiple generic families in a fallback stack
        let fontsWithFallback = "font-family: 'Helvetica Neue', \(GenericFamily.sansSerif)"
        #expect(fontsWithFallback == "font-family: 'Helvetica Neue', sans-serif")
        
        // Multiple generic families
        let multipleFonts = "font-family: \(GenericFamily.uiSansSerif), \(GenericFamily.sansSerif)"
        #expect(multipleFonts == "font-family: ui-sans-serif, sans-serif")
    }
    
    @Test("GenericFamily cases match CSS specification")
    func testCSSSpecification() {
        // Traditional generic families
        #expect(GenericFamily.serif.description == "serif") // Fonts with serifs
        #expect(GenericFamily.sansSerif.description == "sans-serif") // Fonts without serifs
        #expect(GenericFamily.monospace.description == "monospace") // Fixed-width fonts
        #expect(GenericFamily.cursive.description == "cursive") // Handwriting fonts
        #expect(GenericFamily.fantasy.description == "fantasy") // Decorative fonts
        
        // Modern UI generic families
        #expect(GenericFamily.systemUi.description == "system-ui") // System UI font
        #expect(GenericFamily.uiSerif.description == "ui-serif") // System serif font
        #expect(GenericFamily.uiSansSerif.description == "ui-sans-serif") // System sans-serif font
        #expect(GenericFamily.uiMonospace.description == "ui-monospace") // System monospace font
        #expect(GenericFamily.uiRounded.description == "ui-rounded") // System rounded font
        
        // Special purpose generic families
        #expect(GenericFamily.math.description == "math") // Mathematical fonts
        #expect(GenericFamily.emoji.description == "emoji") // Emoji fonts
        #expect(GenericFamily.fangsong.description == "fangsong") // Chinese Fangsong fonts
    }
}
