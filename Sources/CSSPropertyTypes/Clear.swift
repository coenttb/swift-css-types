import CSSTypeTypes
import Foundation

/// The CSS `clear` property sets whether an element must be moved below (cleared) floating elements that precede it.
/// The clear property applies to floating and non-floating elements.
///
/// Example:
/// ```swift
/// .clear(.none)          // clear: none
/// .clear(.left)          // clear: left
/// .clear(.right)         // clear: right
/// .clear(.both)          // clear: both
/// .clear(.inlineStart)   // clear: inline-start
/// .clear(.inlineEnd)     // clear: inline-end
/// ```
///
/// When applied to non-floating blocks, it moves the border edge of the element down until it is below the margin edge
/// of all relevant floats. This affects the position of later elements in the document flow.
///
/// - Note: If an element contains only floated elements, its height collapses to nothing.
///         You can prevent this by setting `display: flow-root` on the container.
///
/// - SeeAlso: [MDN Web Docs on clear](https://developer.mozilla.org/en-US/docs/Web/CSS/clear)
public enum Clear: Property {
    public static let property: String = "clear"

    /// The element is not moved down to clear past floating elements.
    case none

    /// The element is moved down to clear past left floats.
    case left

    /// The element is moved down to clear past right floats.
    case right

    /// The element is moved down to clear past both left and right floats.
    case both

    /// The element is moved down to clear floats on the start side of its containing block
    /// (left floats in ltr scripts, right floats in rtl scripts).
    case inlineStart

    /// The element is moved down to clear floats on the end side of its containing block
    /// (right floats in ltr scripts, left floats in rtl scripts).
    case inlineEnd

    /// Global values
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .none: return "none"
        case .left: return "left"
        case .right: return "right"
        case .both: return "both"
        case .inlineStart: return "inline-start"
        case .inlineEnd: return "inline-end"
        case .global(let global): return global.description
        }
    }
}
