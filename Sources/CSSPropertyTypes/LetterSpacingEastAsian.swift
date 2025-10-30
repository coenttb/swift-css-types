import CSSTypeTypes
import Foundation

/// The CSS `letter-spacing-east-asian` property controls the spacing behavior specifically
/// for East Asian text (Chinese, Japanese, Korean).
///
/// This property allows finer control over East Asian text, separate from the standard
/// `letter-spacing` property, which is primarily designed for Latin and similar scripts.
///
/// - Note: This is a non-standard property and may not be supported in all browsers.
///
/// Example:
/// ```swift
/// .letterSpacingEastAsian(.normal)                  // letter-spacing-east-asian: normal
/// .letterSpacingEastAsian(.length(0.05, .em))       // letter-spacing-east-asian: 0.05em
/// ```
///
/// - SeeAlso: [CSS Text Module Level 3](https://www.w3.org/TR/css-text-3/)
public enum LetterSpacingEastAsian: Property, LengthConvertible {
  public static let property: String = "letter-spacing-east-asian"
  /// Uses the default spacing as specified by the font.
  case normal

  /// Adds or removes a specific amount of space between East Asian characters.
  /// Positive values increase spacing, negative values decrease it.
  case length(Length)

  /// Global values
  case global(CSSTypeTypes.Global)

}

/// CSS Output conversion
extension LetterSpacingEastAsian: CustomStringConvertible {
  /// Converts the letter-spacing-east-asian value to its CSS string representation
  public var description: String {
    switch self {
    case .normal:
      return "normal"

    case .length(let value):
      return value.description

    case .global(let global):
      return global.description
    }
  }
}
