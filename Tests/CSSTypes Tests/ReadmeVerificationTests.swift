//
//  ReadmeVerificationTests.swift
//  swift-css-types
//
//  Created by automated README verification
//

import Testing
import CSSTypeTypes
import CSSPropertyTypes
import CSSAtRuleTypes

// Type aliases to disambiguate between value types and property types
typealias ColorValue = CSSTypeTypes.Color
typealias ColorProperty = CSSPropertyTypes.Color

/// Tests that verify all README code examples compile and work correctly.
/// Each test corresponds to a code block in the README.
@Suite("README Verification Tests")
struct ReadmeVerificationTests {

    // MARK: - Quick Start Examples (lines 40-57)

    @Test("README Quick Start: Color values")
    func quickStartColors() {
        let red: ColorValue = .rgb(255, 0, 0)
        let blueTransparent: ColorValue = .rgba(100, 149, 237, 0.5)
        let green: ColorValue = .hex("#00ff00")

        #expect(red.description.contains("255"))
        #expect(blueTransparent.description.contains("0.5"))
        #expect(green.description.contains("00ff00"))
    }

    @Test("README Quick Start: Length values")
    func quickStartLengths() {
        let fontSize: Length = .px(24)
        let margin: Length = .rem(2)
        let width: LengthPercentage = .percentage(50)

        #expect(fontSize.description.contains("24"))
        #expect(margin.description.contains("2"))
        #expect(width.description.contains("50"))
    }

    @Test("README Quick Start: CSS property types")
    func quickStartProperties() {
        let bgColor: BackgroundColor = .init(.named(.blue))
        let fontSizeProp: FontSize = .init(.px(16))

        #expect(bgColor.description.contains("blue"))
        #expect(fontSizeProp.description.contains("16"))
    }

    // MARK: - Working with CSS Types Examples (lines 65-85)

    @Test("README Usage: CSS color types")
    func usageColors() {
        let namedColor: ColorValue = .named(.red)
        let hexColor: ColorValue = .hex("#ff0000")
        let rgbColor: ColorValue = .rgb(255, 0, 0)
        let hslColor: ColorValue = .hsl(.degrees(0), 100, 50)

        #expect(namedColor.description.contains("red"))
        #expect(hexColor.description.contains("ff0000"))
        #expect(rgbColor.description.contains("255"))
        #expect(hslColor.description.contains("hsl"))
    }

    @Test("README Usage: Length and dimension types")
    func usageLengths() {
        let pixels: Length = .px(16)
        let rems: Length = .rem(1.5)
        let viewportWidth: Length = .vw(50)
        let calc: Length = .calc("100% - 20px")

        #expect(pixels.description.contains("16"))
        #expect(rems.description.contains("1.5"))
        #expect(viewportWidth.description.contains("50"))
        #expect(calc.description.contains("calc"))
    }

    @Test("README Usage: Angle types")
    func usageAngles() {
        let degrees: Angle = .deg(45)
        let radians: Angle = .rad(1.57)

        #expect(degrees.description.contains("45"))
        #expect(radians.description.contains("1.57"))
    }

    @Test("README Usage: Time types")
    func usageTimes() {
        let seconds: Time = .s(2)
        let milliseconds: Time = .ms(500)

        #expect(seconds.description.contains("2"))
        #expect(milliseconds.description.contains("500"))
    }

    // MARK: - Working with CSS Properties Examples (lines 92-107)

    @Test("README Usage: Background properties")
    func usageBackgroundProperties() {
        let bgColor = BackgroundColor(.hex("#f0f0f0"))
        let bgImage = BackgroundImage(.url("image.png"))

        #expect(bgColor.description.contains("f0f0f0"))
        #expect(bgImage.description.contains("image.png"))
    }

    @Test("README Usage: Text properties")
    func usageTextProperties() {
        let textColor = ColorProperty.color(.rgb(50, 50, 50))
        let fontSize = FontSize(.rem(1.2))
        let lineHeight: LineHeight = 1.5

        #expect(textColor.description.contains("50"))
        #expect(fontSize.description.contains("1.2"))
        #expect(lineHeight.description.contains("1.5"))
    }

    @Test("README Usage: Layout properties")
    func usageLayoutProperties() {
        let display = Display.flex
        let width = Width(.percentage(100))
        let padding = Padding(.px(16))

        #expect(display.description.contains("flex"))
        #expect(width.description.contains("100"))
        #expect(padding.description.contains("16"))
    }

    // MARK: - Working with Media Queries Examples (lines 112-129)

    @Test("README Usage: Basic media queries")
    func usageBasicMediaQueries() {
        let screenQuery = Media.screen
        let printQuery = Media.print

        #expect(screenQuery.rawValue.contains("screen"))
        #expect(printQuery.rawValue.contains("print"))
    }

    @Test("README Usage: Feature queries")
    func usageFeatureQueries() {
        let darkMode = Media.prefersColorScheme(.dark)
        let wideScreen = Media.minWidth(.px(1024))

        #expect(darkMode.rawValue.contains("prefers-color-scheme"))
        #expect(wideScreen.rawValue.contains("1024"))
    }

    @Test("README Usage: Combined media queries")
    func usageCombinedMediaQueries() {
        let responsiveDark = Media.screen
            .and(Media.minWidth(.px(768)))
            .and(Media.prefersColorScheme(.dark))

        #expect(responsiveDark.rawValue.contains("screen"))
        #expect(responsiveDark.rawValue.contains("768"))
        #expect(responsiveDark.rawValue.contains("prefers-color-scheme"))
    }

    @Test("README Usage: Media query operators")
    func usageMediaQueryOperators() {
        let mobileOrTablet = Media.maxWidth(.px(768)) || Media.maxWidth(.px(1024))

        #expect(mobileOrTablet.rawValue.contains("768"))
        #expect(mobileOrTablet.rawValue.contains("1024"))
    }
}
