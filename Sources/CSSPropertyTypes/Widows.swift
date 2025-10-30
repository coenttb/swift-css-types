//
//  Widows.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `widows` property sets the minimum number of lines in a block container that must be shown
/// at the top of a page, region, or column.
///
/// In typography, a widow is the last line of a paragraph that appears alone at the top of a page
/// (where the paragraph is continued from a prior page).
///
/// - SeeAlso: [MDN Web Docs on widows](https://developer.mozilla.org/en-US/docs/Web/CSS/widows)
public enum Widows: Property {
  public static let property: String = "widows"

  /// Specifies the minimum number of lines that can stay by themselves
  /// at the top of a new fragment after a fragmentation break.
  /// The value must be positive.
  case integer(Int)

  /// Global value
  case global(CSSTypeTypes.Global)

  public var description: String {
    switch self {
    case .integer(let value):
      return "\(value)"
    case .global(let global):
      return global.description
    }
  }
}

extension Widows: ExpressibleByIntegerLiteral {
  /// Creates a widows value with an integer value
  ///
  /// This allows you to use integers directly where widows values are expected.
  ///
  /// ```swift
  /// .widows(2)  // equivalent to .widows(.integer(2))
  /// ```
  public init(integerLiteral value: Int) {
    self = .integer(value)
  }
}
