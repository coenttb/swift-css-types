//
//  BlendMode Tests.swift
//
//
//  Created on 03/26/2025.
//

import CSSTypeTypes
import Testing

@Suite("BlendMode Tests")
struct BlendModeTests {

    @Test("Basic blend mode values render correctly")
    func testBasicBlendModes() {
        #expect(BlendMode.normal.description == "normal")
        #expect(BlendMode.multiply.description == "multiply")
        #expect(BlendMode.screen.description == "screen")
        #expect(BlendMode.overlay.description == "overlay")
        #expect(BlendMode.darken.description == "darken")
        #expect(BlendMode.lighten.description == "lighten")
    }

    @Test("Compound blend mode values render correctly")
    func testCompoundBlendModes() {
        #expect(BlendMode.colorDodge.description == "color-dodge")
        #expect(BlendMode.colorBurn.description == "color-burn")
        #expect(BlendMode.hardLight.description == "hard-light")
        #expect(BlendMode.softLight.description == "soft-light")
    }

    @Test("Special blend mode values render correctly")
    func testSpecialBlendModes() {
        #expect(BlendMode.difference.description == "difference")
        #expect(BlendMode.exclusion.description == "exclusion")
        #expect(BlendMode.hue.description == "hue")
        #expect(BlendMode.saturation.description == "saturation")
        #expect(BlendMode.color.description == "color")
        #expect(BlendMode.luminosity.description == "luminosity")
    }

    @Test("BlendMode raw values are correct")
    func testRawValues() {
        #expect(BlendMode.normal.rawValue == "normal")
        #expect(BlendMode.colorDodge.rawValue == "color-dodge")
        #expect(BlendMode.hardLight.rawValue == "hard-light")
    }

    @Test("BlendMode initialization from raw value works correctly")
    func testRawValueInitializer() {
        let normal = BlendMode(rawValue: "normal")
        #expect(normal == BlendMode.normal)

        let colorDodge = BlendMode(rawValue: "color-dodge")
        #expect(colorDodge == BlendMode.colorDodge)

        // Invalid raw value
        let invalid = BlendMode(rawValue: "invalid")
        #expect(invalid == nil)
    }

    @Test("BlendMode conforms to Hashable")
    func testHashable() {
        let normal1 = BlendMode.normal
        let normal2 = BlendMode.normal
        let multiply = BlendMode.multiply

        #expect(normal1 == normal2)
        #expect(normal1 != multiply)
        #expect(BlendMode.hue != BlendMode.saturation)
    }
}
