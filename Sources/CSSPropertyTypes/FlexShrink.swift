import CSSTypeTypes
import Foundation

/// The CSS `flex-shrink` property defines how much a flex item will shrink relative to the rest of the flex items in the container.
///
/// The flex-shrink factor determines how much a flex item will shrink when there isn't enough space in the flex container.
///
/// Example:
/// ```swift
/// .flexShrink(1)                  // flex-shrink: 1
/// .flexShrink(0)                  // flex-shrink: 0
/// .flexShrink(.global(.inherit))  // flex-shrink: inherit
/// ```
///
/// - SeeAlso: [MDN Web Docs on flex-shrink](https://developer.mozilla.org/en-US/docs/Web/CSS/flex-shrink)
public enum FlexShrink: Property, ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
  public static let property: String = "flex-shrink"

  /// A number specifying how much the flex item will shrink
  case number(Number)

  /// Global values
  case global(CSSTypeTypes.Global)

  // MARK: - Initializers for literal expressions

  /// Create a flex-shrink value from an integer literal
  public init(integerLiteral value: Int) {
    self = .number(.init(value))
  }

  /// Create a flex-shrink value from a floating point literal
  public init(floatLiteral value: Double) {
    self = .number(.init(value))
  }

  public var description: String {
    switch self {
    case .number(let number):
      return number.description
    case .global(let value):
      return value.description
    }
  }
}
