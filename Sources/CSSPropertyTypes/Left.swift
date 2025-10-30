//
//  Left.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 28/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `left` property participates in specifying the horizontal position of a positioned element.
/// This inset property has no effect on non-positioned elements.
///
/// Example:
/// ```swift
/// .left(.px(0))         // left: 0px
/// .left(.em(4))         // left: 4em
/// .left(.percentage(10)) // left: 10%
/// .left(.auto)          // left: auto
/// ```
///
/// The effect of `left` depends on how the element is positioned:
/// - When `position` is `absolute` or `fixed`, the `left` property specifies the distance between the element's
///   left edge and the left edge of its containing block.
/// - When `position` is `relative`, the `left` property specifies the distance the element's left edge is moved
///   to the right of its normal position.
/// - When `position` is `sticky`, the `left` property is used to compute the sticky-constraint rectangle.
/// - When `position` is `static`, the `left` property has no effect.
///
/// - SeeAlso: [MDN Web Docs on left](https://developer.mozilla.org/en-US/docs/Web/CSS/left)
public enum Left: Property, LengthPercentageConvertible {
  public static let property: String = "left"
  /// A specific length or percentage value
  case lengthPercentage(LengthPercentage)

  /// Browser determines the position automatically
  case auto

  /// Global values
  case global(CSSTypeTypes.Global)

  /// Converts the left value to its CSS string representation
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

/// Factory methods for creating Left values
extension Left {
  /// Sets the left position to 0
  public static let zero: Left = .px(0)
}

/// Convenient numeric literal support
extension Left: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
  /// Creates a left position from an integer literal (in pixels)
  ///
  /// - Parameter value: The pixel value as an integer
  public init(integerLiteral value: Int) {
    self = .px(Double(value))
  }

  /// Creates a left position from a floating-point literal (in pixels)
  ///
  /// - Parameter value: The pixel value as a double
  public init(floatLiteral value: Double) {
    self = .px(value)
  }
}
