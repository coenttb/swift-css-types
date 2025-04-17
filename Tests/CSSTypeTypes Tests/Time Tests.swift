//
//  Time Tests.swift
//  
//
//  Created on 03/26/2025.
//

import CSSTypeTypes
import Testing

@Suite("Time Tests")
struct TimeTests {
    
    @Test("Time values render correctly")
    func testTimeRendering() {
        let seconds = Time.s(1.5)
        #expect(seconds.description == "1.5s")
        
        let milliseconds = Time.ms(500)
        #expect(milliseconds.description == "500ms")
        
        let zero = Time.zero
        #expect(zero.description == "0s")
        
        let zeroMs = Time.ms(0)
        #expect(zeroMs.description == "0ms")
        
        let negative = Time.s(-0.5)
        #expect(negative.description == "-0.5s")
    }
    
    @Test("Predefined constants work correctly")
    func testPredefines() {
        #expect(Time.zero.value == 0)
        #expect(Time.zero.unit == .s)
        
        #expect(Time.oneSecond.value == 1)
        #expect(Time.oneSecond.unit == .s)
        
        #expect(Time.halfSecond.value == 0.5)
        #expect(Time.halfSecond.unit == .s)
    }
    
    @Test("Unit conversion works correctly")
    func testUnitConversion() {
        let oneSecond = Time.s(1)
        #expect(oneSecond.inMilliseconds == 1000)
        
        let twoThousandMs = Time.ms(2000)
        #expect(twoThousandMs.inSeconds == 2)
        
        // Conversion to the same unit should return the same instance
        let sameUnit = oneSecond.converted(to: .s)
        #expect(sameUnit == oneSecond)
        
        // Conversion to a different unit
        let converted = oneSecond.converted(to: .ms)
        #expect(converted.value == 1000)
        #expect(converted.unit == .ms)
        
        // And back again
        let backAgain = converted.converted(to: .s)
        #expect(backAgain.value == 1)
        #expect(backAgain.unit == .s)
    }
    
    @Test("Arithmetic operations work correctly")
    func testArithmetic() {
        let oneSecond = Time.s(1)
        let halfSecond = Time.s(0.5)
        let fiveHundredMs = Time.ms(500)
        
        // Addition
        let sum1 = oneSecond + halfSecond
        #expect(sum1.value == 1.5)
        #expect(sum1.unit == .s)
        
        let sum2 = oneSecond + fiveHundredMs
        #expect(sum2.value == 1.5)
        #expect(sum2.unit == .s)
        
        let sum3 = fiveHundredMs + oneSecond
        #expect(sum3.value == 1500)
        #expect(sum3.unit == .ms)
        
        // Subtraction
        let diff1 = oneSecond - halfSecond
        #expect(diff1.value == 0.5)
        #expect(diff1.unit == .s)
        
        let diff2 = oneSecond - fiveHundredMs
        #expect(diff2.value == 0.5)
        #expect(diff2.unit == .s)
        
        // Multiplication
        let mul1 = oneSecond * 2
        #expect(mul1.value == 2)
        #expect(mul1.unit == .s)
        
        let mul2 = fiveHundredMs * 3
        #expect(mul2.value == 1500)
        #expect(mul2.unit == .ms)
        
        // Division
        let div1 = oneSecond / 2
        #expect(div1.value == 0.5)
        #expect(div1.unit == .s)
        
        let div2 = fiveHundredMs / 5
        #expect(div2.value == 100)
        #expect(div2.unit == .ms)
        
        // Negation
        let neg1 = -oneSecond
        #expect(neg1.value == -1)
        #expect(neg1.unit == .s)
    }
    
    @Test("Comparison operations work correctly")
    func testComparison() {
        let oneSecond = Time.s(1)
        let halfSecond = Time.s(0.5)
        let twoSeconds = Time.s(2)
        let fiveHundredMs = Time.ms(500)
        let twoThousandMs = Time.ms(2000)
        
        #expect(halfSecond < oneSecond)
        #expect(oneSecond < twoSeconds)
        #expect(fiveHundredMs < oneSecond)
        #expect(oneSecond < twoThousandMs)
        #expect(fiveHundredMs == halfSecond)
        #expect(twoThousandMs == twoSeconds)
        #expect(!(oneSecond < oneSecond))
    }
    
    @Test("Literal conversions work correctly")
    func testLiteralConversion() {
        let integerLiteral: Time = 2
        #expect(integerLiteral.value == 2)
        #expect(integerLiteral.unit == .s)
        
        let floatLiteral: Time = 1.5
        #expect(floatLiteral.value == 1.5)
        #expect(floatLiteral.unit == .s)
    }
    
    @Test("Time.Unit conforms to Hashable")
    func testUnitHashable() {
        #expect(Time.Unit.s == Time.Unit.s)
        #expect(Time.Unit.ms == Time.Unit.ms)
        #expect(Time.Unit.s != Time.Unit.ms)
    }
}
