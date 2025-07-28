//
//  Url Tests.swift
//  
//
//  Created on 03/26/2025.
//

import CSSTypeTypes
import Testing

@Suite("Url Tests")
struct UrlTests {

    @Test("Basic URL values render correctly with single quotes")
    func testBasicUrlsWithSingleQuotes() {
        let url = Url("images/background.png", quotes: .single)
        #expect(url.description == "url('images/background.png')")

        let absoluteUrl = Url("https://example.com/image.jpg", quotes: .single)
        #expect(absoluteUrl.description == "url('https://example.com/image.jpg')")
    }

    @Test("Basic URL values render correctly with double quotes")
    func testBasicUrlsWithDoubleQuotes() {
        let url = Url("images/background.png", quotes: .double)
        #expect(url.description == "url(\"images/background.png\")")

        let absoluteUrl = Url("https://example.com/image.jpg", quotes: .double)
        #expect(absoluteUrl.description == "url(\"https://example.com/image.jpg\")")
    }

    @Test("Default quotes behavior")
    func testDefaultQuotesBehavior() {
        // The default should be single quotes
        let url = Url("images/background.png")
        #expect(url.description == "url('images/background.png')")

        // Explicitly specifying single quotes
        let explicitSingleUrl = Url("images/background.png", quotes: .single)
        #expect(explicitSingleUrl.description == "url('images/background.png')")
    }

    @Test("URL values render correctly without quotes")
    func testUnquotedUrls() {
        let url = Url("images/background.png", quotes: nil)
        #expect(url.description == "url(images/background.png)")

        let absoluteUrl = Url("https://example.com/image.jpg", quotes: nil)
        #expect(absoluteUrl.description == "url(https://example.com/image.jpg)")
    }

    @Test("Special characters in URLs are properly escaped with single quotes")
    func testUrlEscapingWithSingleQuotes() {
        let urlWithSpaces = Url("images/my background.png", quotes: .single)
        #expect(urlWithSpaces.description == "url('images/my%20background.png')")

        let urlWithParentheses = Url("images/photo(1).jpg", quotes: .single)
        #expect(urlWithParentheses.description == "url('images/photo%281%29.jpg')")

        let urlWithCommas = Url("images/file,name.jpg", quotes: .single)
        #expect(urlWithCommas.description == "url('images/file%2Cname.jpg')")

        let urlWithSingleQuotes = Url("images/my'photo'.jpg", quotes: .single)
        #expect(urlWithSingleQuotes.description == "url('images/my\\'photo\\'.jpg')")
    }

    @Test("Special characters in URLs are properly escaped with double quotes")
    func testUrlEscapingWithDoubleQuotes() {
        let urlWithSpaces = Url("images/my background.png", quotes: .double)
        #expect(urlWithSpaces.description == "url(\"images/my%20background.png\")")

        let urlWithParentheses = Url("images/photo(1).jpg", quotes: .double)
        #expect(urlWithParentheses.description == "url(\"images/photo%281%29.jpg\")")

        let urlWithCommas = Url("images/file,name.jpg", quotes: .double)
        #expect(urlWithCommas.description == "url(\"images/file%2Cname.jpg\")")

        let urlWithDoubleQuotes = Url("images/my\"photo\".jpg", quotes: .double)
        #expect(urlWithDoubleQuotes.description == "url(\"images/my\\\"photo\\\".jpg\")")
    }

    @Test("Data URLs work correctly with different quote styles")
    func testDataUrls() {
        // Test with single quotes (default)
        let dataUrl = Url.dataUrl(
            mimeType: "image/png",
            base64Data: "iVBORw0KGgoAAAANSU"
        )
        #expect(dataUrl.description == "url('data:image/png;base64,iVBORw0KGgoAAAANSU')")

        // Test with double quotes
        let doubleQuotedDataUrl = Url.dataUrl(
            mimeType: "image/png",
            base64Data: "iVBORw0KGgoAAAANSU",
            quotes: .double
        )
        #expect(doubleQuotedDataUrl.description == "url(\"data:image/png;base64,iVBORw0KGgoAAAANSU\")")

        // Test without quotes
        let unquotedDataUrl = Url.dataUrl(
            mimeType: "image/png",
            base64Data: "iVBORw0KGgoAAAANSU",
            quotes: nil
        )
        #expect(unquotedDataUrl.description == "url(data:image/png;base64,iVBORw0KGgoAAAANSU)")
    }

    @Test("String literals work correctly with default quotes")
    func testStringLiterals() {
        let urlLiteral: Url = "images/icon.png"
        #expect(urlLiteral.description == "url('images/icon.png')")
    }

    @Test("Url conforms to Hashable")
    func testHashable() {
        let url1 = Url("image.jpg")
        let url2 = Url("image.jpg")
        let url3 = Url("different.jpg")

        #expect(url1 == url2)
        #expect(url1 != url3)

        // Different quote settings should lead to different equality
        let singleQuoteUrl = Url("image.jpg", quotes: .single)
        let doubleQuoteUrl = Url("image.jpg", quotes: .double)
        let unquotedUrl = Url("image.jpg", quotes: nil)

        #expect(singleQuoteUrl != doubleQuoteUrl)
        #expect(singleQuoteUrl != unquotedUrl)
        #expect(doubleQuoteUrl != unquotedUrl)
    }
}
