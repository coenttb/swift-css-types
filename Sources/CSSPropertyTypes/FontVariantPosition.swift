import CSSTypeTypes
import Foundation

/// The CSS `font-variant-position` property controls the use of alternate, smaller glyphs
/// that are positioned as superscript or subscript.
///
/// The glyphs are positioned relative to the baseline of the font, which remains unchanged.
/// These alternate glyphs are specially designed for superscript and subscript positions
/// and typically have better proportions than scaled-down regular glyphs.
///
/// This property is important for mathematical notation, footnotes, chemical formulas,
/// and other specialized text that requires proper subscript and superscript formatting
/// across different languages and writing systems.
///
/// Example:
/// ```swift
/// .fontVariantPosition(.normal)       // font-variant-position: normal
/// .fontVariantPosition(.sub)          // font-variant-position: sub
/// .fontVariantPosition(.super)        // font-variant-position: super
/// ```
///
/// - Note: These alternate glyphs share the same em-box and baseline as the rest of the font.
///         They are graphically enhanced but have no effect on line-height or other box characteristics.
///         If a character doesn't have such a glyph, the whole run is rendered using synthesized glyphs.
///
/// - SeeAlso: [MDN Web Docs on font-variant-position](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-position)
public enum FontVariantPosition: Property {

    public static let property: String = "font-variant-position"

    /// Deactivates alternate superscript and subscript glyphs.
    case normal

    /// Activates subscript alternate glyphs. If a character in the run doesn't have
    /// this glyph, all characters are rendered using synthesized glyphs.
    case sub

    /// Activates superscript alternate glyphs. If a character in the run doesn't have
    /// this glyph, all characters are rendered using synthesized glyphs.
    case `super`

    /// Global values
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .normal:
            return "normal"
        case .sub:
            return "sub"
        case .super:
            return "super"
        case .global(let global):
            return global.description
        }
    }
}
