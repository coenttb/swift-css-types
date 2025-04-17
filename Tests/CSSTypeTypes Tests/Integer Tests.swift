//
//  Integer Tests.swift
//  
//
//  Created on 04/02/2025.
//

import CSSTypeTypes
import Testing

@Suite("Integer Tests")
struct IntegerTests {
    
    @Test("Integer initializer creates proper instances")
    func testInitializer() {
        let positiveInt = Integer(42)
        #expect(positiveInt.value == 42)
        #expect(positiveInt.description == "42")
        
        let negativeInt = Integer(-10)
        #expect(negativeInt.value == -10)
        #expect(negativeInt.description == "-10")
        
        let zeroInt = Integer(0)
        #expect(zeroInt.value == 0)
        #expect(zeroInt.description == "0")
    }
    
    @Test("Integer provides static constants")
    func testStaticConstants() {
        #expect(Integer.zero.value == 0)
        #expect(Integer.zero.description == "0")
        
        #expect(Integer.one.value == 1)
        #expect(Integer.one.description == "1")
    }
    
    @Test("Integer supports integer literal initialization")
    func testIntegerLiteralInitialization() {
        let literalInt: Integer = 100
        #expect(literalInt.value == 100)
        #expect(literalInt.description == "100")
        
        let negativeIntLiteral: Integer = -50
        #expect(negativeIntLiteral.value == -50)
        #expect(negativeIntLiteral.description == "-50")
    }
    
    @Test("Integer conforms to Hashable")
    func testHashable() {
        // Same values should be equal
        let int1 = Integer(25)
        let int2 = Integer(25)
        #expect(int1 == int2)
        
        // Different values should not be equal
        let int3 = Integer(26)
        #expect(int1 != int3)
        
        // Integer literal should equal initialized value
        let int4: Integer = 25
        #expect(int1 == int4)
    }
    
    @Test("Integer supports comparison")
    func testComparison() {
        let int1 = Integer(10)
        let int2 = Integer(20)
        
        #expect(int1 < int2) // 10 < 20
        #expect(!(int2 < int1)) // !(20 < 10)
        
        // Same values
        let int3 = Integer(10)
        #expect(!(int1 < int3)) // !(10 < 10)
        #expect(!(int3 < int1)) // !(10 < 10)
    }
    
    @Test("Integer supports arithmetic operations")
    func testArithmetic() {
        // Addition
        let sum = Integer(5) + Integer(10)
        #expect(sum.value == 15)
        #expect(sum == Integer(15))
        
        // Subtraction
        let difference = Integer(20) - Integer(8)
        #expect(difference.value == 12)
        #expect(difference == Integer(12))
        
        // Negation
        let negation = -Integer(7)
        #expect(negation.value == -7)
        #expect(negation == Integer(-7))
        
        // Absolute value
        let negative = Integer(-15)
        let abs = negative.absolute
        #expect(abs.value == 15)
        #expect(abs == Integer(15))
        
        // Absolute of positive number
        let positive = Integer(15)
        let absPositive = positive.absolute
        #expect(absPositive.value == 15)
        #expect(absPositive == positive)
    }
    
    @Test("Integer is used correctly in CSS properties context")
    func testUsageInContext() {
        // Z-index property
        let zIndex = "z-index: \(Integer(5))"
        #expect(zIndex == "z-index: 5")
        
        // Negative z-index
        let negativeZIndex = "z-index: \(Integer(-1))"
        #expect(negativeZIndex == "z-index: -1")
        
        // Column count property
        let columnCount = "column-count: \(Integer(3))"
        #expect(columnCount == "column-count: 3")
        
        // Order property (flexbox)
        let order = "order: \(Integer(2))"
        #expect(order == "order: 2")
    }
}
