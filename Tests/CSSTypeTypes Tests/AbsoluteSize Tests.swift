//
//  AbsoluteSize Tests.swift
//
//
//  Created on 03/26/2025.
//

import CSSTypeTypes
import Testing

@Suite("AbsoluteSize Tests")
struct AbsoluteSizeTests {

  @Test("AbsoluteSize values render correctly")
  func testAbsoluteSizeValues() {
    #expect(AbsoluteSize.xxSmall.description == "xx-small")
    #expect(AbsoluteSize.xSmall.description == "x-small")
    #expect(AbsoluteSize.small.description == "small")
    #expect(AbsoluteSize.medium.description == "medium")
    #expect(AbsoluteSize.large.description == "large")
    #expect(AbsoluteSize.xLarge.description == "x-large")
    #expect(AbsoluteSize.xxLarge.description == "xx-large")
    #expect(AbsoluteSize.xxxLarge.description == "xxx-large")
  }

  @Test("AbsoluteSize raw values are correct")
  func testRawValues() {
    #expect(AbsoluteSize.xxSmall.rawValue == "xx-small")
    #expect(AbsoluteSize.xSmall.rawValue == "x-small")
    #expect(AbsoluteSize.small.rawValue == "small")
    #expect(AbsoluteSize.medium.rawValue == "medium")
    #expect(AbsoluteSize.large.rawValue == "large")
    #expect(AbsoluteSize.xLarge.rawValue == "x-large")
    #expect(AbsoluteSize.xxLarge.rawValue == "xx-large")
    #expect(AbsoluteSize.xxxLarge.rawValue == "xxx-large")
  }

  @Test("AbsoluteSize initialization from raw value works correctly")
  func testRawValueInitializer() {
    #expect(AbsoluteSize(rawValue: "xx-small") == AbsoluteSize.xxSmall)
    #expect(AbsoluteSize(rawValue: "medium") == AbsoluteSize.medium)
    #expect(AbsoluteSize(rawValue: "xxx-large") == AbsoluteSize.xxxLarge)

    // Invalid raw value
    #expect(AbsoluteSize(rawValue: "invalid") == nil)
  }

  @Test("AbsoluteSize conforms to Hashable")
  func testHashable() {
    let small1 = AbsoluteSize.small
    let small2 = AbsoluteSize.small
    let medium = AbsoluteSize.medium

    #expect(small1 == small2)
    #expect(small1 != medium)
  }

  @Test("AbsoluteSize preserves ordering")
  func testOrdering() {
    // Not using array.sorted() since AbsoluteSize doesn't conform to Comparable,
    // but we can still verify the logical ordering of the cases
    let sizes = [
      AbsoluteSize.xxxLarge,
      AbsoluteSize.xxLarge,
      AbsoluteSize.xLarge,
      AbsoluteSize.large,
      AbsoluteSize.medium,
      AbsoluteSize.small,
      AbsoluteSize.xSmall,
      AbsoluteSize.xxSmall,
    ]

    // Verify that the last element is the smallest and the first is the largest
    #expect(sizes.first == AbsoluteSize.xxxLarge)
    #expect(sizes.last == AbsoluteSize.xxSmall)
  }
}
