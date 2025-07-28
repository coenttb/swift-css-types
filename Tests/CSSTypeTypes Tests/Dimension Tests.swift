//
//  Dimension Tests.swift
//  
//
//  Created on 04/02/2025.
//

import CSSTypeTypes
import Testing

@Suite("Dimension Tests")
struct DimensionTests {

    @Test("GenericDimension initializer creates proper instances with Double values")
    func testDoubleInitializer() {
        let pixelValue = GenericDimension(20.5, unit: "px")
        #expect(pixelValue.value == 20.5)
        #expect(pixelValue.unit == "px")
        #expect(pixelValue.description == "20.5px")

        let emValue = GenericDimension(1.75, unit: "em")
        #expect(emValue.value == 1.75)
        #expect(emValue.unit == "em")
        #expect(emValue.description == "1.75em")

        let percentValue = GenericDimension(50, unit: "%")
        #expect(percentValue.value == 50)
        #expect(percentValue.unit == "%")
        #expect(percentValue.description == "50%")
    }

    @Test("GenericDimension initializer creates proper instances with Int values")
    func testIntInitializer() {
        let pixelValue = GenericDimension(20, unit: "px")
        #expect(pixelValue.value == 20)
        #expect(pixelValue.unit == "px")
        #expect(pixelValue.description == "20px")

        let emValue = GenericDimension(2, unit: "em")
        #expect(emValue.value == 2)
        #expect(emValue.unit == "em")
        #expect(emValue.description == "2em")

        let vwValue = GenericDimension(100, unit: "vw")
        #expect(vwValue.value == 100)
        #expect(vwValue.unit == "vw")
        #expect(vwValue.description == "100vw")
    }

    @Test("GenericDimension handles truncating remainders correctly")
    func testTruncatingRemainder() {
        // Integer values should not show decimal point
        let integerValue = GenericDimension(10, unit: "px")
        #expect(integerValue.description == "10px")

        // Values with decimals should show decimals
        let decimalValue = GenericDimension(10.5, unit: "em")
        #expect(decimalValue.description == "10.5em")

        // Values with trailing zeros should truncate them
        let trailingZeros = GenericDimension(15.0, unit: "vh")
        #expect(trailingZeros.description == "15vh")

        // Small decimal values should work correctly
        let smallDecimal = GenericDimension(0.25, unit: "em")
        #expect(smallDecimal.description == "0.25em")
    }

    @Test("GenericDimension conforms to Hashable")
    func testHashable() {
        // Same values and units should be equal
        let dim1 = GenericDimension(10, unit: "px")
        let dim2 = GenericDimension(10, unit: "px")
        #expect(dim1 == dim2)

        // Different values should not be equal
        let dim3 = GenericDimension(20, unit: "px")
        #expect(dim1 != dim3)

        // Different units should not be equal even with same value
        let dim4 = GenericDimension(10, unit: "em")
        #expect(dim1 != dim4)

        // Double and Int with same value should be equal
        let dim5 = GenericDimension(10.0, unit: "px")
        #expect(dim1 == dim5)
    }

    @Test("GenericDimension is used correctly in CSS properties context")
    func testUsageInContext() {
        // Using in width property
        let width = "width: \(GenericDimension(200, unit: "px"))"
        #expect(width == "width: 200px")

        // Using in margin property
        let margin = "margin: \(GenericDimension(1.5, unit: "rem"))"
        #expect(margin == "margin: 1.5rem")

        // Using in multiple contexts
        let combined = "padding: \(GenericDimension(10, unit: "px")) \(GenericDimension(20, unit: "px"))"
        #expect(combined == "padding: 10px 20px")

        // Using with percentage
        let percentage = "width: \(GenericDimension(75, unit: "%"))"
        #expect(percentage == "width: 75%")
    }

    @Test("GenericDimension handles various CSS dimension units")
    func testVariousUnits() {
        // Absolute length units
        #expect(GenericDimension(10, unit: "px").description == "10px")
        #expect(GenericDimension(1, unit: "cm").description == "1cm")
        #expect(GenericDimension(10, unit: "mm").description == "10mm")
        #expect(GenericDimension(1, unit: "in").description == "1in")
        #expect(GenericDimension(10, unit: "pt").description == "10pt")
        #expect(GenericDimension(2, unit: "pc").description == "2pc")

        // Relative length units
        #expect(GenericDimension(1.5, unit: "em").description == "1.5em")
        #expect(GenericDimension(2, unit: "rem").description == "2rem")
        #expect(GenericDimension(8, unit: "ex").description == "8ex")
        #expect(GenericDimension(20, unit: "ch").description == "20ch")
        #expect(GenericDimension(50, unit: "vw").description == "50vw")
        #expect(GenericDimension(75, unit: "vh").description == "75vh")
        #expect(GenericDimension(80, unit: "vmin").description == "80vmin")
        #expect(GenericDimension(90, unit: "vmax").description == "90vmax")

        // Percentage
        #expect(GenericDimension(42, unit: "%").description == "42%")

        // Time units
        #expect(GenericDimension(2, unit: "s").description == "2s")
        #expect(GenericDimension(500, unit: "ms").description == "500ms")

        // Frequency units
        #expect(GenericDimension(44100, unit: "Hz").description == "44100Hz")
        #expect(GenericDimension(15, unit: "kHz").description == "15kHz")

        // Resolution units
        #expect(GenericDimension(300, unit: "dpi").description == "300dpi")
        #expect(GenericDimension(2, unit: "dpcm").description == "2dpcm")
        #expect(GenericDimension(96, unit: "dppx").description == "96dppx")
    }
}
