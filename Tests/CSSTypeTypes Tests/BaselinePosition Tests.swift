//
//  BaselinePosition Tests.swift
//
//
//  Created on 03/26/2025.
//

import CSSTypeTypes
import Testing

@Suite("BaselinePosition Tests")
struct BaselinePositionTests {

  @Test("BaselinePosition values render correctly")
  func testBaselinePositionValues() {
    let firstBaseline = BaselinePosition.firstBaseline
    #expect(firstBaseline.description == "first baseline")

    let baseline = BaselinePosition.baseline
    #expect(baseline.description == "baseline")

    let lastBaseline = BaselinePosition.lastBaseline
    #expect(lastBaseline.description == "last baseline")
  }

  @Test("BaselinePosition raw values are correct")
  func testRawValues() {
    #expect(BaselinePosition.firstBaseline.description == "first baseline")
    #expect(BaselinePosition.baseline.description == "baseline")
    #expect(BaselinePosition.lastBaseline.description == "last baseline")
  }

  @Test("BaselinePosition conforms to Hashable")
  func testHashable() {
    let baseline1 = BaselinePosition.baseline
    let baseline2 = BaselinePosition.baseline
    let firstBaseline = BaselinePosition.firstBaseline

    #expect(baseline1 == baseline2)
    #expect(baseline1 != firstBaseline)
    #expect(firstBaseline != BaselinePosition.lastBaseline)
  }
}
