import CSSTypeTypes
import Foundation

/// The CSS `flex-wrap` property sets whether flex items wrap onto multiple lines or are forced onto a single line.
///
/// It controls whether the flex container is single-line or multi-line, and the direction of the cross-axis.
///
/// Example:
/// ```swift
/// .flexWrap(.nowrap)              // flex-wrap: nowrap
/// .flexWrap(.wrap)                // flex-wrap: wrap
/// .flexWrap(.wrapReverse)         // flex-wrap: wrap-reverse
/// .flexWrap(.global(.inherit))    // flex-wrap: inherit
/// ```
///
/// - SeeAlso: [MDN Web Docs on flex-wrap](https://developer.mozilla.org/en-US/docs/Web/CSS/flex-wrap)
public enum FlexWrap: Property {
    public static let property: String = "flex-wrap"

    /// Default value. All flex items are laid out in a single line, potentially overflowing the flex container
    case nowrap

    /// Flex items wrap onto multiple lines, from top to bottom
    case wrap

    /// Flex items wrap onto multiple lines, from bottom to top
    case wrapReverse

    /// Global values
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .nowrap:
            return "nowrap"
        case .wrap:
            return "wrap"
        case .wrapReverse:
            return "wrap-reverse"
        case .global(let value):
            return value.description
        }
    }
}
