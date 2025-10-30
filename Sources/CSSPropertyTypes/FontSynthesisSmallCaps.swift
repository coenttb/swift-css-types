import CSSTypeTypes
import Foundation

/// The CSS `font-synthesis-small-caps` property lets you specify whether or not the browser may synthesize
/// small-caps typeface when it is missing in a font family. Small-caps glyphs typically use the form of
/// uppercase letters but are reduced to the size of lowercase letters.
///
/// Example:
/// ```swift
/// .fontSynthesisSmallCaps(.auto)             // font-synthesis-small-caps: auto
/// .fontSynthesisSmallCaps(.none)             // font-synthesis-small-caps: none
/// .fontSynthesisSmallCaps(.global(.inherit)) // font-synthesis-small-caps: inherit
/// ```
///
/// - SeeAlso: [MDN Web Docs on font-synthesis-small-caps](https://developer.mozilla.org/en-US/docs/Web/CSS/font-synthesis-small-caps)
public enum FontSynthesisSmallCaps: Property {

  public static let property: String = "font-synthesis-small-caps"

  /// Indicates that the missing small-caps typeface may be synthesized by the browser if needed.
  case auto

  /// Indicates that the synthesis of the missing small-caps typeface by the browser is not allowed.
  case none

  /// Global values
  case global(CSSTypeTypes.Global)

  public var description: String {
    switch self {
    case .auto:
      return "auto"
    case .none:
      return "none"
    case .global(let value):
      return value.description
    }
  }
}
