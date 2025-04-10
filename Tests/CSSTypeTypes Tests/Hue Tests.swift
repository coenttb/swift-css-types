//
//  Hue Tests.swift
//  
//
//  Created on 04/02/2025.
//

import CSSTypeTypes
import Testing

@Suite("Hue Tests")
struct HueTests {
    
    @Test("Hue with number renders correctly")
    func testHueWithNumber() {
        let hue = Hue.number(Number(120))
        #expect(hue.description == "120")
        
        let hue2 = Hue.number(Number(240.5))
        #expect(hue2.description == "240.5")
    }
    
    @Test("Hue with angle renders correctly")
    func testHueWithAngle() {
        let hueDeg = Hue.angle(.deg(120))
        #expect(hueDeg.description == "120deg")
        
        let hueTurn = Hue.angle(.turn(0.5))
        #expect(hueTurn.description == "0.5turn")
        
        let hueRad = Hue.angle(.rad(3.14159))
        #expect(hueRad.description == "3.14159rad")
        
        let hueGrad = Hue.angle(.grad(100))
        #expect(hueGrad.description == "100grad")
    }
    
    @Test("Hue normalization works correctly")
    func testHueNormalization() {
        // Basic values
        #expect(Hue.angle(.deg(120)).normalizedDegrees() == 120)
        #expect(Hue.number(Number(240)).normalizedDegrees() == 240)
        
        // Value over 360 should wrap around
        #expect(Hue.angle(.deg(420)).normalizedDegrees() == 60)
        #expect(Hue.number(Number(540)).normalizedDegrees() == 180)
        
        // Negative values should wrap around
        #expect(Hue.angle(.deg(-120)).normalizedDegrees() == 240)
        #expect(Hue.number(Number(-90)).normalizedDegrees() == 270)
        
        // Other angle units
        #expect(Hue.angle(.turn(0.25)).normalizedDegrees() == 90)
        #expect(Hue.angle(.turn(1.5)).normalizedDegrees() == 180)
        #expect(Hue.angle(.rad(.pi)).normalizedDegrees() == 180)
        
        // 400grad converts to 360deg, but after normalization should be 0
        #expect(Hue.angle(.grad(400)).normalizedDegrees() == 0) // 400grad = 360deg, which normalizes to 0
    }
    
    @Test("Hue conforms to Equatable")
    func testEquatable() {
        // Same type and values should be equal
        #expect(Hue.number(Number(120)) == Hue.number(Number(120)))
        #expect(Hue.angle(.deg(240)) == Hue.angle(.deg(240)))
        
        // Different values should not be equal
        #expect(Hue.number(Number(120)) != Hue.number(Number(180)))
        #expect(Hue.angle(.deg(120)) != Hue.angle(.deg(240)))
        
        // Different types should not be equal
        #expect(Hue.number(Number(120)) != Hue.angle(.deg(120)))
        
        // Different angle units with same degree equivalent might not be equal in this implementation
        // This depends on if the implementation considers semantic equality or literal equality
        #expect(Hue.angle(.deg(180)) != Hue.angle(.turn(0.5)))
    }
    
    @Test("Hue is used correctly in color function context")
    func testUsageInColorContext() {
        // Create sample CSS color strings using Hue values
        let hsl = "hsl(\(Hue.angle(.deg(120))), 100%, 50%)"
        #expect(hsl == "hsl(120deg, 100%, 50%)")
        
        let hwb = "hwb(\(Hue.angle(.turn(0.25))) 20% 0%)"
        #expect(hwb == "hwb(0.25turn 20% 0%)")
        
        let lch = "lch(50% 50 \(Hue.number(Number(240))))"
        #expect(lch == "lch(50% 50 240)")
    }
}
