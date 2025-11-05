//
//  Global Tests.swift
//
//
//  Created on 04/02/2025.
//

import CSSTypeTypes
import Testing

@Suite("Global Tests")
struct GlobalTests {

    @Test("Global enum cases render correctly")
    func testGlobalValues() {
        #expect(Global.inherit.description == "inherit")
        #expect(Global.initial.description == "initial")
        #expect(Global.revert.description == "revert")
        #expect(Global.revertLayer.description == "revert-layer")
        #expect(Global.unset.description == "unset")
    }
}
