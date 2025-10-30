//
//  LineStyle Tests.swift
//
//
//  Created on 04/02/2025.
//

import CSSTypeTypes
import Testing

@Suite("LineStyle Tests")
struct LineStyleTests {

  @Test("LineStyle enum has correct cases and raw values")
  func testEnumCases() {
    #expect(LineStyle.none.rawValue == "none")
    #expect(LineStyle.hidden.rawValue == "hidden")
    #expect(LineStyle.dotted.rawValue == "dotted")
    #expect(LineStyle.dashed.rawValue == "dashed")
    #expect(LineStyle.solid.rawValue == "solid")
    #expect(LineStyle.double.rawValue == "double")
    #expect(LineStyle.groove.rawValue == "groove")
    #expect(LineStyle.ridge.rawValue == "ridge")
    #expect(LineStyle.inset.rawValue == "inset")
    #expect(LineStyle.outset.rawValue == "outset")
  }

  @Test("LineStyle description returns raw value")
  func testDescription() {
    #expect(LineStyle.none.description == "none")
    #expect(LineStyle.hidden.description == "hidden")
    #expect(LineStyle.dotted.description == "dotted")
    #expect(LineStyle.dashed.description == "dashed")
    #expect(LineStyle.solid.description == "solid")
    #expect(LineStyle.double.description == "double")
    #expect(LineStyle.groove.description == "groove")
    #expect(LineStyle.ridge.description == "ridge")
    #expect(LineStyle.inset.description == "inset")
    #expect(LineStyle.outset.description == "outset")
  }

  @Test("LineStyle conforms to Hashable")
  func testHashable() {
    // Same cases should be equal
    let style1 = LineStyle.solid
    let style2 = LineStyle.solid
    #expect(style1 == style2)

    // Different cases should not be equal
    let style3 = LineStyle.dashed
    #expect(style1 != style3)
  }

  @Test("LineStyle conforms to CaseIterable")
  func testCaseIterable() {
    // All cases should be in allCases
    let allCases = LineStyle.allCases
    #expect(allCases.count == 10)
    #expect(allCases.contains(.none))
    #expect(allCases.contains(.hidden))
    #expect(allCases.contains(.dotted))
    #expect(allCases.contains(.dashed))
    #expect(allCases.contains(.solid))
    #expect(allCases.contains(.double))
    #expect(allCases.contains(.groove))
    #expect(allCases.contains(.ridge))
    #expect(allCases.contains(.inset))
    #expect(allCases.contains(.outset))
  }

  @Test("LineStyle can be created from raw values")
  func testRawValueInitialization() {
    #expect(LineStyle(rawValue: "none") == LineStyle.none)
    #expect(LineStyle(rawValue: "hidden") == LineStyle.hidden)
    #expect(LineStyle(rawValue: "dotted") == LineStyle.dotted)
    #expect(LineStyle(rawValue: "dashed") == LineStyle.dashed)
    #expect(LineStyle(rawValue: "solid") == LineStyle.solid)
    #expect(LineStyle(rawValue: "double") == LineStyle.double)
    #expect(LineStyle(rawValue: "groove") == LineStyle.groove)
    #expect(LineStyle(rawValue: "ridge") == LineStyle.ridge)
    #expect(LineStyle(rawValue: "inset") == LineStyle.inset)
    #expect(LineStyle(rawValue: "outset") == LineStyle.outset)
    #expect(LineStyle(rawValue: "invalid") == nil)
  }

  @Test("LineStyle is3D property identifies 3D styles correctly")
  func testIs3D() {
    // 3D styles
    #expect(LineStyle.groove.is3D)
    #expect(LineStyle.ridge.is3D)
    #expect(LineStyle.inset.is3D)
    #expect(LineStyle.outset.is3D)

    // Non-3D styles
    #expect(!LineStyle.none.is3D)
    #expect(!LineStyle.hidden.is3D)
    #expect(!LineStyle.dotted.is3D)
    #expect(!LineStyle.dashed.is3D)
    #expect(!LineStyle.solid.is3D)
    #expect(!LineStyle.double.is3D)
  }

  @Test("LineStyle isVisible property identifies visible styles correctly")
  func testIsVisible() {
    // Invisible styles
    #expect(!LineStyle.none.isVisible)
    #expect(!LineStyle.hidden.isVisible)

    // Visible styles
    #expect(LineStyle.dotted.isVisible)
    #expect(LineStyle.dashed.isVisible)
    #expect(LineStyle.solid.isVisible)
    #expect(LineStyle.double.isVisible)
    #expect(LineStyle.groove.isVisible)
    #expect(LineStyle.ridge.isVisible)
    #expect(LineStyle.inset.isVisible)
    #expect(LineStyle.outset.isVisible)
  }

  @Test("LineStyle opposite3D property returns correct opposites for 3D styles")
  func testOpposite3D() {
    // Valid opposites
    #expect(LineStyle.groove.opposite3D == LineStyle.ridge)
    #expect(LineStyle.ridge.opposite3D == LineStyle.groove)
    #expect(LineStyle.inset.opposite3D == LineStyle.outset)
    #expect(LineStyle.outset.opposite3D == LineStyle.inset)

    // Verify symmetry of opposites
    #expect(LineStyle.groove.opposite3D?.opposite3D == LineStyle.groove)
    #expect(LineStyle.inset.opposite3D?.opposite3D == LineStyle.inset)

    // Non-3D styles return nil
    #expect(LineStyle.none.opposite3D == nil)
    #expect(LineStyle.hidden.opposite3D == nil)
    #expect(LineStyle.dotted.opposite3D == nil)
    #expect(LineStyle.dashed.opposite3D == nil)
    #expect(LineStyle.solid.opposite3D == nil)
    #expect(LineStyle.double.opposite3D == nil)
  }

  @Test("LineStyle is used correctly in CSS properties context")
  func testUsageInContext() {
    // Border style
    let borderStyle = "border-style: \(LineStyle.solid)"
    #expect(borderStyle == "border-style: solid")

    // Individual border side style
    let borderTopStyle = "border-top-style: \(LineStyle.dashed)"
    #expect(borderTopStyle == "border-top-style: dashed")

    // Column rule style
    let columnRuleStyle = "column-rule-style: \(LineStyle.double)"
    #expect(columnRuleStyle == "column-rule-style: double")

    // Outline style
    let outlineStyle = "outline-style: \(LineStyle.groove)"
    #expect(outlineStyle == "outline-style: groove")
  }
}
