import CSSTypeTypes
import Foundation

/// The CSS `padding-top` property sets the height of the padding area on the top of an element.
///
/// An element's padding area is the space between its content and its border.
///
/// Example:
/// ```swift
/// .paddingTop(.px(20))      // padding-top: 20px
/// .paddingTop(.em(1.5))     // padding-top: 1.5em
/// .paddingTop(.percentage(10)) // padding-top: 10%
/// .paddingTop(0)            // padding-top: 0
/// ```
///
/// - SeeAlso: [MDN Web Docs on padding-top](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-top)
public enum PaddingTop: Property, LengthPercentageConvertible {
  public static let property: String = "padding-top"

  /// A length or percentage value for the top padding
  case lengthPercentage(LengthPercentage)

  /// Global values
  case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension PaddingTop: CustomStringConvertible {
  /// Converts the padding-top value to its CSS string representation
  public var description: String {
    switch self {
    case .lengthPercentage(let lengthPercentage):
      return lengthPercentage.description

    case .global(let global):
      return global.description
    }
  }
}

extension PaddingTop: ExpressibleByIntegerLiteral {
  /// Creates a padding-top from an integer literal (interpreted as pixels)
  ///
  /// - Parameter value: The padding in pixels
  public init(integerLiteral value: Int) {
    self = .lengthPercentage(.px(Double(value)))
  }
}

extension PaddingTop: ExpressibleByFloatLiteral {
  /// Creates a padding-top from a floating-point literal (interpreted as pixels)
  ///
  /// - Parameter value: The padding in pixels
  public init(floatLiteral value: Double) {
    self = .lengthPercentage(.px(value))
  }
}
