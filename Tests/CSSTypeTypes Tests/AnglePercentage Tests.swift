//
//  AnglePercentage Tests.swift
//  
//
//  Created on 03/26/2025.
//

import CSSTypeTypes
import Testing

@Suite("AnglePercentage Tests")
struct AnglePercentageTests {
    
    @Test("Angle values render correctly")
    func testAngleValues() {
        let degrees = AnglePercentage.angle(.deg(45))
        #expect(degrees.description == "45deg")
        
        let radians = AnglePercentage.angle(.rad(1.5708))
        #expect(radians.description == "1.5708rad")
        
        let gradians = AnglePercentage.angle(.grad(100))
        #expect(gradians.description == "100grad")
        
        let turns = AnglePercentage.angle(.turn(0.25))
        #expect(turns.description == "0.25turn")
    }
    
    @Test("Percentage values render correctly")
    func testPercentageValues() {
        let zeroPercent = AnglePercentage.percentage(0)
        #expect(zeroPercent.description == "0%")
        
        let fiftyPercent = AnglePercentage.percentage(50)
        #expect(fiftyPercent.description == "50%")
        
        let hundredPercent = AnglePercentage.percentage(100)
        #expect(hundredPercent.description == "100%")
        
        let decimalPercent = AnglePercentage.percentage(33.33)
        #expect(decimalPercent.description == "33.33%")
        
        let negativePercent = AnglePercentage.percentage(-25)
        #expect(negativePercent.description == "-25%")
    }
    
    @Test("Integer literal conversion works correctly")
    func testIntegerLiteralConversion() {
        let angle: AnglePercentage = 45
        #expect(angle.description == "45deg")
        
        if case let .angle(innerAngle) = angle, case let .deg(value) = innerAngle {
            #expect(value == 45)
        } else {
            #expect(false, "Expected .angle(.deg(45))")
        }
    }
    
    @Test("Float literal conversion works correctly")
    func testFloatLiteralConversion() {
        let angle: AnglePercentage = 45.5
        #expect(angle.description == "45.5deg")
        
        if case let .angle(innerAngle) = angle, case let .deg(value) = innerAngle {
            #expect(value == 45.5)
        } else {
            #expect(false, "Expected .angle(.deg(45.5))")
        }
    }
    
    @Test("AnglePercentage conforms to Equatable")
    func testEquatable() {
        let angle1 = AnglePercentage.angle(.deg(45))
        let angle2 = AnglePercentage.angle(.deg(45))
        let angle3 = AnglePercentage.angle(.deg(90))
        
        #expect(angle1 == angle2)
        #expect(angle1 != angle3)
        
        let percent1 = AnglePercentage.percentage(50)
        let percent2 = AnglePercentage.percentage(50)
        let percent3 = AnglePercentage.percentage(75)
        
        #expect(percent1 == percent2)
        #expect(percent1 != percent3)
        
        // Angle and percentage should not be equal
        #expect(angle1 != percent1)
        
        // Different angle types with equivalent values are not equal
        let turn = AnglePercentage.angle(.turn(0.125)) // 45 degrees as turn
        #expect(angle1 != turn)
        
        // Literals should be equal to their angle equivalents
        let literal: AnglePercentage = 45
        #expect(literal == angle1)
    }
}
