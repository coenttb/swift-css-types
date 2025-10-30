import CSSTypeTypes
import Foundation

/// The CSS `max-height` property sets the maximum height of an element. It prevents
/// the used value of the height property from becoming larger than the value specified for max-height.
///
/// Example:
/// ```swift
/// .maxHeight(.px(150))       // max-height: 150px
/// .maxHeight(.em(20))        // max-height: 20em
/// .maxHeight(.percentage(75))   // max-height: 75%
/// .maxHeight(.ch(40))        // max-height: 40ch
/// .maxHeight(.none)          // max-height: none
/// .maxHeight(.maxContent)    // max-height: max-content
/// ```
///
/// - Note: The element's height is set to the value of max-height whenever max-height is smaller
///         than height (but larger than min-height).
///
/// - SeeAlso: [MDN Web Docs on max-height](https://developer.mozilla.org/en-US/docs/Web/CSS/max-height)
public enum MaxHeight: Property, LengthPercentageConvertible {

  public static let property: String = "size"

  case lengthPercentage(LengthPercentage)

  /// No maximum width constraint
  case none

  case maxContent

  case minContent

  case fitContent(LengthPercentage? = nil)

  case stretch

  /// A global CSS value
  case global(CSSTypeTypes.Global)

  public static let fitContent: Self = .fitContent(nil)
}

/// CSS Output conversion
extension MaxHeight: CustomStringConvertible {
  /// Converts the max-height value to its CSS string representation
  public var description: String {
    switch self {
    case .lengthPercentage(let lengthPercentage):
      lengthPercentage.description
    case .none:
      "none"
    case .maxContent:
      "max-content"
    case .minContent:
      "min-content"
    case .fitContent(let lengthPercentage):
      if let description = lengthPercentage?.description {
        "fit-content(\(description)"
      } else {
        "fit-content"
      }
    case .stretch:
      "stretch"
    case .global(let global):
      global.description
    }
  }
}

/// Allow for numeric literals to be used directly
extension MaxHeight: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
  /// Creates a max-height with a pixel value from an integer literal
  ///
  /// - Parameter value: The pixel value as an integer
  public init(integerLiteral value: Int) {
    self = .px(Double(value))
  }

  /// Creates a max-height with a pixel value from a floating-point literal
  ///
  /// - Parameter value: The pixel value as a double
  public init(floatLiteral value: Double) {
    self = .px(value)
  }
}
