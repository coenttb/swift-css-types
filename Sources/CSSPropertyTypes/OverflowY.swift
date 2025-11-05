import CSSTypeTypes
import Foundation

/// The `overflow-y` CSS property sets what shows when content overflows a block-level element's
/// top and bottom edges. This may be nothing, a scroll bar, or the overflow content.
///
/// This property determines how overflowed content that extends beyond an element's height is handled.
///
/// Example:
/// ```swift
/// .overflowY(.visible)    // overflow-y: visible
/// .overflowY(.hidden)     // overflow-y: hidden
/// .overflowY(.clip)       // overflow-y: clip
/// .overflowY(.scroll)     // overflow-y: scroll
/// .overflowY(.auto)       // overflow-y: auto
/// ```
///
/// - Note: If `overflow-x` is hidden, scroll, or auto, and `overflow-y` is visible (default),
///         the visible value will be implicitly computed as auto.
///
/// - SeeAlso: [MDN Web Docs on overflow-y](https://developer.mozilla.org/en-US/docs/Web/CSS/overflow-y)
public enum OverflowY: Property {
    public static let property: String = "overflow-y"

    /// Content is not clipped and may be visible outside the element's padding box
    case visible

    /// Content is clipped if necessary to fit vertically in the element's padding box, no scrollbars
    case hidden

    /// Content is clipped at the element's overflow clip edge, defined using overflow-clip-margin
    case clip

    /// Content is clipped if necessary to fit vertically, scrollbars always visible
    case scroll

    /// Content clipped if necessary, scrollbars only shown when needed
    case auto

    /// Global CSS value
    case global(CSSTypeTypes.Global)

    /// CSS string representation
    public var description: String {
        switch self {
        case .visible:
            return "visible"
        case .hidden:
            return "hidden"
        case .clip:
            return "clip"
        case .scroll:
            return "scroll"
        case .auto:
            return "auto"
        case .global(let global):
            return global.description
        }
    }
}
