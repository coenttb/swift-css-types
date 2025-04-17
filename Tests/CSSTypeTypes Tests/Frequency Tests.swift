//
//  Frequency Tests.swift
//  
//
//  Created on 03/26/2025.
//

import CSSTypeTypes
import Testing

@Suite("Frequency Tests")
struct FrequencyTests {
    
    @Test("Hertz frequency values render correctly")
    func testHertzValues() {
        #expect(Frequency.hz(440).description == "440Hz")
        #expect(Frequency.hz(0).description == "0Hz")
        #expect(Frequency.hz(1000).description == "1000Hz")
        
        // Floating point values
        #expect(Frequency.hz(123.5).description == "123.5Hz")
        #expect(Frequency.hz(123.0).description == "123Hz") // Should truncate trailing zeros
    }
    
    @Test("Kilohertz frequency values render correctly")
    func testKilohertzValues() {
        #expect(Frequency.khz(2.5).description == "2.5kHz")
        #expect(Frequency.khz(0).description == "0kHz")
        #expect(Frequency.khz(5).description == "5kHz")
        
        // Floating point values
        #expect(Frequency.khz(1.75).description == "1.75kHz")
        #expect(Frequency.khz(3.0).description == "3kHz") // Should truncate trailing zeros
    }
    
    @Test("Integer constructor convenience methods work correctly")
    func testIntegerConstructors() {
        let intHz = Frequency.hz(440)
        let doubleHz = Frequency.hz(440.0)
        #expect(intHz == doubleHz)
        #expect(intHz.description == doubleHz.description)
        
        let intKhz = Frequency.khz(5)
        let doubleKhz = Frequency.khz(5.0)
        #expect(intKhz == doubleKhz)
        #expect(intKhz.description == doubleKhz.description)
    }
    
    @Test("Frequency conforms to Hashable")
    func testHashable() {
        let freq1 = Frequency.hz(440)
        let freq2 = Frequency.hz(440)
        let freq3 = Frequency.hz(880)
        
        #expect(freq1 == freq2)
        #expect(freq1 != freq3)
        
        // Different units should not be equal even if they represent the same frequency
        let hzFreq = Frequency.hz(1000)
        let khzFreq = Frequency.khz(1)
        #expect(hzFreq != khzFreq)
    }
}
