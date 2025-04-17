//
//  HexColor Tests.swift
//  
//
//  Created on 03/26/2025.
//

import CSSTypeTypes
import Testing

@Suite("HexColor Tests")
struct HexColorTests {
    
    @Test("Basic hex color values render correctly")
    func testBasicHexColors() {
        #expect(HexColor("#ff0000").description == "#ff0000") // Red
        #expect(HexColor("#00ff00").description == "#00ff00") // Green
        #expect(HexColor("#0000ff").description == "#0000ff") // Blue
        #expect(HexColor("#000000").description == "#000000") // Black
        #expect(HexColor("#ffffff").description == "#ffffff") // White
    }
    
    @Test("Short hex color values render correctly")
    func testShortHexColors() {
        #expect(HexColor("#f00").description == "#f00") // Red
        #expect(HexColor("#0f0").description == "#0f0") // Green
        #expect(HexColor("#00f").description == "#00f") // Blue
        #expect(HexColor("#000").description == "#000") // Black
        #expect(HexColor("#fff").description == "#fff") // White
    }
    
    @Test("Hex color values with alpha render correctly")
    func testHexColorsWithAlpha() {
        #expect(HexColor("#ff0000ff").description == "#ff0000ff") // Fully opaque red
        #expect(HexColor("#00ff0080").description == "#00ff0080") // Semi-transparent green
        #expect(HexColor("#0000ff00").description == "#0000ff00") // Fully transparent blue
    }
    
    @Test("Short hex color values with alpha render correctly")
    func testShortHexColorsWithAlpha() {
        #expect(HexColor("#f00f").description == "#f00f") // Fully opaque red
        #expect(HexColor("#0f08").description == "#0f08") // Semi-transparent green
        #expect(HexColor("#00f0").description == "#00f0") // Fully transparent blue
    }
    
    @Test("Missing # prefix is automatically added")
    func testMissingPrefix() {
        #expect(HexColor("ff0000").description == "#ff0000")
        #expect(HexColor("f00").description == "#f00")
    }
    
    @Test("RGB constructor creates correct hex color")
    func testRGBConstructor() {
        let red = HexColor.rgb(255, 0, 0)
        #expect(red.description == "#FF0000")
        
        let green = HexColor.rgb(0, 255, 0)
        #expect(green.description == "#00FF00")
        
        let blue = HexColor.rgb(0, 0, 255)
        #expect(blue.description == "#0000FF")
        
        let gray = HexColor.rgb(128, 128, 128)
        #expect(gray.description == "#808080")
    }
    
    @Test("RGB constructor clamps values to valid range")
    func testRGBConstructorClamping() {
        let overflowRed = HexColor.rgb(300, 0, 0)
        #expect(overflowRed.description == "#FF0000") // Clamped to 255
        
        let negativeGreen = HexColor.rgb(0, -50, 0)
        #expect(negativeGreen.description == "#000000") // Clamped to 0
    }
    
    @Test("RGBA constructor creates correct hex color with alpha")
    func testRGBAConstructor() {
        let opaqueRed = HexColor.rgba(255, 0, 0, 1.0)
        #expect(opaqueRed.description == "#FF0000FF")
        
        let semiTransparentGreen = HexColor.rgba(0, 255, 0, 0.5)
        #expect(semiTransparentGreen.description == "#00FF0080") // Alpha = 0.5 = 128 = 0x80
        
        let transparentBlue = HexColor.rgba(0, 0, 255, 0.0)
        #expect(transparentBlue.description == "#0000FF00")
    }
    
    @Test("RGBA constructor clamps alpha values to valid range")
    func testRGBAConstructorAlphaClamping() {
        let overflowAlpha = HexColor.rgba(255, 0, 0, 1.5)
        #expect(overflowAlpha.description == "#FF0000FF") // Alpha clamped to 1.0
        
        let negativeAlpha = HexColor.rgba(0, 255, 0, -0.5)
        #expect(negativeAlpha.description == "#00FF0000") // Alpha clamped to 0.0
    }
    
    @Test("HexColor isValid method works correctly")
    func testIsValidMethod() {
        // Valid formats
        #expect(HexColor("#f00").isValid == true) // 3 digits
        #expect(HexColor("#f00f").isValid == true) // 4 digits
        #expect(HexColor("#ff0000").isValid == true) // 6 digits
        #expect(HexColor("#ff0000ff").isValid == true) // 8 digits
        
        // Invalid formats
        #expect(HexColor("#f0").isValid == false) // 2 digits
        #expect(HexColor("#f0000").isValid == false) // 5 digits
        #expect(HexColor("#f00000000").isValid == false) // 9 digits
        #expect(HexColor("no-prefix").isValid == false) // No # prefix
    }
    
    @Test("HexColor conforms to Hashable")
    func testHashable() {
        let red1 = HexColor("#ff0000")
        let red2 = HexColor("#ff0000")
        let blue = HexColor("#0000ff")
        
        #expect(red1 == red2)
        #expect(red1 != blue)
        
        // Different syntax for same color
        let redLowercase = HexColor("#ff0000")
        let redUppercase = HexColor("#FF0000")
        #expect(redLowercase != redUppercase) // String comparison so these are different
    }
}
