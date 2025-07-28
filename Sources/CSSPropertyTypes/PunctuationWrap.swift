import CSSTypeTypes
import Foundation

/// The CSS `punctuation-wrap` property determines whether punctuation marks should hang
/// at the start or end of a line or be placed within the line box.
///
/// This property is particularly important for CJK (Chinese, Japanese, Korean) typography
/// where certain punctuation marks should hang outside the text box for visual alignment
/// and proper spacing.
///
/// - Note: This property is sometimes also called `hanging-punctuation` in some CSS implementations.
///
/// Example:
/// ```swift
/// .punctuationWrap(.none)          // punctuation-wrap: none
/// .punctuationWrap(.hangingAll)    // punctuation-wrap: hanging-all
/// ```
///
/// - SeeAlso: [CSS Text Module Level 3](https://www.w3.org/TR/css-text-3/#hanging-punctuation-property)
public enum PunctuationWrap: Property {
    public static let property: String = "punctuation-wrap"

    /// Punctuation marks should not hang. All characters are placed within the line box.
    case none

    /// Opening punctuation may hang at the start of a line.
    case hangingInitial

    /// Closing punctuation may hang at the end of a line.
    case hangingFinal

    /// Punctuation marks may hang at the start and end of a line.
    case hangingAll

    /// Allows punctuation marks to be wrapped normally without requiring them to be
    /// at the start or end of a line. This is useful for CJK punctuation that normally
    /// wouldn't break.
    case allowEnd

    /// Global value
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .none: return "none"
        case .hangingInitial: return "hanging-initial"
        case .hangingFinal: return "hanging-final"
        case .hangingAll: return "hanging-all"
        case .allowEnd: return "allow-end"
        case .global(let global): return global.description
        }
    }
}
