//
//  LengthPercentage Tests.swift
//  
//
//  Created on 04/02/2025.
//

import CSSTypeTypes
import Testing

@Suite("LengthPercentage Tests")
struct LengthPercentageTests {
    
    @Test("LengthPercentage with length renders correctly")
    func testLengthPercentageWithLength() {
        let px = LengthPercentage.length(.px(10))
        #expect(px.description == "10px")
        
        let em = LengthPercentage.length(.em(1.5))
        #expect(em.description == "1.5em")
        
        let rem = LengthPercentage.length(.rem(2))
        #expect(rem.description == "2rem")
    }
    
    @Test("LengthPercentage with percentage renders correctly")
    func testLengthPercentageWithPercentage() {
        let percentage50 = LengthPercentage.percentage(Percentage(50))
        #expect(percentage50.description == "50%")
        
        let percentage75 = LengthPercentage.percentage(Percentage(75))
        #expect(percentage75.description == "75%")
        
        let percentage33_3 = LengthPercentage.percentage(Percentage(33.3))
        #expect(percentage33_3.description == "33.3%")
    }
    
    @Test("LengthPercentage with calc renders correctly")
    func testLengthPercentageWithCalc() {
        let calc = LengthPercentage.calc("100% - 20px")
        #expect(calc.description == "calc(100% - 20px)")
        
        let calcComplex = LengthPercentage.calc("50vh + 2em")
        #expect(calcComplex.description == "calc(50vh + 2em)")
    }
    
    @Test("LengthPercentage factory methods work correctly")
    func testLengthPercentageFactoryMethods() {
        // Test px with Double
        let px = LengthPercentage.px(10.5)
        #expect(px.description == "10.5px")
        
        // Test px with Int
        let pxInt = LengthPercentage.px(20)
        #expect(pxInt.description == "20px")
        
        // Test em with Double
        let em = LengthPercentage.em(1.5)
        #expect(em.description == "1.5em")
        
        // Test em with Int
        let emInt = LengthPercentage.em(2)
        #expect(emInt.description == "2em")
        
        // Test rem with Double
        let rem = LengthPercentage.rem(2.5)
        #expect(rem.description == "2.5rem")
        
        // Test rem with Int
        let remInt = LengthPercentage.rem(3)
        #expect(remInt.description == "3rem")
        
        // Test percentage with Int
        let percent = LengthPercentage.percentage(50)
        #expect(percent.description == "50%")
        
        // Test auto
        #expect(LengthPercentage.auto.description == "auto")
    }
    
    @Test("LengthPercentage conforms to ExpressibleByIntegerLiteral")
    func testExpressibleByIntegerLiteral() {
        let lengthPercentage: LengthPercentage = 10
        #expect(lengthPercentage.description == "10px")
    }
    
    @Test("LengthPercentage conforms to ExpressibleByFloatLiteral")
    func testExpressibleByFloatLiteral() {
        let lengthPercentage: LengthPercentage = 10.5
        #expect(lengthPercentage.description == "10.5px")
    }
    
    @Test("LengthPercentage conforms to Equatable")
    func testEquatable() {
        // Same type and values should be equal
        #expect(LengthPercentage.px(10) == LengthPercentage.px(10))
        #expect(LengthPercentage.percentage(50) == LengthPercentage.percentage(50))
        #expect(LengthPercentage.calc("100% - 20px") == LengthPercentage.calc("100% - 20px"))
        
        // Different values should not be equal
        #expect(LengthPercentage.px(10) != LengthPercentage.px(20))
        #expect(LengthPercentage.percentage(50) != LengthPercentage.percentage(75))
        
        // Different types should not be equal
        #expect(LengthPercentage.px(10) != LengthPercentage.percentage(10))
        #expect(LengthPercentage.calc("50%") != LengthPercentage.percentage(50))
    }
    
    @Test("LengthPercentage is used correctly in CSS properties context")
    func testUsageInCSSContext() {
        // Create sample CSS property strings using LengthPercentage values
        let width = "width: \(LengthPercentage.px(200))"
        #expect(width == "width: 200px")
        
        let height = "height: \(LengthPercentage.percentage(50))"
        #expect(height == "height: 50%")
        
        let margin = "margin: \(LengthPercentage.calc("100% - 20px"))"
        #expect(margin == "margin: calc(100% - 20px)")
        
        let fontSize = "font-size: \(LengthPercentage.rem(1.2))"
        #expect(fontSize == "font-size: 1.2rem")
    }
}
