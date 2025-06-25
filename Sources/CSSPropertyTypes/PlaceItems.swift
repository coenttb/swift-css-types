import Foundation
import CSSTypeTypes

/// The CSS place-items shorthand property aligns items along both the block and inline directions at once.
///
/// It sets the values of the align-items and justify-items properties. If the second value is not set,
/// the first value is also used for it.
///
/// Example:
/// ```swift
/// .placeItems(.center)                // place-items: center
/// .placeItems(.stretch, .center)      // place-items: stretch center
/// .placeItems(.start, .end)           // place-items: start end
/// .placeItems(.baseline(), .stretch)  // place-items: baseline stretch
/// ```
///
/// - SeeAlso: [MDN Web Docs on place-items](https://developer.mozilla.org/en-US/docs/Web/CSS/place-items)
public enum PlaceItems: Property {
    public static let property: String = "place-items"
    /// Combines both align-items and justify-items values
    case combined(AlignItems, JustifyItems)
    
    /// When only one value is specified, it applies to both properties
    case single(AlignItems)
    
    /// Global values
    case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension PlaceItems: CustomStringConvertible {
    /// Converts the place-items value to its CSS string representation
    public var description: String {
        switch self {
        case .combined(let alignItems, let justifyItems):
            return "\(alignItems) \(justifyItems)"
            
        case .single(let alignItems):
            return alignItems.description
            
        case .global(let global):
            return global.description
        }
    }
}

// Convenience initializers
extension PlaceItems {
    /// Creates a PlaceItems with the same value for both align-items and justify-items
    public static var normal: Self {
        return .single(.normal)
    }
    
    /// Creates a PlaceItems with the same value for both align-items and justify-items
    public static var stretch: Self {
        return .single(.stretch)
    }
    
    /// Creates a PlaceItems with the same value for both align-items and justify-items
    public static var baseline: Self {
        return .single(.baseline)
    }
    
    /// Creates a PlaceItems with the same value for both align-items and justify-items
    public static var firstBaseline: Self {
        return .single(.firstBaseline)
    }
    
    /// Creates a PlaceItems with the same value for both align-items and justify-items
    public static var lastBaseline: Self {
        return .single(.lastBaseline)
    }
    
    /// Creates a PlaceItems with the same value for both align-items and justify-items
    public static var center: Self {
        return .single(.center)
    }
    
    /// Creates a PlaceItems with the same value for both align-items and justify-items
    public static var start: Self {
        return .single(.start)
    }
    
    /// Creates a PlaceItems with the same value for both align-items and justify-items
    public static var end: Self {
        return .single(.end)
    }
    
    /// Creates a PlaceItems with the same value for both align-items and justify-items
    public static var selfStart: Self {
        return .single(.selfStart)
    }
    
    /// Creates a PlaceItems with the same value for both align-items and justify-items
    public static var selfEnd: Self {
        return .single(.selfEnd)
    }
    
    /// Creates a PlaceItems with the same value for both align-items and justify-items
    public static var flexStart: Self {
        return .single(.flexStart)
    }
    
    /// Creates a PlaceItems with the same value for both align-items and justify-items
    public static var flexEnd: Self {
        return .single(.flexEnd)
    }
    
    /// Creates a PlaceItems with the same value for both align-items and justify-items
    public static var anchorCenter: Self {
        return .single(.anchorCenter)
    }
    
    /// Creates a PlaceItems with the same value for both align-items and justify-items
    public static func safe(_ position: SelfPosition) -> Self {
        return .single(.safe(position))
    }
    
    /// Creates a PlaceItems with the same value for both align-items and justify-items
    public static func unsafe(_ position: SelfPosition) -> Self {
        return .single(.unsafe(position))
    }
}
