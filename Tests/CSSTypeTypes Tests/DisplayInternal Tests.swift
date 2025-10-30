//
//  DisplayInternal Tests.swift
//
//
//  Created on 04/02/2025.
//

import CSSTypeTypes
import Testing

@Suite("DisplayInternal Tests")
struct DisplayInternalTests {

  @Test("DisplayInternal enum has correct table-related cases and raw values")
  func testTableRelatedEnumCases() {
    // Table-related cases
    #expect(DisplayInternal.tableRowGroup.rawValue == "table-row-group")
    #expect(DisplayInternal.tableHeaderGroup.rawValue == "table-header-group")
    #expect(DisplayInternal.tableFooterGroup.rawValue == "table-footer-group")
    #expect(DisplayInternal.tableRow.rawValue == "table-row")
    #expect(DisplayInternal.tableCell.rawValue == "table-cell")
    #expect(DisplayInternal.tableColumnGroup.rawValue == "table-column-group")
    #expect(DisplayInternal.tableColumn.rawValue == "table-column")
    #expect(DisplayInternal.tableCaption.rawValue == "table-caption")
  }

  @Test("DisplayInternal enum has correct ruby-related cases and raw values")
  func testRubyRelatedEnumCases() {
    // Ruby-related cases
    #expect(DisplayInternal.rubyBase.rawValue == "ruby-base")
    #expect(DisplayInternal.rubyText.rawValue == "ruby-text")
    #expect(DisplayInternal.rubyBaseContainer.rawValue == "ruby-base-container")
    #expect(DisplayInternal.rubyTextContainer.rawValue == "ruby-text-container")
  }

  @Test("DisplayInternal description returns raw value")
  func testTableRelatedDescription() {
    // Table-related descriptions
    #expect(DisplayInternal.tableRowGroup.description == "table-row-group")
    #expect(DisplayInternal.tableHeaderGroup.description == "table-header-group")
    #expect(DisplayInternal.tableFooterGroup.description == "table-footer-group")
    #expect(DisplayInternal.tableRow.description == "table-row")
    #expect(DisplayInternal.tableCell.description == "table-cell")
    #expect(DisplayInternal.tableColumnGroup.description == "table-column-group")
    #expect(DisplayInternal.tableColumn.description == "table-column")
    #expect(DisplayInternal.tableCaption.description == "table-caption")
  }

  @Test("DisplayInternal description returns raw value for Ruby cases")
  func testRubyRelatedDescription() {
    // Ruby-related descriptions
    #expect(DisplayInternal.rubyBase.description == "ruby-base")
    #expect(DisplayInternal.rubyText.description == "ruby-text")
    #expect(DisplayInternal.rubyBaseContainer.description == "ruby-base-container")
    #expect(DisplayInternal.rubyTextContainer.description == "ruby-text-container")
  }

  @Test("DisplayInternal conforms to Hashable")
  func testHashable() {
    // Same cases should be equal
    let display1 = DisplayInternal.tableCell
    let display2 = DisplayInternal.tableCell
    #expect(display1 == display2)

    // Different cases should not be equal
    let display3 = DisplayInternal.tableRow
    #expect(display1 != display3)

    // Table vs Ruby cases should not be equal
    let display4 = DisplayInternal.rubyText
    #expect(display1 != display4)
  }

  @Test("DisplayInternal can be created from raw values")
  func testRawValueInitialization() {
    // Table-related
    #expect(DisplayInternal(rawValue: "table-row-group") == DisplayInternal.tableRowGroup)
    #expect(DisplayInternal(rawValue: "table-header-group") == DisplayInternal.tableHeaderGroup)
    #expect(DisplayInternal(rawValue: "table-footer-group") == DisplayInternal.tableFooterGroup)
    #expect(DisplayInternal(rawValue: "table-row") == DisplayInternal.tableRow)
    #expect(DisplayInternal(rawValue: "table-cell") == DisplayInternal.tableCell)
    #expect(DisplayInternal(rawValue: "table-column-group") == DisplayInternal.tableColumnGroup)
    #expect(DisplayInternal(rawValue: "table-column") == DisplayInternal.tableColumn)
    #expect(DisplayInternal(rawValue: "table-caption") == DisplayInternal.tableCaption)

    // Ruby-related
    #expect(DisplayInternal(rawValue: "ruby-base") == DisplayInternal.rubyBase)
    #expect(DisplayInternal(rawValue: "ruby-text") == DisplayInternal.rubyText)
    #expect(DisplayInternal(rawValue: "ruby-base-container") == DisplayInternal.rubyBaseContainer)
    #expect(DisplayInternal(rawValue: "ruby-text-container") == DisplayInternal.rubyTextContainer)

    // Invalid
    #expect(DisplayInternal(rawValue: "invalid") == nil)
  }

  @Test("DisplayInternal is used correctly in CSS display property")
  func testUsageInContext() {
    // Table-related usage
    let displayTableRow = "display: \(DisplayInternal.tableRow)"
    #expect(displayTableRow == "display: table-row")

    let displayTableCell = "display: \(DisplayInternal.tableCell)"
    #expect(displayTableCell == "display: table-cell")

    // Ruby-related usage
    let displayRubyText = "display: \(DisplayInternal.rubyText)"
    #expect(displayRubyText == "display: ruby-text")

    let displayRubyBase = "display: \(DisplayInternal.rubyBase)"
    #expect(displayRubyBase == "display: ruby-base")
  }

  @Test("DisplayInternal cases match CSS specification")
  func testCSSSpecification() {
    // Test that we have all the important spec-defined values for display-internal

    // Table-related values mimic HTML elements
    #expect(DisplayInternal.tableRowGroup.description == "table-row-group")  // like <tbody>
    #expect(DisplayInternal.tableHeaderGroup.description == "table-header-group")  // like <thead>
    #expect(DisplayInternal.tableFooterGroup.description == "table-footer-group")  // like <tfoot>
    #expect(DisplayInternal.tableRow.description == "table-row")  // like <tr>
    #expect(DisplayInternal.tableCell.description == "table-cell")  // like <td>
    #expect(DisplayInternal.tableColumnGroup.description == "table-column-group")  // like <colgroup>
    #expect(DisplayInternal.tableColumn.description == "table-column")  // like <col>
    #expect(DisplayInternal.tableCaption.description == "table-caption")  // like <caption>

    // Ruby-related values for East Asian typography
    #expect(DisplayInternal.rubyBase.description == "ruby-base")  // like <rb>
    #expect(DisplayInternal.rubyText.description == "ruby-text")  // like <rt>
    #expect(DisplayInternal.rubyBaseContainer.description == "ruby-base-container")  // container for ruby bases
    #expect(DisplayInternal.rubyTextContainer.description == "ruby-text-container")  // like <rtc>
  }
}
