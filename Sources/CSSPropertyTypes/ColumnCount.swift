//
//  ColumnCount.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `column-count` property breaks an element's content into the specified number of columns.
///
/// This property allows you to specify the number of columns for multi-column layout.
/// If both `column-count` and `column-width` are set, `column-count` acts as a maximum.
///
/// - SeeAlso: [MDN Web Docs on column-count](https://developer.mozilla.org/en-US/docs/Web/CSS/column-count)
public enum ColumnCount: Property {
  public static let property: String = "column-count"
  /// The number of columns is determined by other CSS properties, such as column-width.
  case auto

  /// A positive integer describing the ideal number of columns for the content.
  /// Must be greater than 0.
  case count(Int)

  /// Global CSS values
  case global(CSSTypeTypes.Global)

  /// Creates a column count value with an integer
  ///
  /// - Parameter count: The number of columns (must be positive)
  /// - Returns: A column count value
  public static func columns(_ count: Int) -> ColumnCount {
    // Ensure count is at least 1
    return .count(max(1, count))
  }

  /// String representation of the column-count value
  public var description: String {
    switch self {
    case .auto:
      return "auto"
    case .count(let count):
      return "\(count)"
    case .global(let global):
      return global.description
    }
  }
}

/// Convenience initializer to allow using integers directly
extension ColumnCount: ExpressibleByIntegerLiteral {
  /// Creates a column count from an integer literal
  ///
  /// ```swift
  /// .columnCount(3)  // equivalent to .columnCount(.count(3))
  /// ```
  public init(integerLiteral value: Int) {
    self = .count(max(1, value))
  }
}
