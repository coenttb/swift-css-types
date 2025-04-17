//
//  Angle Tests.swift
//  
//
//  Created on 03/26/2025.
//

import CSSTypeTypes
import Testing

@Suite("Angle Tests")
struct AngleTests {
    
    @Test("Degree values render correctly")
    func testDegreeValues() {
        let angle = Angle.deg(45)
        #expect(angle.description == "45deg")
        
        let negativeAngle = Angle.deg(-90)
        #expect(negativeAngle.description == "-90deg")
        
        let zeroAngle = Angle.deg(0)
        #expect(zeroAngle.description == "0deg")
        
        // Alternative constructor
        let angleAlt = Angle.degrees(45)
        #expect(angleAlt.description == "45deg")
    }
    
    @Test("Radian values render correctly")
    func testRadianValues() {
        let angle = Angle.rad(1.5708) // ~90 degrees
        #expect(angle.description == "1.5708rad")
        
        let negativeAngle = Angle.rad(-3.14159) // ~-180 degrees
        #expect(negativeAngle.description == "-3.14159rad")
        
        // Alternative constructor
        let angleAlt = Angle.radians(1.5708)
        #expect(angleAlt.description == "1.5708rad")
    }
    
    @Test("Gradian values render correctly")
    func testGradianValues() {
        let angle = Angle.grad(100) // 90 degrees
        #expect(angle.description == "100grad")
        
        let negativeAngle = Angle.grad(-50)
        #expect(negativeAngle.description == "-50grad")
        
        // Alternative constructor
        let angleAlt = Angle.gradians(100)
        #expect(angleAlt.description == "100grad")
    }
    
    @Test("Turn values render correctly")
    func testTurnValues() {
        let angle = Angle.turn(0.25) // 90 degrees
        #expect(angle.description == "0.25turn")
        
        let fullTurn = Angle.turn(1)
        #expect(fullTurn.description == "1turn")
        
        let multipleTurns = Angle.turn(2.5)
        #expect(multipleTurns.description == "2.5turn")
    }
    
    @Test("ExpressibleByIntegerLiteral initializer works correctly")
    func testIntegerLiteralInitializer() {
        let angle: Angle = 90
        #expect(angle.description == "90deg")
        
        if case let .deg(value) = angle {
            #expect(value == 90)
        } else {
            #expect(false, "Expected .deg case")
        }
    }
    
    @Test("ExpressibleByFloatLiteral initializer works correctly")
    func testFloatLiteralInitializer() {
        let angle: Angle = 45.5
        #expect(angle.description == "45.5deg")
        
        if case let .deg(value) = angle {
            #expect(value == 45.5)
        } else {
            #expect(false, "Expected .deg case")
        }
    }
    
    @Test("Angle conforms to Hashable")
    func testHashable() {
        let deg1 = Angle.deg(45)
        let deg2 = Angle.deg(45)
        let deg3 = Angle.deg(90)
        
        #expect(deg1 == deg2)
        #expect(deg1 != deg3)
        
        let rad1 = Angle.rad(1.5708)
        let rad2 = Angle.rad(1.5708)
        
        #expect(rad1 == rad2)
        #expect(rad1 != deg1) // Different types are not equal even if they represent similar angles
        
        // Literals should be equal to their degree equivalents
        let literal: Angle = 45
        #expect(literal == deg1)
    }
}
