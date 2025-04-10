import Foundation
import CSSTypeTypes

/// The CSS `offset` shorthand property sets all the properties required for animating
/// an element along a defined path.
///
/// This shorthand combines the following properties:
/// - `offset-path` - The path the element follows
/// - `offset-distance` - How far along the path the element is
/// - `offset-rotate` - How the element is oriented
/// - `offset-anchor` - The point within the element that follows the path
/// - `offset-position` - The initial position (for when offset-path is none)
///
/// Example:
/// ```swift
/// .offset(.path("M 20 60 L 120 60 L 70 10 L 20 60"), .percentage(0), .auto, nil)
/// // CSS: offset: path("M 20 60 L 120 60 L 70 10 L 20 60") 0% auto;
/// 
/// .offset(.url("circle.svg"), .percentage(40), .angle(.deg(30)), nil)
/// // CSS: offset: url(#circle.svg) 40% 30deg;
///
/// .offset(.position(.topLeft)) // offset: left top;
/// ```
///
/// - SeeAlso: [MDN Web Docs on offset](https://developer.mozilla.org/en-US/docs/Web/CSS/offset)
public enum Offset: Property {
    public static let property: String = "offset"
    
    /// Complete offset definition with path, distance, rotation and anchor
    /// - Parameters:
    ///   - path: The offset-path value
    ///   - distance: The offset-distance value
    ///   - rotate: The offset-rotate value
    ///   - anchor: The offset-anchor value
    case path(path: OffsetPath, distance: OffsetDistance? = nil, rotate: OffsetRotate? = nil, anchor: OffsetAnchor? = nil)
    
    /// Position-based offset with optional anchor
    /// - Parameters:
    ///   - position: The offset-position value
    ///   - anchor: The offset-anchor value
    case position(OffsetPosition, OffsetAnchor?)
    
    /// Keyword value 'auto'
    case auto
    
    /// Keyword value 'none'
    case none
    
    /// Global value
    case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension Offset: CustomStringConvertible {
    /// Converts the offset value to its CSS string representation
    public var description: String {
        switch self {
        case .path(let path, let distance, let rotate, let anchor):
            var result = "\(path)"
            
            if let d = distance {
                result += " \(d.description)"
            }
            
            if let r = rotate {
                result += " \(r.description)"
            }
            
            if let a = anchor {
                result += " / \(a.description)"
            }
            
            return result
            
        case .position(let position, let anchor):
            var result = position.description
            
            if let a = anchor {
                result += " / \(a.description)"
            }
            
            return result
            
        case .auto:
            return "auto"
            
        case .none:
            return "none"
            
        case .global(let global):
            return global.description
        }
    }
}

/// Convenience initializers for Offset
extension Offset {
    /// Creates an offset with a path
    ///
    /// - Parameter pathData: SVG path data string
    /// - Returns: An Offset with the specified path
    public static func path(_ pathData: String) -> Self {
        .path(path: OffsetPath.path(pathData), distance: nil, rotate: nil, anchor: nil)
    }
    
    /// Creates an offset with a URL reference
    ///
    /// - Parameter id: ID reference to an SVG element
    /// - Returns: An Offset with the specified URL reference
    public static func url(_ url: Url) -> Self {
        .path(path: .url(url), distance: nil, rotate: nil, anchor: nil)
    }
    
    /// Creates an offset with a circle path
    ///
    /// - Parameters:
    ///   - radius: The radius of the circle
    ///   - position: Optional position for the circle
    /// - Returns: An Offset with a circle path
    public static func circle(_ radius: LengthPercentage, at position: CSSTypeTypes.Position? = nil) -> Self {
        .path(path: .circle(radius, at: position), distance: nil, rotate: nil, anchor: nil)
    }
    
    /// Creates an offset with a ray path
    ///
    /// - Parameters:
    ///   - angle: The angle of the ray
    ///   - size: Optional size of the ray
    /// - Returns: An Offset with a ray path
    public static func ray(_ angle: Angle, _ size: OffsetPath.RaySize? = nil) -> Self {
        .path(path: .ray(angle: angle, size: size), distance: nil, rotate: nil, anchor: nil)
    }
    
    /// Creates an offset with a position
    ///
    /// - Parameter position: The position value
    /// - Returns: An Offset with the specified position
    public static func position(_ position: CSSTypeTypes.Position) -> Self {
        .position(.position(position), nil)
    }
    
    /// Creates a position-based offset with percentage values
    ///
    /// - Parameters:
    ///   - x: Horizontal percentage (0-100)
    ///   - y: Vertical percentage (0-100)
    /// - Returns: An Offset with a percentage position
    public static func percentage(_ x: Double, _ y: Double) -> Self {
        .position(.percentage(x, y), nil)
    }
}
