//
//  AccentColor Tests.swift
//
//
//  Created on 03/28/2025.
//

import CSSPropertyTypes
import CSSTypeTypes
import Testing

@Suite("AccentColor Tests")
struct AccentColorTests {

    @Test("AccentColor renders its Declaration correctly")
    func testDeclaration() {
        #expect(AccentColor.auto.declaration.description == "accent-color:auto")
    }

    @Test("AccentColor renders auto value correctly")
    func testAutoValue() {
        #expect(AccentColor.auto.description == "auto")
    }

    @Test("AccentColor renders specific color values correctly")
    func testColorValues() {
        #expect(AccentColor.named(.red).description == "red")
        #expect(AccentColor.red.description == "red")
        #expect(AccentColor.hex("#5729e9").description == "#5729e9")
        #expect(AccentColor.rgb(0, 200, 0).description == "rgb(0, 200, 0)")
        #expect(AccentColor.hsl(250, 100, 34).description == "hsl(250, 100%, 34%)")
    }

    @Test("AccentColor renders global values correctly")
    func testGlobalValues() {
        #expect(AccentColor.inherit.description == "inherit")
        #expect(AccentColor.initial.description == "initial")
        #expect(AccentColor.revert.description == "revert")
        #expect(AccentColor.revertLayer.description == "revert-layer")
        #expect(AccentColor.unset.description == "unset")
    }

    @Test("AccentColor conforms to ColorConvertible")
    func testColorConvertible() {
        let color = CSSTypeTypes.Color.named(.blue)
        let accentColor = AccentColor.color(color)
        #expect(accentColor.description == color.description)
    }
}
