import CSSTypeTypes
import Foundation

/// The CSS `font-variant-caps` property controls the use of alternate glyphs for capital letters.
///
/// When a given font includes capital letter glyphs of multiple different sizes, this property selects
/// the most appropriate ones. If petite capital glyphs are not available, they are rendered using small
/// capital glyphs. If these are not present, the browser synthesizes them from the uppercase glyphs.
///
/// Example:
/// ```swift
/// .fontVariantCaps(.normal)         // font-variant-caps: normal
/// .fontVariantCaps(.smallCaps)      // font-variant-caps: small-caps
/// .fontVariantCaps(.allSmallCaps)   // font-variant-caps: all-small-caps
/// .fontVariantCaps(.petiteCaps)     // font-variant-caps: petite-caps
/// .fontVariantCaps(.global(.inherit)) // font-variant-caps: inherit
/// ```
///
/// - SeeAlso: [MDN Web Docs on font-variant-caps](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-caps)
public enum FontVariantCaps: Property {

    public static let property: String = "font-variant-caps"

    /// Deactivates the use of alternate glyphs.
    case normal

    /// Enables display of small capitals (OpenType feature: smcp).
    /// Small-caps glyphs typically use the form of uppercase letters but are displayed using
    /// the same size as lowercase letters.
    case smallCaps

    /// Enables display of small capitals for both upper and lowercase letters
    /// (OpenType features: c2sc, smcp).
    case allSmallCaps

    /// Enables display of petite capitals (OpenType feature: pcap).
    case petiteCaps

    /// Enables display of petite capitals for both upper and lowercase letters
    /// (OpenType features: c2pc, pcap).
    case allPetiteCaps

    /// Enables display of mixture of small capitals for uppercase letters with normal
    /// lowercase letters (OpenType feature: unic).
    case unicase

    /// Enables display of titling capitals (OpenType feature: titl). Uppercase letter glyphs
    /// are often designed for use with lowercase letters. When used in all uppercase titling
    /// sequences they can appear too strong. Titling capitals are designed specifically for
    /// this situation.
    case titlingCaps

    /// Global values
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .normal:
            return "normal"
        case .smallCaps:
            return "small-caps"
        case .allSmallCaps:
            return "all-small-caps"
        case .petiteCaps:
            return "petite-caps"
        case .allPetiteCaps:
            return "all-petite-caps"
        case .unicase:
            return "unicase"
        case .titlingCaps:
            return "titling-caps"
        case .global(let value):
            return value.description
        }
    }
}
