import CSSTypeTypes
import Foundation

/// The CSS `text-wrap-mode` property controls whether the text inside an element is wrapped.
/// The different values provide alternate ways of wrapping the content of a block element.
/// It can also be set, and reset, using the `text-wrap` shorthand or the `white-space` shorthand.
///
/// - Note: The `white-space-collapse` and `text-wrap-mode` properties can be declared together 
///         using the `white-space` shorthand property.
/// - Note: The name of this property is a placeholder, pending the CSSWG finding a better name.
///
/// Example:
/// ```swift
/// .textWrapMode(.wrap)    // text-wrap-mode: wrap
/// .textWrapMode(.nowrap)  // text-wrap-mode: nowrap
/// ```
///
/// - SeeAlso: [MDN Web Docs on text-wrap-mode](https://developer.mozilla.org/en-US/docs/Web/CSS/text-wrap-mode)
public enum TextWrapMode: Property {
    public static let property: String = "text-wrap-mode"

    /// Text is wrapped across lines at appropriate characters (for example spaces, in languages
    /// like English that use space separators) to minimize overflow. This is the default value.
    case wrap

    /// Text does not wrap across lines. It will overflow its containing element rather than breaking onto a new line.
    case nowrap

    /// Global values
    case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension TextWrapMode: CustomStringConvertible {
    /// Converts the text-wrap-mode value to its CSS string representation
    public var description: String {
        switch self {
        case .wrap:
            return "wrap"

        case .nowrap:
            return "nowrap"

        case .global(let global):
            return global.description
        }
    }
}
