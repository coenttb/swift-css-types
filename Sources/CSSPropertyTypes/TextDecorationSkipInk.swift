import Foundation
import CSSTypeTypes

/// Specifies how overlines and underlines are drawn when they pass over glyph ascenders and descenders.
///
/// The text-decoration-skip-ink CSS property specifies how overlines and underlines are drawn
/// when they pass over glyph ascenders and descenders.
///
/// Note: text-decoration-skip-ink is not part of the text-decoration shorthand.
///
/// [Learn more at MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration-skip-ink)
///
/// # Example
/// ```swift
/// let style = Text.textDecorationSkipInk(.auto)
/// let style = Text.textDecorationSkipInk(.none)
/// let style = Text.textDecorationSkipInk(.all)
/// ```
///
/// # CSS Values
/// ```css
/// text-decoration-skip-ink: auto;
/// text-decoration-skip-ink: none;
/// text-decoration-skip-ink: all;
/// ```
public enum TextDecorationSkipInk: Property {
    public static let property: String = "text-decoration-skip-ink"
    
    /// The default — the browser may interrupt underlines and overlines so that they
    /// do not touch or closely approach a glyph. That is, they are interrupted where
    /// they would otherwise cross over a glyph.
    case auto
    
    /// Underlines and overlines are drawn across the full length of the text content,
    /// including parts that cross over glyph descenders and ascenders.
    case none
    
    /// The browser must interrupt underlines and overlines so that they do not touch
    /// or closely approach a glyph. This can be helpful with certain Chinese, Japanese,
    /// or Korean (CJK) fonts, where the auto behavior might not create interruptions.
    case all
    
    /// Global CSS values
    case global(CSSTypeTypes.Global)
}

extension TextDecorationSkipInk: CustomStringConvertible {
    public var description: String {
        switch self {
        case .auto:
            return "auto"
        case .none:
            return "none"
        case .all:
            return "all"
        case .global(let global):
            return global.description
        }
    }
}
