//
//  ColumnGap.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `column-gap` property sets the size of the gap (gutter) between an element's columns.
///
/// Initially part of Multi-column Layout, the definition of column-gap has been broadened
/// to include multiple layout methods. It can be used in multi-column, flexbox, and grid layouts.
///
/// - SeeAlso: [MDN Web Docs on column-gap](https://developer.mozilla.org/en-US/docs/Web/CSS/column-gap)
public enum ColumnGap: Property, LengthPercentageConvertible {
  public static let property: String = "column-gap"

  /// The browser's default spacing is used between columns.
  /// For multi-column layout this is typically 1em, for other layout types it is 0.
  case normal

  case lengthPercentage(LengthPercentage)

  /// Global CSS values
  case global(CSSTypeTypes.Global)

  /// String representation of the column-gap value
  public var description: String {
    switch self {
    case .normal:
      return "normal"
    case .lengthPercentage(let lengthPercentage):
      return lengthPercentage.description
    case .global(let global):
      return global.description
    }
  }
}

/// Allow numeric literal initialization
extension ColumnGap: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
  /// Creates a column gap with a pixel value from an integer literal
  ///
  /// ```swift
  /// .columnGap(20)  // equivalent to .columnGap(.px(20))
  /// ```
  public init(integerLiteral value: Int) {
    self = .px(Double(value))
  }

  /// Creates a column gap with a pixel value from a float literal
  ///
  /// ```swift
  /// .columnGap(20.5)  // equivalent to .columnGap(.px(20.5))
  /// ```
  public init(floatLiteral value: Double) {
    self = .px(value)
  }
}
