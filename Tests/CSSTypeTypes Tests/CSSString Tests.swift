//
//  CSSString Tests.swift
//  
//
//  Created on 04/02/2025.
//

import CSSTypeTypes
import Testing

@Suite("CSSString Tests")
struct CSSStringTests {

    @Test("CSSString initializer creates proper instances with default quotes")
    func testInitializerDefaultQuotes() {
        let cssString = CSSString("Hello, world!")
        #expect(cssString.value == "Hello, world!")
        #expect(cssString.quotes == .single)
        #expect(cssString.description == "'Hello, world!'")
    }

    @Test("CSSString initializer with single quotes")
    func testInitializerSingleQuotes() {
        let cssString = CSSString("Hello, world!", quotes: .single)
        #expect(cssString.value == "Hello, world!")
        #expect(cssString.quotes == .single)
        #expect(cssString.description == "'Hello, world!'")
    }

    @Test("CSSString initializer with double quotes")
    func testInitializerDoubleQuotes() {
        let cssString = CSSString("Hello, world!", quotes: .double)
        #expect(cssString.value == "Hello, world!")
        #expect(cssString.quotes == .double)
        #expect(cssString.description == "\"Hello, world!\"")
    }

    @Test("CSSString empty static constant")
    func testEmptyConstant() {
        #expect(CSSString.empty.value == "")
        #expect(CSSString.empty.description == "''")
    }

    @Test("CSSString string literal initialization")
    func testStringLiteralInitialization() {
        let literal: CSSString = "String literal"
        #expect(literal.value == "String literal")
        #expect(literal.description == "'String literal'")
    }

    @Test("CSSString string interpolation")
    func testStringInterpolation() {
        let name = "World"
        let interpolated: CSSString = "Hello, \(name)!"
        #expect(interpolated.value == "Hello, World!")
        #expect(interpolated.description == "'Hello, World!'")
    }

    @Test("CSSString properly escapes double quotes in double-quoted strings")
    func testEscapeDoubleQuotesInDoubleQuotedStrings() {
        let stringWithDoubleQuotes = CSSString("He said \"Hello!\"", quotes: .double)
        #expect(stringWithDoubleQuotes.description == "\"He said \\\"Hello!\\\"\"")
    }

    @Test("CSSString properly escapes single quotes in single-quoted strings")
    func testEscapeSingleQuotesInSingleQuotedStrings() {
        let stringWithSingleQuotes = CSSString("It's mine", quotes: .single)
        #expect(stringWithSingleQuotes.description == "'It\\'s mine'")
    }

    @Test("CSSString properly escapes backslashes")
    func testEscapeBackslashes() {
        let stringWithBackslashes = CSSString("C:\\Users\\Name", quotes: .single)
        #expect(stringWithBackslashes.description == "'C:\\\\Users\\\\Name'")
    }

    @Test("CSSString properly escapes newlines")
    func testEscapeNewlines() {
        let stringWithNewlines = CSSString("Line 1\nLine 2", quotes: .single)
        #expect(stringWithNewlines.description == "'Line 1\\A Line 2'")
    }

    @Test("CSSString handles complex escaping scenarios")
    func testComplexEscaping() {
        // String with multiple types of characters that need escaping
        let complexString = CSSString("This is a \"quoted\" string with 'apostrophes', a \\backslash\\ and\na newline", quotes: .double)
        #expect(complexString.description == "\"This is a \\\"quoted\\\" string with 'apostrophes', a \\\\backslash\\\\ and\\A a newline\"")

        // Same string but with single quotes
        let complexStringSingleQuotes = CSSString("This is a \"quoted\" string with 'apostrophes', a \\backslash\\ and\na newline", quotes: .single)
        #expect(complexStringSingleQuotes.description == "'This is a \"quoted\" string with \\'apostrophes\\', a \\\\backslash\\\\ and\\A a newline'")
    }

    @Test("CSSString conforms to Hashable")
    func testHashable() {
        // Same values and quotes should be equal
        let string1 = CSSString("Equal", quotes: .single)
        let string2 = CSSString("Equal", quotes: .single)
        #expect(string1 == string2)

        // Different values should not be equal
        let string3 = CSSString("Different", quotes: .single)
        #expect(string1 != string3)

        // Same value but different quotes should not be equal
        let string4 = CSSString("Equal", quotes: .double)
        #expect(string1 != string4)
    }

    @Test("CSSString is used correctly in CSS properties context")
    func testUsageInContext() {
        // Content property
        let content = "content: \(CSSString("Hello"))"
        #expect(content == "content: 'Hello'")

        // Content property with double quotes
        let contentDouble = "content: \(CSSString("World", quotes: .double))"
        #expect(contentDouble == "content: \"World\"")

        // Font family property (with quotes)
        let fontFamily = "font-family: \(CSSString("Arial"))"
        #expect(fontFamily == "font-family: 'Arial'")

        // Quotes property (needs two values)
        let quotesProperty = "quotes: \(CSSString("«")) \(CSSString("»"))"
        #expect(quotesProperty == "quotes: '«' '»'")

        // Using with attribute selectors
        let attrSelector = "content: attr(data-\(CSSString("custom")))"
        #expect(attrSelector == "content: attr(data-'custom')")
    }
}
