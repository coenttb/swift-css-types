import Foundation
import CSSTypeTypes

/// The `overflow-x` CSS property sets what shows when content overflows a block-level element's 
/// left and right edges. This may be nothing, a scroll bar, or the overflow content.
///
/// This property determines how overflowed content that extends beyond an element's width is handled.
///
/// Example:
/// ```swift
/// .overflowX(.visible)    // overflow-x: visible
/// .overflowX(.hidden)     // overflow-x: hidden
/// .overflowX(.clip)       // overflow-x: clip
/// .overflowX(.scroll)     // overflow-x: scroll
/// .overflowX(.auto)       // overflow-x: auto
/// ```
///
/// - Note: If `overflow-y` is hidden, scroll, or auto, and `overflow-x` is visible (default),
///         the visible value will be implicitly computed as auto.
///
/// - SeeAlso: [MDN Web Docs on overflow-x](https://developer.mozilla.org/en-US/docs/Web/CSS/overflow-x)
public enum OverflowX: Property {
    public static let property: String = "overflow-x"
    /// Content is not clipped and may be visible outside the element's padding box
    case visible
    
    /// Content is clipped if necessary to fit horizontally in the element's padding box, no scrollbars
    case hidden
    
    /// Content is clipped at the element's overflow clip edge, defined using overflow-clip-margin
    case clip
    
    /// Content is clipped if necessary to fit horizontally, scrollbars always visible
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
