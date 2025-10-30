import CSSTypeTypes
import Foundation

/// The CSS `top` property sets the vertical position of a positioned element.
/// This inset property has no effect on non-positioned elements.
///
/// Example:
/// ```swift
/// .top(.px(0))      // top: 0px
/// .top(.em(4))      // top: 4em
/// .top(.percentage(10)) // top: 10%
/// .top(.auto)       // top: auto
/// ```
///
/// The effect of `top` depends on how the element is positioned:
/// - When `position` is `absolute` or `fixed`, the `top` property specifies the distance between the element's
///   top edge and the top edge of its containing block.
/// - When `position` is `relative`, the `top` property specifies the distance the element's top edge is moved
///   below its normal position.
/// - When `position` is `sticky`, the `top` property is used to compute the sticky-constraint rectangle.
/// - When `position` is `static`, the `top` property has no effect.
///
/// - SeeAlso: [MDN Web Docs on top](https://developer.mozilla.org/en-US/docs/Web/CSS/top)
public enum Top: Sendable, Hashable, LengthPercentageConvertible, Property {
  public static let property: String = "top"
  case lengthPercentage(LengthPercentage)

  /// Browser determines the position automatically
  case auto

  /// Global values
  case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension Top: CustomStringConvertible {
  /// Converts the top value to its CSS string representation
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

/// Factory methods for creating Top values
extension Top {
  /// Sets the top position to 0
  public static let zero: Top = .px(0)
}

/// Convenient numeric literal support
extension Top: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
  /// Creates a top position from an integer literal (in pixels)
  ///
  /// - Parameter value: The pixel value as an integer
  public init(integerLiteral value: Int) {
    self = .px(Double(value))
  }

  /// Creates a top position from a floating-point literal (in pixels)
  ///
  /// - Parameter value: The pixel value as a double
  public init(floatLiteral value: Double) {
    self = .px(value)
  }
}
