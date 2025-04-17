import Foundation
import CSSTypeTypes

/// The CSS `object-fit` property sets how the content of a replaced element, such as an 
/// `<img>` or `<video>`, should be resized to fit its container.
///
/// Example:
/// ```swift
/// .objectFit(.contain)     // object-fit: contain
/// .objectFit(.cover)       // object-fit: cover
/// .objectFit(.fill)        // object-fit: fill
/// .objectFit(.none)        // object-fit: none
/// .objectFit(.scaleDown)   // object-fit: scale-down
/// ```
///
/// - Note: This property applies only to replaced elements, and has no effect on elements
///         like `<iframe>`, `<embed>`, and `<fencedframe>`.
/// - Note: You can alter the alignment of the replaced element's content object within 
///         the element's box using the `object-position` property.
///
/// - SeeAlso: [MDN Web Docs on object-fit](https://developer.mozilla.org/en-US/docs/Web/CSS/object-fit)
public enum ObjectFit: Property {
    public static let property: String = "object-fit"
    
    /// The available keyword values for the `object-fit` property
    public enum Keyword: Sendable, Hashable, CustomStringConvertible {
        /// The replaced content is scaled to maintain its aspect ratio while fitting within 
        /// the element's content box. The entire object is made to fill the box, while 
        /// preserving its aspect ratio, resulting in "letterboxing" or "pillarboxing" if 
        /// the aspect ratios don't match.
        case contain
        
        /// The replaced content is sized to maintain its aspect ratio while filling the element's 
        /// entire content box. If the aspect ratios don't match, the object will be clipped to fit.
        case cover
        
        /// The replaced content is sized to fill the element's content box. The entire object 
        /// will completely fill the box. If the aspect ratios don't match, the object will be 
        /// stretched to fit.
        case fill
        
        /// The replaced content is not resized.
        case none
        
        /// The content is sized as if `none` or `contain` were specified, whichever would 
        /// result in a smaller concrete object size.
        case scaleDown
        
        public var description: String {
            switch self {
            case .contain: return "contain"
            case .cover: return "cover"
            case .fill: return "fill"
            case .none: return "none"
            case .scaleDown: return "scale-down"
            }
        }
    }
    
    /// Specifies a keyword value for the object-fit property
    case keyword(Keyword)
    
    /// Specifies a global value
    case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension ObjectFit: CustomStringConvertible {
    /// Converts the object-fit value to its CSS string representation
    public var description: String {
        switch self {
        case .keyword(let keyword):
            return keyword.description
            
        case .global(let global):
            return global.description
        }
    }
}

/// Convenience static properties
extension ObjectFit {
    /// The replaced content is scaled to maintain its aspect ratio while fitting within 
    /// the element's content box.
    public static let contain: ObjectFit = .keyword(.contain)
    
    /// The replaced content is sized to maintain its aspect ratio while filling the element's 
    /// entire content box.
    public static let cover: ObjectFit = .keyword(.cover)
    
    /// The replaced content is sized to fill the element's content box.
    public static let fill: ObjectFit = .keyword(.fill)
    
    /// The replaced content is not resized.
    public static let none: ObjectFit = .keyword(.none)
    
    /// The content is sized as if none or contain were specified, whichever would 
    /// result in a smaller concrete object size.
    public static let scaleDown: ObjectFit = .keyword(.scaleDown)
}
