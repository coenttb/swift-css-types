import Foundation

/// Represents CSS generic font family keywords.
///
/// Generic font families are used in the `font-family` property to specify broad categories
/// of fonts when specific font families are not available. The browser will select an
/// appropriate font from the specified generic family.
///
/// Example:
/// ```swift
/// .fontFamily([.specific("Helvetica"), .specific("Arial"), .sansSerif])
/// .fontFamily([.specific("Courier New"), .monospace])
/// ```
///
/// - SeeAlso: [MDN Web Docs on generic-family](https://developer.mozilla.org/en-US/docs/Web/CSS/generic-family)
public enum GenericFamily: String, Sendable, Hashable {
    /// Fonts with serifs (small strokes at the edges of letters)
    ///
    /// Serif fonts generally have finishing strokes, flared or tapering ends.
    /// Common examples include Times New Roman, Georgia, and Garamond.
    case serif

    /// Fonts without serifs
    ///
    /// Sans-serif fonts have plain stroke endings without ornamentation.
    /// Common examples include Arial, Helvetica, and Verdana.
    case sansSerif = "sans-serif"

    /// Fonts where all characters have the same width
    ///
    /// Monospace fonts have fixed-width characters, making them ideal for code.
    /// Common examples include Courier, Consolas, and Monaco.
    case monospace

    /// Fonts that resemble handwriting
    ///
    /// Cursive fonts generally have joining strokes or other cursive characteristics.
    /// Common examples include Comic Sans MS, Brush Script, and Zapf Chancery.
    case cursive

    /// Decorative fonts for display purposes
    ///
    /// Fantasy fonts are primarily decorative and often contain playful representations
    /// of characters. Common examples include Impact, Papyrus, and Broadway.
    case fantasy

    /// The default user interface font for the current platform
    ///
    /// System-ui font automatically uses the system's native UI font,
    /// providing a platform-specific appearance.
    case systemUi = "system-ui"

    /// The default serif UI font for the current platform
    ///
    /// A serif version of the system's user interface font.
    case uiSerif = "ui-serif"

    /// The default sans-serif UI font for the current platform
    ///
    /// A sans-serif version of the system's user interface font.
    case uiSansSerif = "ui-sans-serif"

    /// The default monospace UI font for the current platform
    ///
    /// A monospace version of the system's user interface font.
    case uiMonospace = "ui-monospace"

    /// The default rounded UI font for the current platform
    ///
    /// A version of the system's user interface font with rounded features.
    case uiRounded = "ui-rounded"

    /// Fonts designed for mathematical expressions
    ///
    /// Math fonts contain specialized glyphs for mathematical notation,
    /// supporting superscript, subscript, brackets, and other symbols.
    case math

    /// Fonts specifically designed for emoji characters
    ///
    /// Emoji fonts are optimized for displaying colorful emoji characters.
    case emoji

    /// A particular style of Chinese characters
    ///
    /// Fangsong is a style between serif-style Song and cursive-style Kai forms,
    /// often used in official Chinese government documents.
    case fangsong
}

/// Provides string conversion for CSS output
extension GenericFamily: CustomStringConvertible {
    /// Converts the generic font family to its CSS string representation
    public var description: String {
        return rawValue
    }
}
