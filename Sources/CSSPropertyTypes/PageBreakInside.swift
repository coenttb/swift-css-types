import Foundation
import CSSTypeTypes

/// The CSS `page-break-inside` property adjusts page breaks inside the current element.
///
/// - Note: This property is deprecated. Modern CSS has replaced it with the `break-inside` property,
///         which works for both paged media and multi-column layouts.
///
/// Example:
/// ```swift
/// .pageBreakInside(.auto)    // page-break-inside: auto
/// .pageBreakInside(.avoid)   // page-break-inside: avoid
/// ```
///
/// - SeeAlso: [MDN Web Docs on page-break-inside](https://developer.mozilla.org/en-US/docs/Web/CSS/page-break-inside)
public enum PageBreakInside: Property {
    public static let property: String = "page-break-inside"
    
    /// Let the browser determine automatically where page breaks should occur (default)
    case auto
    
    /// Avoid page breaks inside the element if possible
    case avoid
    
    /// Global values
    case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension PageBreakInside: CustomStringConvertible {
    /// Converts the page-break-inside value to its CSS string representation
    public var description: String {
        switch self {
        case .auto:
            return "auto"
            
        case .avoid:
            return "avoid"
            
        case .global(let global):
            return global.description
        }
    }
}
