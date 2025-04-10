import Foundation
import CSSTypeTypes

/// The CSS `scrollbar-width` property allows the author to set the desired thickness of an element's scrollbars
/// when they are shown.
///
/// The purpose of the scrollbar-width is to optimize the space occupied by the scrollbar on a page or element.
/// The predefined keyword values indicate to the user agent whether a normal or smaller scrollbar should be rendered.
/// Avoid using none, as hiding a scrollbar negatively impacts accessibility.
///
/// Example:
/// ```swift
/// .scrollbarWidth(.auto)             // scrollbar-width: auto
/// .scrollbarWidth(.thin)             // scrollbar-width: thin
/// .scrollbarWidth(.none)             // scrollbar-width: none
/// .scrollbarWidth(.global(.inherit)) // scrollbar-width: inherit
/// ```
///
/// - SeeAlso: [MDN Web Docs on scrollbar-width](https://developer.mozilla.org/en-US/docs/Web/CSS/scrollbar-width)
public enum ScrollbarWidth: Property {
    public static let property: String = "scrollbar-width"
    
    /// The default scrollbar width for the platform
    case auto
    
    /// A thin scrollbar width variant on platforms that provide that option, 
    /// or a thinner scrollbar than the default platform scrollbar width
    case thin
    
    /// No scrollbar shown, however the element will still be scrollable
    case none
    
    /// Global values
    case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension ScrollbarWidth: CustomStringConvertible {
    public var description: String {
        switch self {
        case .auto:
            return "auto"
            
        case .thin:
            return "thin"
            
        case .none:
            return "none"
            
        case .global(let global):
            return global.description
        }
    }
}
