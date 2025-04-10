import Foundation
import CSSTypeTypes

/// The CSS `inset-inline` property is a shorthand that defines the logical inline start and end
/// offsets of an element, which map to physical offsets depending on the element's writing mode,
/// directionality, and text orientation.
///
/// This property corresponds to the `left` and `right`, or `top` and `bottom` properties
/// depending on the values defined for `writing-mode`, `direction`, and `text-orientation`.
///
/// This property is essential for creating layouts that adapt properly to different writing systems:
/// - In `horizontal-tb` (horizontal top-to-bottom) writing mode, it maps to `left` and `right`
/// - In `vertical` writing modes, it maps to `top` and `bottom`
///
/// This property has no effect on non-positioned elements.
///
/// Example:
/// ```swift
/// .insetInline(.auto)                           // inset-inline: auto
/// .insetInline(20)                              // inset-inline: 20px
/// .insetInline(.same(.percentage(10)))          // inset-inline: 10%
/// .insetInline(.sides(20, 40))                  // inset-inline: 20px 40px
/// .insetInline(.start(.auto), .end(30))         // inset-inline: auto 30px
/// ```
///
/// - SeeAlso: [MDN Web Docs on inset-inline](https://developer.mozilla.org/en-US/docs/Web/CSS/inset-inline)
public enum InsetInline: Property, LengthPercentageConvertible {
    public static let property: String = "inset-inline"
    
        
    /// Auto value for both start and end
    case auto
    
    /// Same value for both start and end
    case same(LengthPercentage)
    
    /// Different values for start and end
    case sides(start: LengthPercentage, end: LengthPercentage?)
 
    /// Global values
    case global(CSSTypeTypes.Global)
        
    /// Represents a value that can be either a length/percentage or auto
    public enum Value: Equatable, Sendable {
        /// Auto value (browser-determined)
        case auto
        
        /// Specific length or percentage value
        case lengthPercentage(LengthPercentage)
        
        public var description: String {
            switch self {
            case .auto:
                return "auto"
            case .lengthPercentage(let lengthPercentage):
                return lengthPercentage.description
            }
        }
    }
    
    public var description: String {
        switch self {
        case .auto:
            return "auto"
            
        case .same(let value):
            return value.description
            
        case .sides(let start, let end):
            if start == end {
                return start.description
            } else {
                switch end {
                case .some(let end):
                    return "\(start.description) \(end.description)"
                case .none:
                    return start.description
                }
            }
    
            
        case .global(let global):
            return global.description
        }
    }
}

/// Convenience initializers for InsetInline
extension InsetInline {
    public static func lengthPercentage(_ value: CSSTypeTypes.LengthPercentage) -> InsetInline {
        .same(value)
    }
    
    /// Creates an inset-inline with start and end values
    public init(start: LengthPercentage, end: LengthPercentage) {
        self = .sides(start: start, end: end)
    }
 

}
