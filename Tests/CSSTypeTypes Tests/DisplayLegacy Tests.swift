//
//  DisplayLegacy Tests.swift
//
//
//  Created on 04/02/2025.
//

import CSSTypeTypes
import Testing

@Suite("DisplayLegacy Tests")
struct DisplayLegacyTests {

  @Test("DisplayLegacy enum has correct cases and raw values")
  func testEnumCases() {
    #expect(DisplayLegacy.inlineBlock.rawValue == "inline-block")
    #expect(DisplayLegacy.inlineTable.rawValue == "inline-table")
    #expect(DisplayLegacy.inlineFlex.rawValue == "inline-flex")
    #expect(DisplayLegacy.inlineGrid.rawValue == "inline-grid")
  }

  @Test("DisplayLegacy description returns raw value")
  func testDescription() {
    #expect(DisplayLegacy.inlineBlock.description == "inline-block")
    #expect(DisplayLegacy.inlineTable.description == "inline-table")
    #expect(DisplayLegacy.inlineFlex.description == "inline-flex")
    #expect(DisplayLegacy.inlineGrid.description == "inline-grid")
  }

  @Test("DisplayLegacy conforms to Hashable")
  func testHashable() {
    // Same cases should be equal
    let display1 = DisplayLegacy.inlineBlock
    let display2 = DisplayLegacy.inlineBlock
    #expect(display1 == display2)

    // Different cases should not be equal
    let display3 = DisplayLegacy.inlineFlex
    #expect(display1 != display3)
  }

  @Test("DisplayLegacy can be created from raw values")
  func testRawValueInitialization() {
    #expect(DisplayLegacy(rawValue: "inline-block") == DisplayLegacy.inlineBlock)
    #expect(DisplayLegacy(rawValue: "inline-table") == DisplayLegacy.inlineTable)
    #expect(DisplayLegacy(rawValue: "inline-flex") == DisplayLegacy.inlineFlex)
    #expect(DisplayLegacy(rawValue: "inline-grid") == DisplayLegacy.inlineGrid)
    #expect(DisplayLegacy(rawValue: "invalid") == nil)
  }

  @Test("DisplayLegacy is used correctly in CSS display property")
  func testUsageInContext() {
    // Used in display property
    let displayInlineBlock = "display: \(DisplayLegacy.inlineBlock)"
    #expect(displayInlineBlock == "display: inline-block")

    let displayInlineTable = "display: \(DisplayLegacy.inlineTable)"
    #expect(displayInlineTable == "display: inline-table")

    let displayInlineFlex = "display: \(DisplayLegacy.inlineFlex)"
    #expect(displayInlineFlex == "display: inline-flex")

    let displayInlineGrid = "display: \(DisplayLegacy.inlineGrid)"
    #expect(displayInlineGrid == "display: inline-grid")
  }

  @Test("DisplayLegacy cases match CSS specification")
  func testCSSSpecification() {
    // Test that we have all the important spec-defined values for display-legacy
    #expect(DisplayLegacy.inlineBlock.description == "inline-block")  // Inline-level block container
    #expect(DisplayLegacy.inlineTable.description == "inline-table")  // Inline-level table
    #expect(DisplayLegacy.inlineFlex.description == "inline-flex")  // Inline-level flex container
    #expect(DisplayLegacy.inlineGrid.description == "inline-grid")  // Inline-level grid container
  }
}
