//
//  ContentDistribution Tests.swift
//
//
//  Created on 04/02/2025.
//

import CSSTypeTypes
import Testing

@Suite("ContentDistribution Tests")
struct ContentDistributionTests {

  @Test("ContentDistribution enum cases render correctly")
  func testContentDistributionValues() {
    #expect(ContentDistribution.spaceBetween.description == "space-between")
    #expect(ContentDistribution.spaceAround.description == "space-around")
    #expect(ContentDistribution.spaceEvenly.description == "space-evenly")
    #expect(ContentDistribution.stretch.description == "stretch")
  }

  @Test("ContentDistribution enum conforms to Hashable")
  func testHashable() {
    let spaceBetween1 = ContentDistribution.spaceBetween
    let spaceBetween2 = ContentDistribution.spaceBetween
    let spaceAround = ContentDistribution.spaceAround

    #expect(spaceBetween1 == spaceBetween2)
    #expect(spaceBetween1 != spaceAround)
    #expect(ContentDistribution.stretch != ContentDistribution.spaceEvenly)
  }

  @Test("ContentDistribution uses rawValue for description")
  func testRawValueDescription() {
    for distribution in ContentDistribution.allCases {
      #expect(distribution.description == distribution.rawValue)
    }
  }

  @Test("ContentDistribution raw values match CSS specifications")
  func testRawValuesMatchSpec() {
    #expect(ContentDistribution.spaceBetween.rawValue == "space-between")
    #expect(ContentDistribution.spaceAround.rawValue == "space-around")
    #expect(ContentDistribution.spaceEvenly.rawValue == "space-evenly")
    #expect(ContentDistribution.stretch.rawValue == "stretch")
  }
}
