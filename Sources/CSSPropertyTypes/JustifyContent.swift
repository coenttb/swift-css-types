import Foundation
import CSSTypeTypes

/// The CSS justify-content property defines how the browser distributes space between and around
/// content items along the main axis of a flex container and the inline axis of grid and multicol containers.
///
/// In flex layouts, it controls how items are positioned along the main axis. In grid layouts, it controls how
/// the grid columns are positioned within the grid container when the total size of the grid is less than the
/// container size.
///
/// Example:
/// ```swift
/// .justifyContent(.spaceBetween)         // justify-content: space-between
/// .justifyContent(.center)               // justify-content: center
/// .justifyContent(.safe, .end)           // justify-content: safe end
/// .justifyContent(.left)                 // justify-content: left
/// ```
///
/// - SeeAlso: [MDN Web Docs on justify-content](https://developer.mozilla.org/en-US/docs/Web/CSS/justify-content)
public enum JustifyContent: Property {
    public static let property: String = "justify-content"
    /// Default alignment for the layout mode
    case normal
    
    /// Distribution alignment values
    case distribution(ContentDistribution)
    
    /// Positional alignment with optional overflow safety
    case position(OverflowPosition?, ContentPosition)
    
    /// Left alignment
    case left
    
    /// Right alignment
    case right
    
    /// Global values
    case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension JustifyContent: CustomStringConvertible {
    /// Converts the justify-content value to its CSS string representation
    public var description: String {
        switch self {
        case .normal:
            return "normal"
            
        case .distribution(let distribution):
            return distribution.description
            
        case .position(let overflow, let position):
            if let overflow = overflow {
                return "\(overflow) \(position)"
            } else {
                return position.description
            }
            
        case .left:
            return "left"
            
        case .right:
            return "right"
            
        case .global(let global):
            return global.description
        }
    }
}

// Convenience initializers
extension JustifyContent {
    /// Creates a space-between distribution
    public static var spaceBetween: Self {
        return .distribution(.spaceBetween)
    }
    
    /// Creates a space-around distribution
    public static var spaceAround: Self {
        return .distribution(.spaceAround)
    }
    
    /// Creates a space-evenly distribution
    public static var spaceEvenly: Self {
        return .distribution(.spaceEvenly)
    }
    
    /// Creates a stretch distribution
    public static var stretch: Self {
        return .distribution(.stretch)
    }
    
    public static var center: Self {
        .center()
    }
    
    /// Creates a center position
    public static func center(
        overflowPosition: OverflowPosition? = nil
    ) -> Self {
        return .position(overflowPosition, .center)
    }
    
    public static var start: Self {
        .start()
    }
    
    /// Creates a start position
    public static func start(
        overflowPosition: OverflowPosition? = nil
    ) -> Self {
        return .position(overflowPosition, .start)
    }
    
    public static var end: Self {
        .end()
    }
    
    /// Creates an end position
    public static func end(
        overflowPosition: OverflowPosition? = nil
    ) -> Self {
        return .position(overflowPosition, .end)
    }
    
    /// Creates a flex-start position
    public static func flexStart(
        overflowPosition: OverflowPosition? = nil
    ) -> Self {
        return .position(overflowPosition, .flexStart)
    }
    
    /// Creates a flex-end position
    public static func flexEnd(
        overflowPosition: OverflowPosition? = nil
    ) -> Self {
        return .position(overflowPosition, .flexEnd)
    }
    
    /// Creates a safe position alignment
    public static func safe(
        _ position: ContentPosition
    ) -> Self {
        return .position(.safe, position)
    }
    
    /// Creates an unsafe position alignment
    public static func unsafe(
        _ position: ContentPosition
    ) -> Self {
        return .position(.unsafe, position)
    }
}
