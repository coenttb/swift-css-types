import CSSTypeTypes
import Foundation

/// The CSS `margin-block-start` property defines the logical block start margin of an element.
///
/// This property maps to a physical margin depending on the element's writing mode, directionality,
/// and text orientation. It corresponds to the different physical margin properties as follows:
/// - In `horizontal-tb` (horizontal top-to-bottom) writing mode, it maps to `margin-top`
/// - In `vertical-rl` (vertical right-to-left) writing mode, it maps to `margin-right`
/// - In `vertical-lr` (vertical left-to-right) writing mode, it maps to `margin-left`
///
/// Examples:
/// ```swift
/// .marginBlockStart(.auto)                // margin-block-start: auto
/// .marginBlockStart(.px(20))              // margin-block-start: 20px
/// .marginBlockStart(.percentage(10))      // margin-block-start: 10%
/// .marginBlockStart(.em(2.5))             // margin-block-start: 2.5em
/// .marginBlockStart(.zero)                // margin-block-start: 0
/// ```
///
/// - SeeAlso: [MDN Web Docs on margin-block-start](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-block-start)
public enum MarginBlockStart: Property, LengthPercentageConvertible, ExpressibleByIntegerLiteral,
  ExpressibleByFloatLiteral
{
  public static let property: String = "margin-block-start"
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
