import CSSTypeTypes
import Foundation

/// The CSS `font-palette` property allows specifying one of the many palettes contained in a color font.
/// Users can also override the values in a palette or create a new palette by using the @font-palette-values at-rule.
///
/// A font palette takes precedence when coloring a font. The color property will not override a font palette,
/// even if specified with !important.
///
/// Example:
/// ```swift
/// .fontPalette(.normal)             // font-palette: normal
/// .fontPalette(.light)              // font-palette: light
/// .fontPalette(.dark)               // font-palette: dark
/// .fontPalette(.custom("--one"))    // font-palette: --one
/// .fontPalette(.global(.inherit))   // font-palette: inherit
/// ```
///
/// - SeeAlso: [MDN Web Docs on font-palette](https://developer.mozilla.org/en-US/docs/Web/CSS/font-palette)
public enum FontPalette: Property {
    public static let property: String = "font-palette"

    /// Specifies the default color palette or the default glyph colorization (set by the font maker) to be used for the font.
    /// With this setting, the palette in the font at index 0 is rendered.
    case normal

    /// Specifies the first palette in the font that matches 'light' to be used for the font.
    /// Some fonts contain metadata that identify a palette as applicable for a light (close to white) background.
    /// If a font does not have this metadata, the light value behaves as normal.
    case light

    /// Specifies the first palette in the font that matches 'dark' to be used for the font.
    /// Some fonts contain metadata that identify a palette as applicable for a dark (close to black) background.
    /// If a font does not have this metadata, the value behaves as normal.
    case dark

    /// Allows you to specify your own values for the font palette by using the @font-palette-values at-rule.
    /// This value is specified using the <dashed-ident> format.
    case custom(String)

    /// Global values
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .normal:
            return "normal"
        case .light:
            return "light"
        case .dark:
            return "dark"
        case .custom(let identifier):
            return identifier
        case .global(let value):
            return value.description
        }
    }
}
