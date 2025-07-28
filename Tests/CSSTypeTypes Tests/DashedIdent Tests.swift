//
//  DashedIdent Tests.swift
//  
//
//  Created on 04/02/2025.
//

import CSSTypeTypes
import Testing

@Suite("DashedIdent Tests")
struct DashedIdentTests {

    @Test("DashedIdent initializer creates proper instances")
    func testInitializer() {
        // Test with existing dashes
        let identWithDashes = DashedIdent("--primary-color")
        #expect(identWithDashes.description == "--primary-color")

        // Test that dashes are added if missing
        let identWithoutDashes = DashedIdent("secondary-color")
        #expect(identWithoutDashes.description == "--secondary-color")
    }

    @Test("Static custom() creates proper instances")
    func testCustomFactory() {
        // Test with existing dashes
        let customWithDashes = DashedIdent.custom("--brand-blue")
        #expect(customWithDashes.description == "--brand-blue")

        // Test that dashes are added if missing
        let customWithoutDashes = DashedIdent.custom("brand-red")
        #expect(customWithoutDashes.description == "--brand-red")
    }

    @Test("var() functions create proper CSS var() references")
    func testVarFunctions() {
        // Simple var() function
        let simpleVar = DashedIdent.var(DashedIdent("--theme-color"))
        #expect(simpleVar == "var(--theme-color)")

        // var() with fallback
        let varWithFallback = DashedIdent.var(DashedIdent("--accent-color"), fallback: "blue")
        #expect(varWithFallback == "var(--accent-color, blue)")

        // Handling missing dashes in var name
        let varFixedDashes = DashedIdent.var(DashedIdent("theme-font"))
        #expect(varFixedDashes == "var(--theme-font)")
    }

    @Test("DashedIdent conforms to ExpressibleByStringLiteral")
    func testStringLiteralInitialization() {
        let stringLiteral: DashedIdent = "--spacing"
        #expect(stringLiteral.description == "--spacing")

        // Dashes are added with string literal too
        let fixedStringLiteral: DashedIdent = "margin"
        #expect(fixedStringLiteral.description == "--margin")
    }

    @Test("DashedIdent conforms to Hashable")
    func testHashable() {
        // Same values should be equal
        let ident1 = DashedIdent("--primary")
        let ident2 = DashedIdent("--primary")
        #expect(ident1 == ident2)

        // Different values should not be equal
        let ident3 = DashedIdent("--secondary")
        #expect(ident1 != ident3)

        // Values with and without dashes should be equal after initialization fixes them
        let withDashes = DashedIdent("--color")
        let withoutDashes = DashedIdent("color")
        #expect(withDashes == withoutDashes)
    }

    @Test("DashedIdent is used correctly in CSS properties context")
    func testUsageInContext() {
        // Using as custom property declaration
        let customProp = "--header-height: 60px;"
        #expect(customProp == "\(DashedIdent("--header-height")): 60px;")

        // Using in var() function
        let usingVar = "color: var(--text-color);"
        #expect(usingVar == "color: \(DashedIdent.var(DashedIdent("--text-color")));")

        // Using with fallback
        let withFallback = "background-color: var(--bg-color, #f5f5f5);"
        #expect(withFallback == "background-color: \(DashedIdent.var(DashedIdent("--bg-color"), fallback: "#f5f5f5"));")
    }
}
