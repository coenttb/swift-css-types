import CSSTypeTypes
import Foundation

/// The CSS `font-variant-alternates` property controls the usage of alternate glyphs.
/// These alternate glyphs may be referenced by alternative names defined in @font-feature-values.
///
/// The @font-feature-values at-rule can be used to associate, for a given font face, a human-readable name
/// with a numeric index that controls a particular OpenType font feature.
///
/// Example:
/// ```swift
/// .fontVariantAlternates(.normal)                         // font-variant-alternates: normal
/// .fontVariantAlternates(.historicalForms)                // font-variant-alternates: historical-forms
/// .fontVariantAlternates(.stylistic("fancy"))             // font-variant-alternates: stylistic(fancy)
/// .fontVariantAlternates(.combination([.swash("elegant"), .annotation("circled")]))
///                                                         // font-variant-alternates: swash(elegant) annotation(circled)
/// .fontVariantAlternates(.global(.inherit))               // font-variant-alternates: inherit
/// ```
///
/// - SeeAlso: [MDN Web Docs on font-variant-alternates](https://developer.mozilla.org/en-US/docs/Web/CSS/font-variant-alternates)
public enum FontVariantAlternates: Property {

    public static let property: String = "font-variant-alternates"

    /// This value deactivates alternate glyphs.
    case normal

    /// This value enables historical forms — glyphs that were common in the past but not today.
    /// It corresponds to the OpenType value hist.
    case historicalForms

    /// Stylistic alternates for individual characters.
    /// The parameter is a font-specific name mapped to a number.
    /// It corresponds to the OpenType value salt, like salt 2.
    case stylistic(String)

    /// Stylistic alternatives for sets of characters.
    /// The parameter is a font-specific name mapped to a number.
    /// It corresponds to the OpenType value ssXY, like ss02.
    case styleset(String)

    /// Specific stylistic alternatives for characters (individual character styles).
    /// The parameter is a font-specific name mapped to a number.
    /// It corresponds to the OpenType value cvXY, like cv02.
    case characterVariant(String)

    /// Swash glyphs. The parameter is a font-specific name mapped to a number.
    /// It corresponds to the OpenType values swsh and cswh, like swsh 2 and cswh 2.
    case swash(String)

    /// Ornaments, like fleurons and other dingbat glyphs.
    /// The parameter is a font-specific name mapped to a number.
    /// It corresponds to the OpenType value ornm, like ornm 2.
    case ornaments(String)

    /// Annotations, like circled digits or inverted characters.
    /// The parameter is a font-specific name mapped to a number.
    /// It corresponds to the OpenType value nalt, like nalt 2.
    case annotation(String)

    /// A combination of alternate values.
    case combination([AlternateOption])

    /// Global values
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .normal:
            return "normal"
        case .historicalForms:
            return "historical-forms"
        case .stylistic(let name):
            return "stylistic(\(name))"
        case .styleset(let name):
            return "styleset(\(name))"
        case .characterVariant(let name):
            return "character-variant(\(name))"
        case .swash(let name):
            return "swash(\(name))"
        case .ornaments(let name):
            return "ornaments(\(name))"
        case .annotation(let name):
            return "annotation(\(name))"
        case .combination(let options):
            return options.map { $0.description }.joined(separator: " ")
        case .global(let value):
            return value.description
        }
    }
}

/// Options for the font-variant-alternates property when using the combination case
public enum AlternateOption: Sendable, Hashable, CustomStringConvertible {
    /// Historical forms - glyphs that were common in the past but not today
    case historicalForms

    /// Stylistic alternates for individual characters
    case stylistic(String)

    /// Stylistic alternatives for sets of characters
    case styleset(String)

    /// Specific stylistic alternatives for characters
    case characterVariant(String)

    /// Swash glyphs
    case swash(String)

    /// Ornaments, like fleurons and other dingbat glyphs
    case ornaments(String)

    /// Annotations, like circled digits or inverted characters
    case annotation(String)

    public var description: String {
        switch self {
        case .historicalForms:
            return "historical-forms"
        case .stylistic(let name):
            return "stylistic(\(name))"
        case .styleset(let name):
            return "styleset(\(name))"
        case .characterVariant(let name):
            return "character-variant(\(name))"
        case .swash(let name):
            return "swash(\(name))"
        case .ornaments(let name):
            return "ornaments(\(name))"
        case .annotation(let name):
            return "annotation(\(name))"
        }
    }
}
