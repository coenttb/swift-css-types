//
// ScrollPaddingInline.swift


import CSSTypeTypes

/// The `scroll-padding-inline` CSS property is a shorthand property that sets the scroll padding of an element 
/// in the inline dimension. This allows the author to exclude regions of the scrollport that are obscured 
/// by other content (such as fixed-positioned toolbars or sidebars) or to put more breathing room between 
/// a targeted element and the edges of the scrollport.
///
/// ```css
/// scroll-padding-inline: auto;
/// scroll-padding-inline: 10px;
/// scroll-padding-inline: 1em 0.5em;
/// scroll-padding-inline: 10%;
/// ```
public enum ScrollPaddingInline: Property, LengthPercentageConvertible, CustomStringConvertible {
    public static let property: String = "scroll-padding-inline"
    
    /// Keyword values
    case auto
    
    /// A single value for both the start and end inline paddings
    case lengthPercentage(LengthPercentage)
    
    /// Two values for start and end inline paddings
    case start_end(start: LengthPercentage, end: LengthPercentage)
    
    /// Global CSS value
    case global(CSSTypeTypes.Global)
    
    public var description: String {
        switch self {
        case .auto:
            return "auto"
        case .lengthPercentage(let value):
            return value.description
        case .start_end(let start, let end):
            return "\(start.description) \(end.description)"
        case .global(let global):
            return global.description
        }
    }
    
    public static func all(_ value: CSSTypeTypes.LengthPercentage) -> ScrollPaddingInline {
        .lengthPercentage(value)
    }
}
