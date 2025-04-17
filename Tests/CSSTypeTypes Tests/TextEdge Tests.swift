//
//  TextEdge Tests.swift
//  
//
//  Created on 03/26/2025.
//

import CSSTypeTypes
import Testing

@Suite("TextEdge Tests")
struct TextEdgeTests {
    
    @Test("Single value text edge values render correctly")
    func testSingleValues() {
        #expect(TextEdge.text.description == "text")
        #expect(TextEdge.ideographic.description == "ideographic")
        #expect(TextEdge.ideographicInk.description == "ideographic-ink")
        
        let customSingle = TextEdge.single(.text)
        #expect(customSingle.description == "text")
    }
    
    @Test("Paired value text edge values render correctly")
    func testPairValues() {
        #expect(TextEdge.capAlphabetic.description == "cap alphabetic")
        #expect(TextEdge.exAlphabetic.description == "ex alphabetic")
        
        let customPair = TextEdge.pair(.text, .alphabetic)
        #expect(customPair.description == "text alphabetic")
        
        let ideographicPair = TextEdge.pair(.ideographic, .ideographicInk)
        #expect(ideographicPair.description == "ideographic ideographic-ink")
    }
    
    @Test("TextEdge.Value conforms to CaseIterable")
    func testValueCaseIterable() {
        let allCases = TextEdge.Value.allCases
        #expect(allCases.count == 3)
        #expect(allCases.contains(.text))
        #expect(allCases.contains(.ideographic))
        #expect(allCases.contains(.ideographicInk))
    }
    
    @Test("TextEdge.OverValue conforms to CaseIterable")
    func testOverValueCaseIterable() {
        let allCases = TextEdge.OverValue.allCases
        #expect(allCases.count == 5)
        #expect(allCases.contains(.text))
        #expect(allCases.contains(.ideographic))
        #expect(allCases.contains(.ideographicInk))
        #expect(allCases.contains(.cap))
        #expect(allCases.contains(.ex))
    }
    
    @Test("TextEdge.UnderValue conforms to CaseIterable")
    func testUnderValueCaseIterable() {
        let allCases = TextEdge.UnderValue.allCases
        #expect(allCases.count == 4)
        #expect(allCases.contains(.text))
        #expect(allCases.contains(.ideographic))
        #expect(allCases.contains(.ideographicInk))
        #expect(allCases.contains(.alphabetic))
    }
    
    @Test("TextEdge conforms to Hashable")
    func testHashable() {
        let text1 = TextEdge.text
        let text2 = TextEdge.single(.text)
        let ideographic = TextEdge.ideographic
        
        #expect(text1 == text2)
        #expect(text1 != ideographic)
        
        let pair1 = TextEdge.capAlphabetic
        let pair2 = TextEdge.pair(.cap, .alphabetic)
        let pair3 = TextEdge.exAlphabetic
        
        #expect(pair1 == pair2)
        #expect(pair1 != pair3)
        #expect(pair1 != text1)
    }
    
    @Test("Raw values for nested enums are correct")
    func testRawValues() {
        #expect(TextEdge.Value.text.rawValue == "text")
        #expect(TextEdge.Value.ideographic.rawValue == "ideographic")
        #expect(TextEdge.Value.ideographicInk.rawValue == "ideographic-ink")
        
        #expect(TextEdge.OverValue.cap.rawValue == "cap")
        #expect(TextEdge.OverValue.ex.rawValue == "ex")
        
        #expect(TextEdge.UnderValue.alphabetic.rawValue == "alphabetic")
    }
}
