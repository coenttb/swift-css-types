//
//  Color Tests.swift
//  
//
//  Created on 04/02/2025.
//

import CSSTypeTypes
import Testing

@Suite("Color Tests")
struct ColorTests {

    @Test("Color.named renders correctly")
    func testNamedColors() {
        #expect(Color.named(.red).description == "red")
        #expect(Color.named(.blue).description == "blue")
        #expect(Color.named(.transparent).description == "transparent")
        #expect(Color.named(.currentColor).description == "currentColor")
    }

    @Test("Color.hex renders correctly")
    func testHexColors() {
        #expect(Color.hex(HexColor("#ff0000")).description == "#ff0000")
        #expect(Color.hex(HexColor("#00f")).description == "#00f")
    }

    @Test("Color.rgb renders correctly")
    func testRgbColors() {
        #expect(Color.rgb(255, 0, 0).description == "rgb(255, 0, 0)")
        #expect(Color.rgb(0, 128, 255).description == "rgb(0, 128, 255)")
    }

    @Test("Color.rgba renders correctly")
    func testRgbaColors() {
        #expect(Color.rgba(255, 0, 0, 1.0).description == "rgba(255, 0, 0, 1)")
        #expect(Color.rgba(0, 128, 255, 0.5).description == "rgba(0, 128, 255, 0.5)")
    }

    @Test("Color.hsl renders correctly")
    func testHslColors() {
        #expect(Color.hsl(.deg(0), 100, 50).description == "hsl(0deg, 100%, 50%)")
        #expect(Color.hsl(.turn(0.5), 75, 25).description == "hsl(0.5turn, 75%, 25%)")
    }

    @Test("Color.hsla renders correctly")
    func testHslaColors() {
        #expect(Color.hsla(.deg(0), 100, 50, 1.0).description == "hsla(0deg, 100%, 50%, 1)")
        #expect(Color.hsla(.rad(3.14), 75, 25, 0.5).description == "hsla(3.14rad, 75%, 25%, 0.5)")
    }

    @Test("Color.hwb renders correctly")
    func testHwbColors() {
        #expect(Color.hwb(.deg(0), 10, 0).description == "hwb(0deg 10% 0%)")
        #expect(Color.hwb(.turn(0.5), 25, 25).description == "hwb(0.5turn 25% 25%)")
    }

    @Test("Modern color formats render correctly")
    func testModernColorFormats() {
        #expect(Color.lab(50, 20, -40).description == "lab(50% 20 -40)")
        #expect(Color.lch(50, 30, 40).description == "lch(50% 30 40)")
        #expect(Color.oklab(0.5, 0.1, -0.2).description == "oklab(0.5 0.1 -0.2)")
        #expect(Color.oklch(0.5, 0.2, 240).description == "oklch(0.5 0.2 240)")
    }

    @Test("Color.mix renders correctly")
    func testColorMix() {
        let mix1 = Color.mix(.rectangular(.srgb), .named(.red), .named(.blue))
        #expect(mix1.description == "color-mix(in srgb, red, blue)")

        let mix2 = Color.mix(.polar(.hsl), .rgb(255, 0, 0), .rgb(0, 0, 255), 25)
        #expect(mix2.description == "color-mix(in hsl, rgb(255, 0, 0), rgb(0, 0, 255) 25%)")
    }

    @Test("Special color values render correctly")
    func testSpecialColors() {
        #expect(Color.currentColor.description == "currentColor")
        #expect(Color.transparent.description == "transparent")
        #expect(Color.system(.canvas).description == "Canvas")
    }

    @Test("Color constants are available")
    func testColorConstants() {
        #expect(Color.named(.red).description == "red")
        #expect(Color.named(.black).description == "black")
        #expect(Color.named(.white).description == "white")
        #expect(Color.named(.current).description == "currentColor")
    }

    @Test("Color conforms to Hashable")
    func testHashable() {
        #expect(Color.named(.red) == Color.named(.red))
        #expect(Color.rgb(255, 0, 0) != Color.rgb(254, 0, 0))
        #expect(Color.rgba(0, 0, 255, 1.0) != Color.rgba(0, 0, 255, 0.9))
    }

    @Test("Static factory methods create correct colors")
    func testFactoryMethods() {
        #expect(Color.hex("#ff0000").description == "#ff0000")
        #expect(Color.rgb(red: 255, green: 0, blue: 0).description == "rgb(255, 0, 0)")
        #expect(Color.rgba(red: 0, green: 255, blue: 0, alpha: 0.5).description == "rgba(0, 255, 0, 0.5)")
        #expect(Color.hsl(hue: .deg(120), saturation: 100, lightness: 50).description == "hsl(120deg, 100%, 50%)")
    }
}
