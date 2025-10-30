//
//  AnimationRangeStart Tests.swift
//
//
//  Created on 03/30/2025.
//

import CSSPropertyTypes
import CSSTypeTypes
import Testing

@Suite("AnimationRangeStart Tests")
struct AnimationRangeStartTests {

  @Test("AnimationRangeStart renders its Declaration correctly")
  func testDeclaration() {
    #expect(AnimationRangeStart.normal.declaration.description == "animation-range-start:normal")

    let x: BorderBlockEndWidth = .px(5)
    #expect(x.description == Length.px(5).description)
  }

  @Test("AnimationRangeStart renders normal value correctly")
  func testNormalValue() {
    #expect(AnimationRangeStart.normal.description == "normal")
  }

  @Test("AnimationRangeStart renders named range values correctly")
  func testNamedRangeValues() {
    #expect(AnimationRangeStart.namedRange(.cover).description == "cover")
    #expect(AnimationRangeStart.namedRange(.contain).description == "contain")
    #expect(AnimationRangeStart.namedRange(.entry).description == "entry")
    #expect(AnimationRangeStart.namedRange(.exit).description == "exit")
    #expect(AnimationRangeStart.namedRange(.entryCrossing).description == "entry-crossing")
    #expect(AnimationRangeStart.namedRange(.exitCrossing).description == "exit-crossing")
  }

  @Test("AnimationRangeStart renders percentage values correctly")
  func testPercentageValues() {
    #expect(AnimationRangeStart.percentage(20).description == "20%")
  }

  @Test("AnimationRangeStart renders named range with percentage values correctly")
  func testNamedRangeWithPercentage() {
    #expect(AnimationRangeStart.namedRange(.entry, 25).description == "entry 25%")
    #expect(AnimationRangeStart.namedRange(.contain, 10).description == "contain 10%")
  }

  @Test("AnimationRangeStart renders global values correctly")
  func testGlobalValues() {
    #expect(AnimationRangeStart.inherit.description == "inherit")
    #expect(AnimationRangeStart.initial.description == "initial")
    #expect(AnimationRangeStart.revert.description == "revert")
    #expect(AnimationRangeStart.revertLayer.description == "revert-layer")
    #expect(AnimationRangeStart.unset.description == "unset")
  }

  @Test("AnimationRangeStart conforms to Property protocol")
  func testPropertyProtocol() {
    #expect(AnimationRangeStart.property == "animation-range-start")
  }

  @Test("TimelineRangeName provides expected cases")
  func testTimelineRangeNameCases() {
    let allCases = TimelineRangeName.allCases
    #expect(allCases.contains(.cover))
    #expect(allCases.contains(.contain))
    #expect(allCases.contains(.entry))
    #expect(allCases.contains(.exit))
    #expect(allCases.contains(.entryCrossing))
    #expect(allCases.contains(.exitCrossing))

    #expect(TimelineRangeName.cover.rawValue == "cover")
    #expect(TimelineRangeName.entryCrossing.rawValue == "entry-crossing")
    #expect(TimelineRangeName.exitCrossing.rawValue == "exit-crossing")
  }
}
