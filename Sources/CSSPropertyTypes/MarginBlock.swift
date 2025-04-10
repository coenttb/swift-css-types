import Foundation
import CSSTypeTypes

/// Defines the logical block start and end margins of an element.
///
/// The margin-block CSS shorthand property defines the logical block start and end margins of an element,
/// which maps to physical margins depending on the element's writing mode, directionality, and text orientation.
///
/// This property corresponds to margin-top and margin-bottom in horizontal writing modes with a top-to-bottom 
/// block flow direction, or to margin-right and margin-left in vertical writing modes.
///
/// [Learn more at MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-block)
public enum MarginBlock: Property, LengthPercentageConvertible {
    public static let property: String = "margin-block"
    
    public static func lengthPercentage(_ value: CSSTypeTypes.LengthPercentage) -> MarginBlock {
        .uniform(value)
    }
    
    /// The same value applied to both start and end margins
    case uniform(LengthPercentage)
    
    /// Different values for start and end margins
    case separate(start: LengthPercentage, end: LengthPercentage)
    
    /// Global CSS values
    case global(CSSTypeTypes.Global)
    
    /// Initialize with different values for start and end
    public init(_ start: LengthPercentage, _ end: LengthPercentage) {
        self = .separate(start: start, end: end)
    }
    
    /// Initialize with a single value for both start and end
    public init(_ value: LengthPercentage) {
        self = .uniform(value)
    }
    
    /// Initialize with different Length values for start and end
    public init(_ start: Length, _ end: Length) {
        self = .separate(start: .length(start), end: .length(end))
    }
    
    /// Initialize with a single Length value for both start and end
    public init(_ value: Length) {
        self = .uniform(.length(value))
    }
}

extension MarginBlock: CustomStringConvertible {
    public var description: String {
        switch self {
        case .uniform(let value):
            return value.description
            
        case .separate(let start, let end):
            return "\(start.description) \(end.description)"
            
        case .global(let global):
            return global.description
        }
    }
}
