//
// ScrollMarginTop.swift

import CSSTypeTypes

/// The `scroll-margin-top` CSS property defines the top margin of the scroll snap area that is used
/// for snapping this element to the snapport. This property is not interpolable according to CSS standards.
///
/// Scroll snap areas are the parts of an element that are visually closest to the scroll container's
/// snapport when the scroll position is manipulated.
///
/// ```css
/// scroll-margin-top: 10px;
/// scroll-margin-top: 1em;
/// scroll-margin-top: 0;
/// ```
public enum ScrollMarginTop: Property, LengthConvertible, ExpressibleByIntegerLiteral,
  ExpressibleByFloatLiteral, CustomStringConvertible
{
  public static let property: String = "scroll-margin-top"

  /// A length value for the top margin
  case length(Length)

  /// Global CSS value
  case global(CSSTypeTypes.Global)

  public var description: String {
    switch self {
    case .length(let length): return length.description
    case .global(let global): return global.description
    }
  }

  /// Creates a ScrollMarginTop using an integer literal (interpreted as pixels)
  public init(integerLiteral value: Int) {
    self = .length(.px(Double(value)))
  }

  /// Creates a ScrollMarginTop using a floating-point literal (interpreted as pixels)
  public init(floatLiteral value: Double) {
    self = .length(.px(value))
  }
}
