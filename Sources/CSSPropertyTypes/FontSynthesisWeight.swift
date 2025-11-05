import CSSTypeTypes
import Foundation

/// The CSS `font-synthesis-weight` property lets you specify whether or not the browser may synthesize
/// the bold typeface when it is missing in a font family.
///
/// Example:
/// ```swift
/// .fontSynthesisWeight(.auto)             // font-synthesis-weight: auto
/// .fontSynthesisWeight(.none)             // font-synthesis-weight: none
/// .fontSynthesisWeight(.global(.inherit)) // font-synthesis-weight: inherit
/// ```
///
/// - SeeAlso: [MDN Web Docs on font-synthesis-weight](https://developer.mozilla.org/en-US/docs/Web/CSS/font-synthesis-weight)
public enum FontSynthesisWeight: Property {
    public static let property: String = "font-synthesis-weight"

    /// Indicates that the missing bold typeface may be synthesized by the browser if needed.
    case auto

    /// Indicates that the synthesis of the missing bold typeface by the browser is not allowed.
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
