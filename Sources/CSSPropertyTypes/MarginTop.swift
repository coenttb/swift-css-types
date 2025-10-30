import CSSTypeTypes
import Foundation

/// The CSS `margin-top` property sets the margin area on the top of an element.
///
/// A positive value places the element farther from its neighbors, while a negative value
/// places it closer. This property has no effect on non-replaced inline elements, such as
/// `<span>` or `<code>`.
///
/// Examples:
/// ```swift
/// .marginTop(.auto)                // margin-top: auto
/// .marginTop(.px(20))              // margin-top: 20px
/// .marginTop(.percentage(10))      // margin-top: 10%
/// .marginTop(.em(2.5))             // margin-top: 2.5em
/// .marginTop(.zero)                // margin-top: 0
/// .marginTop(-10)                  // margin-top: -10px (negative margin)
/// ```
///
/// - SeeAlso: [MDN Web Docs on margin-top](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-top)
public enum MarginTop: Property, LengthPercentageConvertible, ExpressibleByIntegerLiteral,
  ExpressibleByFloatLiteral
{
  public static let property: String = "margin-top"

  /// A specific length or percentage value for the margin
  case lengthPercentage(LengthPercentage)

  /// Browser automatically determines the margin
  case auto

  /// Global values
  case global(CSSTypeTypes.Global)

  // MARK: - Protocol Conformance

  /// Implementation of the CustomStringConvertible protocol
  public var description: String {
    switch self {
    case .lengthPercentage(let value):
      return value.description
    case .auto:
      return "auto"
    case .global(let global):
      return global.description
    }
  }

  // MARK: - Convenience initializers

  /// Create a margin value using a float literal as pixels
  public init(floatLiteral value: Double) {
    self = .px(value)
  }

  /// Create a margin value using an integer literal as pixels
  public init(integerLiteral value: Int) {
    self = .px(Double(value))
  }
}

// Allow creation from Length values
extension MarginTop: LengthConvertible {}
