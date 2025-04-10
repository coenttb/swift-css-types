import Foundation
import CSSTypeTypes

/// The `overflow-inline` CSS property sets what shows when content overflows the inline start
/// and end edges of a box. This may be nothing, a scroll bar, or the overflow content.
///
/// This is a logical property that maps to `overflow-x` or `overflow-y` depending on the element's
/// writing mode, direction, and text orientation.
///
/// Example:
/// ```swift
/// .overflowInline(.visible)   // overflow-inline: visible
/// .overflowInline(.hidden)    // overflow-inline: hidden
/// .overflowInline(.clip)      // overflow-inline: clip
/// .overflowInline(.scroll)    // overflow-inline: scroll
/// .overflowInline(.auto)      // overflow-inline: auto
/// ```
///
/// - Note: In horizontal writing modes like English, `overflow-inline` is equivalent to `overflow-x`.
///         In vertical writing modes, it's equivalent to `overflow-y`.
///
/// - SeeAlso: [MDN Web Docs on overflow-inline](https://developer.mozilla.org/en-US/docs/Web/CSS/overflow-inline)
public enum OverflowInline: Property {
    public static let property: String = "overflow-inline"
    
    /// Content is not clipped and may be visible outside the inline edges of the element's box
    case visible
    
    /// Content is clipped if necessary to fit in the inline dimension, no scrollbars
    case hidden
    
    /// Content is clipped at the element's overflow clip edge defined using overflow-clip-margin
    case clip
    
    /// Content is clipped if necessary to fit in the inline dimension, scrollbars always visible
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
