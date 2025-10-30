//
//  ScrollMarginBlock.swift
//  swift-css
//
//  Created by Claude on 28/03/2025.
//

import CSSTypeTypes
import Foundation

/// The `scroll-margin-block` shorthand property sets the scroll margins of an element
/// in the block dimension.
///
/// This is the logical equivalent of scroll-margin-top and scroll-margin-bottom,
/// depending on the element's writing mode.
///
/// Example:
/// ```css
/// scroll-margin-block: 20px;       /* Both start and end */
/// scroll-margin-block: 1em 2em;     /* Start and end edges */
/// ```
public enum ScrollMarginBlock: Property, LengthConvertible, ExpressibleByIntegerLiteral,
  ExpressibleByFloatLiteral, CustomStringConvertible
{
  public static let property: String = "scroll-margin-block"

  /// A single length value for both block start and block end
  case all(Length)

  /// Two length values for block start and block end
  case start_end(Length, Length)

  /// Global CSS value
  case global(CSSTypeTypes.Global)

  public var description: String {
    switch self {
    case .all(let value):
      return value.description
    case .start_end(let start, let end):
      return "\(start.description) \(end.description)"
    case .global(let global):
      return global.description
    }
  }

  /// Creates a ScrollMarginBlock from a length value (applies to both start and end)
  public static func length(_ length: Length) -> Self {
    .all(length)
  }

  /// Creates a ScrollMarginBlock using an integer literal (interpreted as pixels for both edges)
  public init(integerLiteral value: Int) {
    self = .all(.px(Double(value)))
  }

  /// Creates a ScrollMarginBlock using a floating-point literal (interpreted as pixels for both edges)
  public init(floatLiteral value: Double) {
    self = .all(.px(value))
  }
}
