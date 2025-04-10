import Foundation
import CSSTypeTypes

/// Margin value
public enum Margin: Property, LengthPercentageConvertible {
    public static let property: String = "margin"
    
    
    /// Auto margin (browser calculates the margin)
    case auto
    
    case lengthPercentage(_ value: CSSTypeTypes.LengthPercentage)
    
    case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension Margin: CustomStringConvertible {
    /// Converts the margin value to its CSS string representation
    public var description: String {
        switch self {
        case .auto:
            return "auto"
            
        case .lengthPercentage(let value):
            return value.description
        case .global(let value):
            return value.description
        }
    }
}

