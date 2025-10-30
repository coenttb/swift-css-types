import CSSTypeTypes
import Foundation

/// The CSS `padding-block-end` property defines the logical block end padding of an element,
/// which maps to a physical padding depending on the element's writing mode, directionality, and text orientation.
///
/// This is part of CSS Logical Properties, which are writing-mode aware equivalents of physical properties.
/// For example, in a horizontal top-to-bottom writing mode (like English), `padding-block-end` is equivalent
/// to `padding-bottom`.
///
/// Example:
/// ```swift
/// .paddingBlockEnd(.px(20))      // padding-block-end: 20px
/// .paddingBlockEnd(.em(1.5))     // padding-block-end: 1.5em
/// .paddingBlockEnd(.percentage(10)) // padding-block-end: 10%
/// .paddingBlockEnd(0)            // padding-block-end: 0
/// ```
///
/// - SeeAlso: [MDN Web Docs on padding-block-end](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-block-end)
public enum PaddingBlockEnd: Property, LengthPercentageConvertible {
  public static let property: String = "padding-block-end"

  /// A length or percentage value for the block-end padding
  case lengthPercentage(LengthPercentage)

  /// Global values
  case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension PaddingBlockEnd: CustomStringConvertible {
  /// Converts the padding-block-end value to its CSS string representation
  public var description: String {
    switch self {
    case .lengthPercentage(let lengthPercentage):
      return lengthPercentage.description

    case .global(let global):
      return global.description
    }
  }
}

extension PaddingBlockEnd: ExpressibleByIntegerLiteral {
  /// Creates a padding-block-end from an integer literal (interpreted as pixels)
  ///
  /// - Parameter value: The padding in pixels
  public init(integerLiteral value: Int) {
    self = .lengthPercentage(.px(Double(value)))
  }
}

extension PaddingBlockEnd: ExpressibleByFloatLiteral {
  /// Creates a padding-block-end from a floating-point literal (interpreted as pixels)
  ///
  /// - Parameter value: The padding in pixels
  public init(floatLiteral value: Double) {
    self = .lengthPercentage(.px(value))
  }
}
