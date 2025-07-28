import CSSTypeTypes
import Foundation

/// The CSS `flex` property is a shorthand property that sets how a flex item will grow or shrink to fit the available space in its flex container.
///
/// It combines the following properties:
/// - `flex-grow`: How much the item will grow relative to other flex items
/// - `flex-shrink`: How much the item will shrink relative to other flex items
/// - `flex-basis`: The initial size of the flex item
///
/// Example:
/// ```swift
/// .flex(.number(1), .number(1), .auto)          // flex: 1 1 auto
/// .flex(.none)                                  // flex: none
/// .flex(.auto)                                  // flex: auto
/// .flex(.initial)                               // flex: initial
/// .flex(.global(.inherit))                      // flex: inherit
/// ```
///
/// - SeeAlso: [MDN Web Docs on flex](https://developer.mozilla.org/en-US/docs/Web/CSS/flex)
public enum Flex: Property {
    public static let property: String = "flex"

    /// Default value. Items do not grow or shrink. Equivalent to `0 1 auto`.
    case initial

    /// Items can grow and shrink as needed. Equivalent to `1 1 auto`.
    case auto

    /// Items do not grow or shrink. Equivalent to `0 0 auto`.
    case none

    /// A specific combination of grow, shrink, and basis values
    case custom(grow: FlexGrow, shrink: FlexShrink, basis: FlexBasis)

    /// Global values
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .initial:
            return "initial"
        case .auto:
            return "auto"
        case .none:
            return "none"
        case .custom(let grow, let shrink, let basis):
            return "\(grow) \(shrink) \(basis)"
        case .global(let value):
            return value.description
        }
    }
}
