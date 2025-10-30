import CSSTypeTypes
import Foundation

/// The CSS `font-synthesis-style` property lets you specify whether or not the browser may synthesize
/// the oblique typeface when it is missing in a font family.
///
/// Example:
/// ```swift
/// .fontSynthesisStyle(.auto)             // font-synthesis-style: auto
/// .fontSynthesisStyle(.none)             // font-synthesis-style: none
/// .fontSynthesisStyle(.global(.inherit)) // font-synthesis-style: inherit
/// ```
///
/// - SeeAlso: [MDN Web Docs on font-synthesis-style](https://developer.mozilla.org/en-US/docs/Web/CSS/font-synthesis-style)
public enum FontSynthesisStyle: Property {

  public static let property: String = "font-synthesis-style"

  /// Indicates that the missing oblique typeface may be synthesized by the browser if needed.
  case auto

  /// Indicates that the synthesis of the missing oblique typeface by the browser is not allowed.
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
