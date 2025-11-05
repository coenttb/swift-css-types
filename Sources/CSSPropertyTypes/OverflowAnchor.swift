import CSSTypeTypes
import Foundation

/// The `overflow-anchor` CSS property provides a way to opt out of the browser's scroll anchoring behavior,
/// which adjusts scroll position to minimize content shifts.
///
/// Scroll anchoring behavior is enabled by default in any browser that supports it. This property
/// allows you to control whether an element should be considered as a potential anchor point
/// when the browser adjusts scroll position in response to content changes.
///
/// Example:
/// ```swift
/// .overflowAnchor(.auto)    // overflow-anchor: auto
/// .overflowAnchor(.none)    // overflow-anchor: none
/// ```
///
/// - Note: Changing this property to `none` is typically only required if you are experiencing problems
///         with scroll anchoring in a document or part of a document and need to turn the behavior off.
///
/// - SeeAlso: [MDN Web Docs on overflow-anchor](https://developer.mozilla.org/en-US/docs/Web/CSS/overflow-anchor)
public enum OverflowAnchor: Property {
    public static let property: String = "overflow-anchor"

    /// The element becomes a potential anchor when adjusting scroll position (default)
    case auto

    /// The element won't be selected as a potential anchor
    case none

    /// Global CSS value
    case global(CSSTypeTypes.Global)

    /// CSS string representation
    public var description: String {
        switch self {
        case .auto:
            return "auto"
        case .none:
            return "none"
        case .global(let global):
            return global.description
        }
    }
}
