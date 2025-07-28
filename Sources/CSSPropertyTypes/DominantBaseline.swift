import CSSTypeTypes
import Foundation

/// The `dominant-baseline` CSS property specifies the baseline used to align a box's text
/// and inline-level content.
///
/// This property determines which of a font's baselines is used for alignment, which affects
/// how text is positioned vertically. It is particularly important in SVG text elements and
/// when aligning text in different scripts that may use different baseline conventions.
///
/// - Note: This property is primarily used in SVG elements like `<text>`, `<textPath>`, 
///         `<tref>`, and `<tspan>`.
///
/// - SeeAlso: [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/CSS/dominant-baseline)
public enum DominantBaseline: Property {
    public static let property: String = "dominant-baseline"

    /// The value depends on the writing mode, using alphabetic for horizontal
    /// and central for vertical writing modes
    case auto

    /// Uses the alphabetic baseline from the font
    case alphabetic

    /// Uses the central baseline from the font
    case central

    /// Uses the hanging baseline from the font, which is used in scripts like Devanagari
    case hanging

    /// Uses the ideographic baseline from the font, which is used for Chinese, Japanese, and Korean
    case ideographic

    /// Uses the mathematical baseline from the font, useful for aligning mathematical symbols
    case mathematical

    /// Uses the middle baseline from the font
    case middle

    /// Uses the bottom edge of the font's em box as the baseline
    case textBottom

    /// Uses the top edge of the font's em box as the baseline
    case textTop

    /// Global values
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .auto:
            return "auto"
        case .alphabetic:
            return "alphabetic"
        case .central:
            return "central"
        case .hanging:
            return "hanging"
        case .ideographic:
            return "ideographic"
        case .mathematical:
            return "mathematical"
        case .middle:
            return "middle"
        case .textBottom:
            return "text-bottom"
        case .textTop:
            return "text-top"
        case .global(let value):
            return value.description
        }
    }
}
