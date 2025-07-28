import CSSTypeTypes
import Foundation

/// The CSS `font-kerning` property sets whether the browser should use kerning information 
/// stored in a font.
///
/// Kerning affects how letters are spaced. In well-kerned fonts, this feature makes character 
/// spacing more uniform and pleasant to read by reducing white space between certain character combinations.
///
/// Example:
/// ```swift
/// .fontKerning(.auto)      // font-kerning: auto
/// .fontKerning(.normal)    // font-kerning: normal
/// .fontKerning(.none)      // font-kerning: none
/// .fontKerning(.global(.inherit))  // font-kerning: inherit
/// ```
///
/// - SeeAlso: [MDN Web Docs on font-kerning](https://developer.mozilla.org/en-US/docs/Web/CSS/font-kerning)
public enum FontKerning: Property {
    public static let property: String = "font-kerning"

    /// The browser determines whether font kerning should be used or not.
    /// For example, some browsers will disable kerning on small fonts, 
    /// since applying it could harm the readability of text.
    case auto

    /// Font kerning information stored in the font must be applied.
    case normal

    /// Font kerning information stored in the font is disabled.
    case none

    /// Global values
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .auto:
            return "auto"
        case .normal:
            return "normal"
        case .none:
            return "none"
        case .global(let value):
            return value.description
        }
    }
}
