//
//  Overflow Tests.swift
//
//
//  Created on 04/02/2025.
//

import CSSTypeTypes
import Testing

@Suite("Overflow Tests")
struct OverflowTests {

    @Test("Overflow enum has correct cases and raw values")
    func testEnumCases() {
        #expect(Overflow.visible.rawValue == "visible")
        #expect(Overflow.hidden.rawValue == "hidden")
        #expect(Overflow.clip.rawValue == "clip")
        #expect(Overflow.scroll.rawValue == "scroll")
        #expect(Overflow.auto.rawValue == "auto")
        #expect(Overflow.overlay.rawValue == "overlay")
    }

    @Test("Overflow description returns raw value")
    func testDescription() {
        #expect(Overflow.visible.description == "visible")
        #expect(Overflow.hidden.description == "hidden")
        #expect(Overflow.clip.description == "clip")
        #expect(Overflow.scroll.description == "scroll")
        #expect(Overflow.auto.description == "auto")
        #expect(Overflow.overlay.description == "overlay")
    }

    @Test("Overflow conforms to Hashable")
    func testHashable() {
        // Same cases should be equal
        let overflow1 = Overflow.visible
        let overflow2 = Overflow.visible
        #expect(overflow1 == overflow2)

        // Different cases should not be equal
        let overflow3 = Overflow.hidden
        #expect(overflow1 != overflow3)
    }

    @Test("Overflow conforms to CaseIterable")
    func testCaseIterable() {
        // All cases (except deprecated) should be in allCases
        let allCases = Overflow.allCases
        #expect(allCases.count == 5)
        #expect(allCases.contains(.visible))
        #expect(allCases.contains(.hidden))
        #expect(allCases.contains(.clip))
        #expect(allCases.contains(.scroll))
        #expect(allCases.contains(.auto))

        // Deprecated case should not be in allCases
        #expect(!allCases.contains(.overlay))
    }

    @Test("Overflow can be created from raw values")
    func testRawValueInitialization() {
        #expect(Overflow(rawValue: "visible") == Overflow.visible)
        #expect(Overflow(rawValue: "hidden") == Overflow.hidden)
        #expect(Overflow(rawValue: "clip") == Overflow.clip)
        #expect(Overflow(rawValue: "scroll") == Overflow.scroll)
        #expect(Overflow(rawValue: "auto") == Overflow.auto)
        #expect(Overflow(rawValue: "overlay") == Overflow.overlay)
        #expect(Overflow(rawValue: "invalid") == nil)
    }

    @Test("Overflow is used correctly in CSS overflow properties")
    func testUsageInContext() {
        // General overflow property
        let overflowVisible = "overflow: \(Overflow.visible)"
        #expect(overflowVisible == "overflow: visible")

        let overflowHidden = "overflow: \(Overflow.hidden)"
        #expect(overflowHidden == "overflow: hidden")

        // Overflow-x property
        let overflowXScroll = "overflow-x: \(Overflow.scroll)"
        #expect(overflowXScroll == "overflow-x: scroll")

        // Overflow-y property
        let overflowYAuto = "overflow-y: \(Overflow.auto)"
        #expect(overflowYAuto == "overflow-y: auto")

        // Overflow-block property
        let overflowBlockClip = "overflow-block: \(Overflow.clip)"
        #expect(overflowBlockClip == "overflow-block: clip")

        // Using deprecated value (should work but is not recommended)
        let overflowOverlay = "overflow: \(Overflow.overlay)"
        #expect(overflowOverlay == "overflow: overlay")
    }

    @Test("Overflow cases match CSS specification")
    func testCSSSpecification() {
        // Test that we have all the important spec-defined values
        #expect(Overflow.visible.description == "visible")  // Content is not clipped
        #expect(Overflow.hidden.description == "hidden")  // Content is clipped, no scrollbars
        #expect(Overflow.clip.description == "clip")  // Content is clipped, no scrolling
        #expect(Overflow.scroll.description == "scroll")  // Content is clipped, scrollbars are shown
        #expect(Overflow.auto.description == "auto")  // Scrollbars shown only when needed

        // Deprecated value
        #expect(Overflow.overlay.description == "overlay")  // Like auto but scrollbars drawn on top
    }
}
