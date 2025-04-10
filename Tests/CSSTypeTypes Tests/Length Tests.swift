//
//  Length Tests.swift
//  
//
//  Created on 04/02/2025.
//

import CSSTypeTypes
import Testing

@Suite("Length Tests")
struct LengthTests {
    
    @Test("Length with units renders correctly")
    func testLengthWithUnits() {
        // Test absolute units
        #expect(Length.length(10, .px).description == "10px")
        #expect(Length.length(2.5, .cm).description == "2.5cm")
        #expect(Length.length(5, .mm).description == "5mm")
        #expect(Length.length(1, .in).description == "1in")
        #expect(Length.length(12, .pt).description == "12pt")
        #expect(Length.length(2, .pc).description == "2pc")
        
        // Test relative font units
        #expect(Length.length(1.5, .em).description == "1.5em")
        #expect(Length.length(2, .rem).description == "2rem")
        #expect(Length.length(3, .ex).description == "3ex")
        #expect(Length.length(4, .ch).description == "4ch")
        
        // Test viewport units
        #expect(Length.length(50, .vw).description == "50vw")
        #expect(Length.length(100, .vh).description == "100vh")
        #expect(Length.length(10, .vmin).description == "10vmin")
        #expect(Length.length(90, .vmax).description == "90vmax")
        
        // Test newer CSS units
        #expect(Length.length(5, .q).description == "5q")
        #expect(Length.length(2, .cap).description == "2cap")
        #expect(Length.length(3, .lh).description == "3lh")
    }
    
    @Test("Length keywords render correctly")
    func testLengthKeywords() {
        #expect(Length.keyword(.auto).description == "auto")
        #expect(Length.keyword(.maxContent).description == "max-content")
        #expect(Length.keyword(.minContent).description == "min-content")
        #expect(Length.keyword(.fitContent).description == "fit-content")
    }
    
    @Test("Length calc expressions render correctly")
    func testLengthCalc() {
        #expect(Length.calc("100% - 20px").description == "calc(100% - 20px)")
        #expect(Length.calc("50vh + 10em").description == "calc(50vh + 10em)")
    }
    
    @Test("Length global values render correctly")
    func testLengthGlobals() {
        #expect(Length.global(.inherit).description == "inherit")
        #expect(Length.global(.initial).description == "initial")
        #expect(Length.global(.unset).description == "unset")
    }
    
    @Test("Length factory methods work correctly")
    func testLengthFactoryMethods() {
        // Test basic unit factory methods
        #expect(Length.px(10).description == "10px")
        #expect(Length.em(1.5).description == "1.5em")
        #expect(Length.rem(2).description == "2rem")
        #expect(Length.vw(50).description == "50vw")
        #expect(Length.vh(100).description == "100vh")
        
        // Test keyword factory methods
        #expect(Length.auto.description == "auto")
        #expect(Length.maxContent.description == "max-content")
        #expect(Length.minContent.description == "min-content")
        #expect(Length.fitContent.description == "fit-content")
    }
    
    @Test("Length conforms to ExpressibleByIntegerLiteral")
    func testExpressibleByIntegerLiteral() {
        let length: Length = 10
        #expect(length.description == "10px")
    }
    
    @Test("Length conforms to ExpressibleByFloatLiteral")
    func testExpressibleByFloatLiteral() {
        let length: Length = 10.5
        #expect(length.description == "10.5px")
    }
    
    @Test("Int extensions for Length creation work correctly")
    func testIntExtensions() {
        #expect(10.px.description == "10px")
        #expect(2.em.description == "2em")
        #expect(50.vw.description == "50vw")
        #expect(1.cm.description == "1cm")
        #expect(3.q.description == "3q")
    }
    
    @Test("Double extensions for Length creation work correctly")
    func testDoubleExtensions() {
        #expect(10.5.px.description == "10.5px")
        #expect(1.5.em.description == "1.5em")
        #expect(50.5.vw.description == "50.5vw")
        #expect(2.25.cm.description == "2.25cm")
        #expect(3.75.q.description == "3.75q")
    }
    
    @Test("Length conforms to Equatable")
    func testEquatable() {
        // Same type and values should be equal
        #expect(Length.px(10) == Length.px(10))
        #expect(Length.em(1.5) == Length.em(1.5))
        #expect(Length.auto == Length.auto)
        
        // Different values should not be equal
        #expect(Length.px(10) != Length.px(20))
        #expect(Length.em(1.5) != Length.em(2.5))
        
        // Different types should not be equal
        #expect(Length.px(10) != Length.em(10))
        #expect(Length.auto != Length.px(10))
        
        // Same value in literal and method form should be equal
        #expect(Length.px(10) == 10)
        #expect(Length.px(10.5) == 10.5)
    }
    
    @Test("Length conforms to Numeric - addition")
    func testNumericAddition() {
        // Addition with same units
        let sum1 = Length.px(10) + Length.px(20)
        #expect(sum1.description == "30px")
        
        let sum2 = Length.em(1.5) + Length.em(2.5)
        #expect(sum2.description == "4em")
        
        // Addition with different units creates calc expression
        let mixedSum = Length.px(10) + Length.em(2)
        #expect(mixedSum.description == "calc(10px + 2em)")
    }
    
    @Test("Length conforms to Numeric - subtraction")
    func testNumericSubtraction() {
        // Subtraction with same units
        let diff1 = Length.px(30) - Length.px(10)
        #expect(diff1.description == "20px")
        
        let diff2 = Length.em(4) - Length.em(1.5)
        #expect(diff2.description == "2.5em")
        
        // Subtraction with different units creates calc expression
        let mixedDiff = Length.vw(100) - Length.px(20)
        #expect(mixedDiff.description == "calc(100vw - 20px)")
    }
    
    @Test("Length conforms to Numeric - multiplication")
    func testNumericMultiplication() {
        // Multiplication of lengths
        let product = Length.px(5) * Length.length(2, .px)
        #expect(product.description == "10px")
        
        let mixedProduct = 10.px * 2.em
        #expect(mixedProduct.description == "calc(10px * 2em)")
    }
    
    @Test("Length division works correctly")
    func testDivision() {
        // Division by Double
        let quotient1 = Length.px(10) / 2.0
        #expect(quotient1.description == "5px")
        
        // Division by Int
        let quotient2 = Length.px(15) / 3
        #expect(quotient2.description == "5px")
        
        // Division of em units
        let quotient3 = Length.em(6) / 2
        #expect(quotient3.description == "3em")
    }
    
    @Test("Length is used correctly in CSS properties context")
    func testUsageInCSSContext() {
        // Create sample CSS property strings using Length values
        let width = "width: \(Length.px(200))"
        #expect(width == "width: 200px")
        
        let margin = "margin: \(Length.em(1.5))"
        #expect(margin == "margin: 1.5em")
        
        let height = "height: \(Length.auto)"
        #expect(height == "height: auto")
        
        let padding = "padding: \(Length.calc("10% + 20px"))"
        #expect(padding == "padding: calc(10% + 20px)")
    }
}
