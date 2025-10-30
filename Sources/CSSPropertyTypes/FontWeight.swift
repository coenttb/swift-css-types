import CSSTypeTypes
import Foundation

/// The CSS `font-weight` property sets the weight (or boldness) of the font.
///
/// The weights available depend on the font-family that is currently set. Font weights can be
/// specified using numeric values from 1 to 1000, standard keywords, or relative keywords.
///
/// Example:
/// ```swift
/// .fontWeight(.normal)           // font-weight: normal
/// .fontWeight(.bold)             // font-weight: bold
/// .fontWeight(.number(500))      // font-weight: 500
/// .fontWeight(.lighter)          // font-weight: lighter
/// .fontWeight(.global(.inherit)) // font-weight: inherit
/// ```
///
/// - SeeAlso: [MDN Web Docs on font-weight](https://developer.mozilla.org/en-US/docs/Web/CSS/font-weight)
public enum FontWeight: Property, ExpressibleByIntegerLiteral {
  public static let property: String = "font-weight"

  /// Numeric weight values between 1 and 1000
  case number(Int)

  /// Normal font weight (equivalent to 400)
  case normal

  /// Bold font weight (equivalent to 700)
  case bold

  /// One relative font weight lighter than the parent element
  case lighter

  /// One relative font weight heavier than the parent element
  case bolder

  /// Global values
  case global(CSSTypeTypes.Global)

  // MARK: - ExpressibleByIntegerLiteral

  /// Create a font-weight value from an integer literal
  public init(integerLiteral value: Int) {
    self = .number(value)
  }

  // MARK: - Convenience properties for common weight names

  /// Thin (Hairline) font weight - 100
  public static let thin: FontWeight = .number(100)

  /// Extra Light (Ultra Light) font weight - 200
  public static let extraLight: FontWeight = .number(200)

  /// Light font weight - 300
  public static let light: FontWeight = .number(300)

  /// Medium font weight - 500
  public static let medium: FontWeight = .number(500)

  /// Semi Bold (Demi Bold) font weight - 600
  public static let semiBold: FontWeight = .number(600)

  /// Extra Bold (Ultra Bold) font weight - 800
  public static let extraBold: FontWeight = .number(800)

  /// Black (Heavy) font weight - 900
  public static let black: FontWeight = .number(900)

  /// Extra Black (Ultra Black) font weight - 950
  public static let extraBlack: FontWeight = .number(950)

  public var description: String {
    switch self {
    case .number(let value):
      // Ensure the value is between 1 and 1000
      let clampedValue = max(1, min(1000, value))
      return "\(clampedValue)"
    case .normal:
      return "normal"
    case .bold:
      return "bold"
    case .lighter:
      return "lighter"
    case .bolder:
      return "bolder"
    case .global(let value):
      return value.description
    }
  }
}
