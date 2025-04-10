//
//  ColorInterpolationMethod Tests.swift
//  
//
//  Created on 04/02/2025.
//

import CSSTypeTypes
import Testing

@Suite("ColorInterpolationMethod Tests")
struct ColorInterpolationMethodTests {
    
    @Test("Rectangular color spaces render correctly")
    func testRectangularColorSpaces() {
        #expect(ColorInterpolationMethod.rectangular(.srgb).description == "in srgb")
        #expect(ColorInterpolationMethod.rectangular(.srgbLinear).description == "in srgb-linear")
        #expect(ColorInterpolationMethod.rectangular(.displayP3).description == "in display-p3")
        #expect(ColorInterpolationMethod.rectangular(.a98rgb).description == "in a98-rgb")
        #expect(ColorInterpolationMethod.rectangular(.prophotoRgb).description == "in prophoto-rgb")
        #expect(ColorInterpolationMethod.rectangular(.rec2020).description == "in rec2020")
        #expect(ColorInterpolationMethod.rectangular(.lab).description == "in lab")
        #expect(ColorInterpolationMethod.rectangular(.oklab).description == "in oklab")
        #expect(ColorInterpolationMethod.rectangular(.xyz).description == "in xyz")
        #expect(ColorInterpolationMethod.rectangular(.xyzD50).description == "in xyz-d50")
        #expect(ColorInterpolationMethod.rectangular(.xyzD65).description == "in xyz-d65")
    }
    
    @Test("Polar color spaces without hue method render correctly")
    func testPolarColorSpacesWithoutHue() {
        #expect(ColorInterpolationMethod.polar(.hsl).description == "in hsl")
        #expect(ColorInterpolationMethod.polar(.hwb).description == "in hwb")
        #expect(ColorInterpolationMethod.polar(.lch).description == "in lch")
        #expect(ColorInterpolationMethod.polar(.oklch).description == "in oklch")
    }
    
    @Test("Polar color spaces with hue method render correctly")
    func testPolarColorSpacesWithHue() {
        #expect(ColorInterpolationMethod.polar(.hsl, .shorter).description == "in hsl shorter hue")
        #expect(ColorInterpolationMethod.polar(.hwb, .longer).description == "in hwb longer hue")
        #expect(ColorInterpolationMethod.polar(.lch, .increasing).description == "in lch increasing hue")
        #expect(ColorInterpolationMethod.polar(.oklch, .decreasing).description == "in oklch decreasing hue")
    }
    
    @Test("Custom color profile renders correctly")
    func testCustomColorProfile() {
        let customProfile = CSSString("my-custom-profile")
        #expect(ColorInterpolationMethod.custom(customProfile).description == "in 'my-custom-profile'")
    }
    
    @Test("ColorInterpolationMethod conforms to Equatable")
    func testEquatable() {
        // Same type and values should be equal
        #expect(ColorInterpolationMethod.rectangular(.srgb) == ColorInterpolationMethod.rectangular(.srgb))
        #expect(ColorInterpolationMethod.polar(.hsl) == ColorInterpolationMethod.polar(.hsl))
        #expect(ColorInterpolationMethod.polar(.hsl, .shorter) == ColorInterpolationMethod.polar(.hsl, .shorter))
        
        // Different types should not be equal
        #expect(ColorInterpolationMethod.rectangular(.srgb) != ColorInterpolationMethod.polar(.hsl))
        
        // Same type but different values should not be equal
        #expect(ColorInterpolationMethod.rectangular(.srgb) != ColorInterpolationMethod.rectangular(.lab))
        #expect(ColorInterpolationMethod.polar(.hsl) != ColorInterpolationMethod.polar(.hwb))
        #expect(ColorInterpolationMethod.polar(.hsl, .shorter) != ColorInterpolationMethod.polar(.hsl, .longer))
        
        // Custom profiles should compare by value
        let profile1 = CSSString("profile1")
        let profile2 = CSSString("profile2")
        #expect(ColorInterpolationMethod.custom(profile1) == ColorInterpolationMethod.custom(profile1))
        #expect(ColorInterpolationMethod.custom(profile1) != ColorInterpolationMethod.custom(profile2))
    }
}
