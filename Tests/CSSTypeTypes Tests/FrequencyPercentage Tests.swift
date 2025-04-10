//
//  FrequencyPercentage Tests.swift
//  
//
//  Created on 03/26/2025.
//

import CSSTypeTypes
import Testing

@Suite("FrequencyPercentage Tests")
struct FrequencyPercentageTests {
    
    @Test("Frequency-based values render correctly")
    func testFrequencyValues() {
        #expect(FrequencyPercentage.hz(440).description == "440Hz")
        #expect(FrequencyPercentage.khz(2.5).description == "2.5kHz")
        
        // Using the case constructor
        let customFreq = FrequencyPercentage.frequency(.hz(100))
        #expect(customFreq.description == "100Hz")
    }
    
    @Test("Percentage-based values render correctly")
    func testPercentageValues() {
        #expect(FrequencyPercentage.percentage(75).description == "75%")
        #expect(FrequencyPercentage.percentage(100).description == "100%")
        #expect(FrequencyPercentage.percentage(0).description == "0%")
        
        // Using the case constructor
        let customPercentage = FrequencyPercentage.percentage(33.3)
        #expect(customPercentage.description == "33.3%")
    }
    
    @Test("Integer constructor convenience methods work correctly")
    func testIntegerConstructors() {
        let intHz = FrequencyPercentage.hz(440)
        let doubleHz = FrequencyPercentage.hz(440.0)
        #expect(intHz == doubleHz)
        
        let intKhz = FrequencyPercentage.khz(2)
        let doubleKhz = FrequencyPercentage.khz(2.0)
        #expect(intKhz == doubleKhz)
        
        let intPercent = FrequencyPercentage.percentage(50)
        let doublePercent = FrequencyPercentage.percentage(50.0)
        #expect(intPercent == doublePercent)
    }
    
    @Test("FrequencyPercentage conforms to Equatable")
    func testEquatable() {
        let freq1 = FrequencyPercentage.hz(440)
        let freq2 = FrequencyPercentage.hz(440)
        let freq3 = FrequencyPercentage.hz(880)
        
        #expect(freq1 == freq2)
        #expect(freq1 != freq3)
        
        let percent1 = FrequencyPercentage.percentage(75)
        let percent2 = FrequencyPercentage.percentage(75)
        let percent3 = FrequencyPercentage.percentage(50)
        
        #expect(percent1 == percent2)
        #expect(percent1 != percent3)
        
        // Different types (frequency vs percentage) should never be equal
        #expect(freq1 != percent1)
    }
    
    @Test("Floating point values render correctly")
    func testFloatingPointValues() {
        let floatHz = FrequencyPercentage.hz(440.5)
        #expect(floatHz.description == "440.5Hz")
        
        let roundHz = FrequencyPercentage.hz(440.0)
        #expect(roundHz.description == "440Hz") // Should truncate trailing zeros
        
        let floatPercent = FrequencyPercentage.percentage(75.5)
        #expect(floatPercent.description == "75.5%")
        
        let roundPercent = FrequencyPercentage.percentage(75.0)
        #expect(roundPercent.description == "75%") // Should truncate trailing zeros
    }
}
