//
//  Right.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `right` property participates in specifying the horizontal position of a positioned element.
///
/// This property has no effect on non-positioned elements (where `position` is `static`).
/// For absolute or fixed positioning, it specifies the distance between the element's right edge and
/// the right edge of its containing block. For relative positioning, it specifies how far to move
/// the element to the left from its normal position.
///
/// Example:
/// ```swift
/// .right(.px(20))            // right: 20px
/// .right(.percentage(10))    // right: 10%
/// .right(.auto)              // right: auto
/// ```
///
/// - Note: When both `left` and `right` are specified, the element will stretch to satisfy both if possible.
///         If not possible (e.g., when width is specified), the left value takes precedence in LTR layouts.
///
/// - SeeAlso: [MDN Web Docs on right](https://developer.mozilla.org/en-US/docs/Web/CSS/right)
public enum Right: Property, LengthPercentageConvertible {
  public static let property: String = "right"

  /// A length-percentage value
  case lengthPercentage(LengthPercentage)

  /// Default value, position is determined by normal flow or left property
  case auto

  /// Global value
  case global(CSSTypeTypes.Global)

  public var description: String {
    switch self {
    case .lengthPercentage(let lengthPercentage):
      return lengthPercentage.description
    case .auto:
      return "auto"
    case .global(let global):
      return global.description
    }
  }
}
