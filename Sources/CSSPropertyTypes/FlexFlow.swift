import CSSTypeTypes
import Foundation

/// The CSS `flex-flow` property is a shorthand for the `flex-direction` and `flex-wrap` properties.
///
/// It specifies how flex items are placed in the flex container by setting both the direction and wrapping behavior.
///
/// Example:
/// ```swift
/// .flexFlow(.row, .wrap)                // flex-flow: row wrap
/// .flexFlow(.column, .nowrap)           // flex-flow: column nowrap
/// .flexFlow(.rowReverse, .wrapReverse)  // flex-flow: row-reverse wrap-reverse
/// .flexFlow(.global(.inherit))          // flex-flow: inherit
/// ```
///
/// - SeeAlso: [MDN Web Docs on flex-flow](https://developer.mozilla.org/en-US/docs/Web/CSS/flex-flow)
public enum FlexFlow: Property {
    public static let property: String = "flex-flow"
    /// Specifies both the flex-direction and flex-wrap properties
    case flexFlow(FlexDirection, FlexWrap)

    /// Global values
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .flexFlow(let direction, let wrap):
            return "\(direction) \(wrap)"
        case .global(let value):
            return value.description
        }
    }
}
