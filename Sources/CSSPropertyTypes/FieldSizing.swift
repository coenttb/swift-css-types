import Foundation
import CSSTypeTypes

/// The `field-sizing` CSS property controls the sizing behavior of form control elements
/// that have a default preferred size.
///
/// This property allows form controls (like inputs and textareas) to adjust their size to fit their
/// contents, rather than maintaining a fixed size. It's particularly useful for making input fields
/// grow and shrink as text is entered.
///
/// - Note: This is an experimental property and may not be supported in all browsers.
///
/// - SeeAlso: [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/CSS/field-sizing)
public enum FieldSizing: Property {
    public static let property: String = "field-sizing"
    
    /// Allows the element to adjust its size to fit its contents
    case content
    
    /// Sets a fixed size for the element (default behavior)
    case fixed
    
    /// Global values
    case global(CSSTypeTypes.Global)
    
    public var description: String {
        switch self {
        case .content:
            return "content"
        case .fixed:
            return "fixed"
        case .global(let value):
            return value.description
        }
    }
}
