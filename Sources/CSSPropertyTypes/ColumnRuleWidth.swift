import Foundation
import CSSTypeTypes

/// The CSS `column-rule-width` property sets the width of the line drawn between columns in a multi-column layout.
///
/// Example:
/// ```swift
/// .columnRuleWidth(.thin)       // column-rule-width: thin
/// .columnRuleWidth(.medium)     // column-rule-width: medium
/// .columnRuleWidth(.thick)      // column-rule-width: thick
/// .columnRuleWidth(.px(12))     // column-rule-width: 12px
/// .columnRuleWidth(.em(2.5))    // column-rule-width: 2.5em
/// ```
///
/// This property is similar to `border-width` but applies to the space between columns in a multi-column layout.
///
/// - SeeAlso: [MDN Web Docs on column-rule-width](https://developer.mozilla.org/en-US/docs/Web/CSS/column-rule-width)
public enum ColumnRuleWidth: Property, LengthConvertible {
    public static let property: String = "column-rule-width"
    /// Predefined width values
    case thin
    case medium
    case thick
    
    /// A specific length value
    case length(Length)
    
    /// Global values
    case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension ColumnRuleWidth: CustomStringConvertible {
    public var description: String {
        switch self {
        case .thin:
            return "thin"
            
        case .medium:
            return "medium"
            
        case .thick:
            return "thick"
            
        case .length(let length):
            return length.description
            
        case .global(let global):
            return global.description
        }
    }
}
