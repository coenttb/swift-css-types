import Foundation
import CSSTypeTypes

/// The CSS `list-style-position` property sets the position of the marker relative to the list item.
///
/// This property specifies whether the list item markers should appear inside or outside the 
/// principal block box of each list item. When set to `inside`, the marker is inside the principal 
/// block box and participates in the flow of the list item. When set to `outside` (the default),
/// the marker is outside the principal block box.
///
/// Example:
/// ```swift
/// .listStylePosition(.inside)            // list-style-position: inside
/// .listStylePosition(.outside)           // list-style-position: outside
/// .listStylePosition(.global(.inherit))  // list-style-position: inherit
/// ```
///
/// - SeeAlso: [MDN Web Docs on list-style-position](https://developer.mozilla.org/en-US/docs/Web/CSS/list-style-position)
public enum ListStylePosition: Property {
    public static let property: String = "list-style-position"
    /// Marker is placed inside the principal block box
    case inside
    
    /// Marker is placed outside the principal block box (default)
    case outside
    
    /// Global values
    case global(CSSTypeTypes.Global)
    
    // MARK: - CustomStringConvertible
    
    public var description: String {
        switch self {
        case .inside:
            return "inside"
        case .outside:
            return "outside"
        case .global(let global):
            return global.description
        }
    }
}
