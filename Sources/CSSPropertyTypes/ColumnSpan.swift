import Foundation
import CSSTypeTypes

/// The CSS `column-span` property makes it possible for an element to span across all columns when its value is set to `all`.
/// An element that spans more than one column is called a spanning element.
///
/// Example:
/// ```swift
/// .columnSpan(.none)  // column-span: none
/// .columnSpan(.all)   // column-span: all
/// ```
///
/// This property is commonly used with headings in multi-column layouts to make the heading span across all columns.
///
/// - SeeAlso: [MDN Web Docs on column-span](https://developer.mozilla.org/en-US/docs/Web/CSS/column-span)
public enum ColumnSpan: Property {
    public static let property: String = "column-span"
    /// The element does not span multiple columns.
    case none
    
    /// The element spans across all columns. Content in the normal flow that appears before the element
    /// is automatically balanced across all columns before the element appears.
    /// The element establishes a new block formatting context.
    case all
    
    /// Global values
    case global(CSSTypeTypes.Global)
    
    public var description: String {
        switch self {
        case .none:
            return "none"
        case .all:
            return "all"
        case .global(let global):
            return global.description
        }
    }
}
