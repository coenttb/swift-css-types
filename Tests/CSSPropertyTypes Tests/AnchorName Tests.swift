//
//  AnchorName Tests.swift
//  
//
//  Created on 03/30/2025.
//

import CSSPropertyTypes
import CSSTypeTypes
import Testing

@Suite("AnchorName Tests")
struct AnchorNameTests {

    @Test("AnchorName renders its Declaration correctly")
    func testDeclaration() {
        #expect(AnchorName.none.declaration.description == "anchor-name:none")
    }

    @Test("AnchorName renders none value correctly")
    func testNoneValue() {
        #expect(AnchorName.none.description == "none")
    }

    @Test("AnchorName renders single custom identifiers correctly")
    func testSingleIdentifier() {
        #expect(AnchorName.custom("--myAnchor").description == "--myAnchor")
        #expect(AnchorName.custom("--header").description == "--header")
        #expect(AnchorName.custom("--footer-anchor").description == "--footer-anchor")
    }

    @Test("AnchorName renders multiple custom identifiers correctly")
    func testMultipleIdentifiers() {
        #expect(AnchorName.customs(["--a", "--b"]).description == "--a, --b")
        #expect(AnchorName.multiple([DashedIdent("--header"), DashedIdent("--sidebar")]).description == "--header, --sidebar")
    }

    @Test("AnchorName renders global values correctly")
    func testGlobalValues() {
        #expect(AnchorName.inherit.description == "inherit")
        #expect(AnchorName.initial.description == "initial")
        #expect(AnchorName.revert.description == "revert")
        #expect(AnchorName.revertLayer.description == "revert-layer")
        #expect(AnchorName.unset.description == "unset")
    }

    @Test("AnchorName conforms to Property protocol")
    func testPropertyProtocol() {
        #expect(AnchorName.property == "anchor-name")
    }
}
