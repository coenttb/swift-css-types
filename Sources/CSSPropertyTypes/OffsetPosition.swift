//
// OffsetPosition.swift
//
import Foundation
import CSSTypeTypes

/// The CSS `offset-position` property defines the initial position of an element along a path.
///
/// This property is used with `offset-path` to determine where the element is initially placed 
/// before it starts moving along the path. It's especially useful when the path itself doesn't 
/// specify a starting position.
///
/// Example:
/// ```swift
/// .offsetPosition(.normal)        // offset-position: normal
/// .offsetPosition(.auto)          // offset-position: auto
/// .offsetPosition(.center)        // offset-position: center
/// .offsetPosition(.topRight)      // offset-position: top right
/// .offsetPosition(.percentage(30, 70)) // offset-position: 30% 70%
/// .offsetPosition(.offsets(.bottom, .px(10), .right, .px(20))) // offset-position: bottom 10px right 20px
/// ```
///
/// - SeeAlso: [MDN Web Docs on offset-position](https://developer.mozilla.org/en-US/docs/Web/CSS/offset-position)
public enum OffsetPosition: Property {
    public static let property: String = "offset-position"
    
    /// Element is placed at 50% 50% of the containing block (default)
    case normal
    
    /// Element is placed at its own top-left corner
    case auto
    
    /// A position value (usi   ng the Position type)
    case position(CSSTypeTypes.Position)
    
    /// Global value
    case global(CSSTypeTypes.Global)
    
    /// Creates an offset-position with a position value
    ///
    /// - Parameter position: The position value
    public init(_ position: CSSTypeTypes.Position) {
        self = .position(position)
    }
}

/// CSS Output conversion
extension OffsetPosition: CustomStringConvertible {
    /// Converts the offset-position value to its CSS string representation
    public var description: String {
        switch self {
        case .normal:
            return "normal"
        case .auto:
            return "auto"
        case .position(let position):
            return position.description
        case .global(let global):
            return global.description
        }
    }
}

/// Factory methods for common positions
extension OffsetPosition {
    /// Creates an offset-position with the center position
    public static let center = OffsetPosition(.center)
    
    /// Creates an offset-position with the top position
    public static let top = OffsetPosition(.top)
    
    /// Creates an offset-position with the right position
    public static let right = OffsetPosition(.right)
    
    /// Creates an offset-position with the bottom position
    public static let bottom = OffsetPosition(.bottom)
    
    /// Creates an offset-position with the left position
    public static let left = OffsetPosition(.left)
    
    /// Creates an offset-position with the top-left position
    public static let topLeft = OffsetPosition(.topLeft)
    
    /// Creates an offset-position with the top-right position
    public static let topRight = OffsetPosition(.topRight)
    
    /// Creates an offset-position with the bottom-left position
    public static let bottomLeft = OffsetPosition(.bottomLeft)
    
    /// Creates an offset-position with the bottom-right position
    public static let bottomRight = OffsetPosition(.bottomRight)
    
    /// Creates an offset-position with percentage values
    ///
    /// - Parameters:
    ///   - x: Horizontal percentage (0-100)
    ///   - y: Vertical percentage (0-100)
    /// - Returns: An OffsetPosition with the specified percentage position
    public static func percentage(_ x: Double, _ y: Double) -> OffsetPosition {
        OffsetPosition(.percentage(Percentage(x), Percentage(y)))
    }
    
    /// Creates an offset-position with pixel values
    ///
    /// - Parameters:
    ///   - x: Horizontal position in pixels
    ///   - y: Vertical position in pixels
    /// - Returns: An OffsetPosition with the specified pixel position
    public static func px(_ x: Double, _ y: Double) -> OffsetPosition {
        OffsetPosition(.px(x, y))
    }
    
    /// Creates an offset-position with edge offsets
    ///
    /// - Parameters:
    ///   - edge1: First edge (top, right, bottom, left)
    ///   - offset1: Offset from the first edge
    ///   - edge2: Second edge (top, right, bottom, left)
    ///   - offset2: Offset from the second edge
    /// - Returns: An OffsetPosition with edge offsets (e.g., "bottom 10px right 20px")
    public static func offsets(_ edge1: CSSTypeTypes.Position.Keyword, _ offset1: LengthPercentage, _ edge2: CSSTypeTypes.Position.Keyword, _ offset2: LengthPercentage) -> OffsetPosition {
        OffsetPosition(.offsets(edge1, offset1, edge2, offset2))
    }
    
    /// Creates an offset-position with a single edge and offset
    ///
    /// - Parameters:
    ///   - edge: The edge (top, right, bottom, left)
    ///   - offset: Offset from the edge
    /// - Returns: An OffsetPosition with a single edge offset (e.g., "top 10px")
    public static func offset(_ edge: CSSTypeTypes.Position.Keyword, _ offset: LengthPercentage) -> OffsetPosition {
        OffsetPosition(.keywordValue(edge, offset))
    }
}
