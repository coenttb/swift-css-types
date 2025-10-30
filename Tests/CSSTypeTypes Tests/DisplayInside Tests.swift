//
//  DisplayInside Tests.swift
//
//
//  Created on 04/02/2025.
//

import CSSTypeTypes
import Testing

@Suite("DisplayInside Tests")
struct DisplayInsideTests {

  @Test("DisplayInside enum has correct cases and raw values")
  func testEnumCases() {
    #expect(DisplayInside.flow.rawValue == "flow")
    #expect(DisplayInside.flowRoot.rawValue == "flow-root")
    #expect(DisplayInside.table.rawValue == "table")
    #expect(DisplayInside.flex.rawValue == "flex")
    #expect(DisplayInside.grid.rawValue == "grid")
    #expect(DisplayInside.ruby.rawValue == "ruby")
  }

  @Test("DisplayInside description returns raw value")
  func testDescription() {
    #expect(DisplayInside.flow.description == "flow")
    #expect(DisplayInside.flowRoot.description == "flow-root")
    #expect(DisplayInside.table.description == "table")
    #expect(DisplayInside.flex.description == "flex")
    #expect(DisplayInside.grid.description == "grid")
    #expect(DisplayInside.ruby.description == "ruby")
  }

  @Test("DisplayInside conforms to Hashable")
  func testHashable() {
    // Same cases should be equal
    let display1 = DisplayInside.flex
    let display2 = DisplayInside.flex
    #expect(display1 == display2)

    // Different cases should not be equal
    let display3 = DisplayInside.grid
    #expect(display1 != display3)
  }

  @Test("DisplayInside can be created from raw values")
  func testRawValueInitialization() {
    #expect(DisplayInside(rawValue: "flow") == DisplayInside.flow)
    #expect(DisplayInside(rawValue: "flow-root") == DisplayInside.flowRoot)
    #expect(DisplayInside(rawValue: "table") == DisplayInside.table)
    #expect(DisplayInside(rawValue: "flex") == DisplayInside.flex)
    #expect(DisplayInside(rawValue: "grid") == DisplayInside.grid)
    #expect(DisplayInside(rawValue: "ruby") == DisplayInside.ruby)
    #expect(DisplayInside(rawValue: "invalid") == nil)
  }

  @Test("DisplayInside is used correctly in CSS display property")
  func testUsageInContext() {
    // Used in display property
    let displayFlow = "display: \(DisplayInside.flow)"
    #expect(displayFlow == "display: flow")

    let displayFlowRoot = "display: \(DisplayInside.flowRoot)"
    #expect(displayFlowRoot == "display: flow-root")

    let displayTable = "display: \(DisplayInside.table)"
    #expect(displayTable == "display: table")

    let displayFlex = "display: \(DisplayInside.flex)"
    #expect(displayFlex == "display: flex")

    let displayGrid = "display: \(DisplayInside.grid)"
    #expect(displayGrid == "display: grid")

    let displayRuby = "display: \(DisplayInside.ruby)"
    #expect(displayRuby == "display: ruby")
  }

  @Test("DisplayInside cases match CSS specification")
  func testCSSSpecification() {
    // Test that we have all the important spec-defined values for display-inside
    #expect(DisplayInside.flow.description == "flow")  // Standard block and inline layout
    #expect(DisplayInside.flowRoot.description == "flow-root")  // Block formatting context
    #expect(DisplayInside.table.description == "table")  // Table layout
    #expect(DisplayInside.flex.description == "flex")  // Flex layout
    #expect(DisplayInside.grid.description == "grid")  // Grid layout
    #expect(DisplayInside.ruby.description == "ruby")  // Ruby layout
  }
}
