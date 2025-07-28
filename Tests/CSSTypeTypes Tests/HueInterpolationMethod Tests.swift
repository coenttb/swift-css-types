//
//  HueInterpolationMethod Tests.swift
//  
//
//  Created on 04/02/2025.
//

import CSSTypeTypes
import Testing

@Suite("HueInterpolationMethod Tests")
struct HueInterpolationMethodTests {

    @Test("HueInterpolationMethod enum cases render correctly")
    func testHueInterpolationMethodValues() {
        #expect(HueInterpolationMethod.shorter.description == "shorter hue")
        #expect(HueInterpolationMethod.longer.description == "longer hue")
        #expect(HueInterpolationMethod.increasing.description == "increasing hue")
        #expect(HueInterpolationMethod.decreasing.description == "decreasing hue")
    }

    @Test("HueInterpolationMethod enum conforms to Hashable")
    func testHashable() {
        let shorter1 = HueInterpolationMethod.shorter
        let shorter2 = HueInterpolationMethod.shorter
        let longer = HueInterpolationMethod.longer

        #expect(shorter1 == shorter2)
        #expect(shorter1 != longer)
        #expect(HueInterpolationMethod.increasing != HueInterpolationMethod.decreasing)
    }

    @Test("HueInterpolationMethod raw values match CSS specifications")
    func testRawValuesMatchSpec() {
        #expect(HueInterpolationMethod.shorter.rawValue == "shorter hue")
        #expect(HueInterpolationMethod.longer.rawValue == "longer hue")
        #expect(HueInterpolationMethod.increasing.rawValue == "increasing hue")
        #expect(HueInterpolationMethod.decreasing.rawValue == "decreasing hue")
    }

    @Test("HueInterpolationMethod is used correctly in color interpolation context")
    func testUsageInColorInterpolationContext() {
        // Create sample CSS gradient string using HueInterpolationMethod
        let gradient = "linear-gradient(in hsl \(HueInterpolationMethod.shorter), red, blue)"
        #expect(gradient == "linear-gradient(in hsl shorter hue, red, blue)")

        let colorMix = "color-mix(in oklch \(HueInterpolationMethod.longer), teal, gold)"
        #expect(colorMix == "color-mix(in oklch longer hue, teal, gold)")
    }
}
