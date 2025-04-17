//
//  Resolution Tests.swift
//  
//
//  Created on 03/26/2025.
//

import CSSTypeTypes
import Testing

@Suite("Resolution Tests")
struct ResolutionTests {
    
    @Test("Resolution values render correctly")
    func testResolutionValues() {
        let dpi = Resolution.dpi(300)
        #expect(dpi.description == "300dpi")
        
        let dpcm = Resolution.dpcm(120)
        #expect(dpcm.description == "120dpcm")
        
        let dppx = Resolution.dppx(2)
        #expect(dppx.description == "2dppx")
        
        let x = Resolution.x(3)
        #expect(x.description == "3x")
    }
    
    @Test("Fractional resolution values render correctly")
    func testFractionalValues() {
        let dpi = Resolution.dpi(72.5)
        #expect(dpi.description == "72.5dpi")
        
        let dpcm = Resolution.dpcm(28.452)
        #expect(dpcm.description == "28.452dpcm")
        
        let dppx = Resolution.dppx(1.5)
        #expect(dppx.description == "1.5dppx")
    }
    
    @Test("Standard resolution constants are correct")
    func testStandardConstants() {
        #expect(Resolution.standard.value == 96)
        #expect(Resolution.standard.unit == .dpi)
        
        #expect(Resolution.retina.value == 192)
        #expect(Resolution.retina.unit == .dpi)
        
        #expect(Resolution.print.value == 300)
        #expect(Resolution.print.unit == .dpi)
    }
    
    @Test("Unit conversion works correctly")
    func testUnitConversion() {
        let dpi = Resolution.dpi(96)
        let toDpcm = dpi.converted(to: .dpcm)
        
        #expect(toDpcm.unit == .dpcm)
        #expect(toDpcm.value.rounded() == 38) // 96/2.54 ≈ 37.8
        
        let toDppx = dpi.converted(to: .dppx)
        #expect(toDppx.unit == .dppx)
        #expect(toDppx.value == 1) // 96/96 = 1
        
        let toX = dpi.converted(to: .x)
        #expect(toX.unit == .x)
        #expect(toX.value == 1) // 96/96 = 1
        
        // Test dppx to dpi
        let dppx = Resolution.dppx(2)
        let toDpi = dppx.converted(to: .dpi)
        #expect(toDpi.unit == .dpi)
        #expect(toDpi.value == 192) // 2*96 = 192
        
        // Test x to dpcm
        let x = Resolution.x(3)
        let xToDpcm = x.converted(to: .dpcm)
        #expect(xToDpcm.unit == .dpcm)
        #expect(xToDpcm.value.rounded() == 113) // 3*96/2.54 ≈ 113.4
    }
    
    @Test("Converting to the same unit returns the same value")
    func testSameUnitConversion() {
        let dpi = Resolution.dpi(300)
        let toDpi = dpi.converted(to: .dpi)
        
        #expect(toDpi == dpi) // Should be the same instance
        #expect(toDpi.value == 300)
        #expect(toDpi.unit == .dpi)
    }
    
    @Test("Resolution.Unit conforms to Hashable")
    func testUnitHashable() {
        #expect(Resolution.Unit.dpi == Resolution.Unit.dpi)
        #expect(Resolution.Unit.dpi != Resolution.Unit.dpcm)
        #expect(Resolution.Unit.dppx == Resolution.Unit.dppx)
        #expect(Resolution.Unit.x == Resolution.Unit.x)
        #expect(Resolution.Unit.dppx != Resolution.Unit.x) // They're different cases despite being functionally the same
    }
    
//    @Test("Preconditions are enforced")
//    func testPreconditions() {
//        #expect(throws: {
//            _ = Resolution(-1, unit: .dpi)
//        })
//        
//        #expect(throws: {
//            _ = Resolution(0, unit: .dpcm)
//        })
//        
//        #expect(throws: {
//            _ = Resolution.dppx(-2)
//        })
//    }
}
