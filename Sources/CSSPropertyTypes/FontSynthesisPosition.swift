import CSSTypeTypes
import Foundation

/// The CSS `font-synthesis-position` property lets you specify whether or not a browser may synthesize
/// the subscript and superscript "position" typefaces when they are missing in a font family,
/// while using font-variant-position to set the positions.
///
/// Note: The font-synthesis-position property has no effect when using the <sup> and <sub> elements.
///
/// Example:
/// ```swift
/// .fontSynthesisPosition(.auto)             // font-synthesis-position: auto
/// .fontSynthesisPosition(.none)             // font-synthesis-position: none
/// .fontSynthesisPosition(.global(.inherit)) // font-synthesis-position: inherit
/// ```
///
/// - SeeAlso: [MDN Web Docs on font-synthesis-position](https://developer.mozilla.org/en-US/docs/Web/CSS/font-synthesis-position)
public enum FontSynthesisPosition: Property {

    public static let property: String = "font-synthesis-position"

    /// Indicates that a missing position typeface may be synthesized by the browser if needed.
    case auto

    /// Indicates that the synthesis of a missing position typeface by the browser is not allowed.
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
