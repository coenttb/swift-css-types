import CSSTypeTypes
import Foundation

/// The CSS `font-synthesis` shorthand property lets you specify whether or not the browser may synthesize
/// the bold, italic, small-caps, and/or subscript and superscript typefaces when they are missing
/// in the specified font-family.
///
/// Example:
/// ```swift
/// .fontSynthesis(.none)                                  // font-synthesis: none
/// .fontSynthesis(.weight)                               // font-synthesis: weight
/// .fontSynthesis(.style)                                // font-synthesis: style
/// .fontSynthesis(.smallCaps)                            // font-synthesis: small-caps
/// .fontSynthesis(.position)                             // font-synthesis: position
/// .fontSynthesis([.weight, .style])                     // font-synthesis: weight style
/// .fontSynthesis([.weight, .style, .smallCaps])         // font-synthesis: weight style small-caps
/// .fontSynthesis(.global(.inherit))                     // font-synthesis: inherit
/// ```
///
/// - SeeAlso: [MDN Web Docs on font-synthesis](https://developer.mozilla.org/en-US/docs/Web/CSS/font-synthesis)
public enum FontSynthesis: Property {

  public static let property: String = "font-synthesis"

  /// Indicates that no bold, italic, small-caps, or position typeface may be synthesized by the browser.
  case none

  /// Indicates that the missing bold typeface may be synthesized by the browser if needed.
  case weight

  /// Indicates that the italic typeface may be synthesized by the browser if needed.
  case style

  /// Indicates that the small-caps typeface may be synthesized by the browser if needed.
  case smallCaps

  /// Indicates that the subscript and superscript typeface may be synthesized by the browser,
  /// if needed, when using font-variant-position.
  case position

  /// Specifies a combination of font synthesis options
  case combination([SynthesisOption])

  /// Global values
  case global(CSSTypeTypes.Global)

  /// Individual font synthesis options that can be combined
  public enum SynthesisOption: String, Sendable, CustomStringConvertible {
    /// Weight synthesis option
    case weight

    /// Style synthesis option
    case style

    /// Small-caps synthesis option
    case smallCaps = "small-caps"

    /// Position synthesis option
    case position

    public var description: String {
      return rawValue
    }
  }

  public var description: String {
    switch self {
    case .none:
      return "none"
    case .weight:
      return "weight"
    case .style:
      return "style"
    case .smallCaps:
      return "small-caps"
    case .position:
      return "position"
    case .combination(let options):
      return options.map { $0.description }.joined(separator: " ")
    case .global(let value):
      return value.description
    }
  }
}
