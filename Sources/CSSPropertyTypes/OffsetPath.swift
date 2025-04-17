import Foundation
import CSSTypeTypes

/// The CSS `offset-path` property specifies a path for an element to follow and
/// determines the element's positioning within the parent container or SVG coordinate system.
///
/// This property is used to define a motion path that an element can follow. It works with
/// other offset properties (`offset-distance`, `offset-rotate`, `offset-anchor`) to create
/// complex animations and positioning.
///
/// Example:
/// ```swift
/// .offsetPath(.path("M20,20 C20,100 200,0 200,100")) // offset-path: path("M20,20 C20,100 200,0 200,100")
/// .offsetPath(.none)                                  // offset-path: none
/// .offsetPath(.ray(.deg(45), .closestSide))          // offset-path: ray(45deg closest-side)
/// .offsetPath(.circle(.px(50), .center))             // offset-path: circle(50px at center)
/// ```
///
/// - SeeAlso: [MDN Web Docs on offset-path](https://developer.mozilla.org/en-US/docs/Web/CSS/offset-path)
public enum OffsetPath: Property {
    public static let property: String = "offset-path"
    
    /// No offset path is specified
    case none
    
    /// A URL reference to an SVG shape
    case url(Url)
    
    /// A ray originating from a position extending at an angle
    case ray(angle: Angle, size: RaySize? = nil, contain: Bool = false, position: Position? = nil)
    
    /// A shape using CSS basic shape functions
    case shape(BasicShape)
    
    /// A coordinate box for positioning reference
    case coordBox(CoordBox)
    
    /// A combination of coordinate box and shape
    case coordBoxShape(CoordBox, BasicShape)
    
    /// Global value
    case global(CSSTypeTypes.Global)
    
    /// Specifies the size of a ray
    public enum RaySize: Sendable, Hashable {
        /// Uses the length from the center to the closest side
        case closestSide
        
        /// Uses the length from the center to the closest corner
        case closestCorner
        
        /// Uses the length from the center to the farthest side
        case farthestSide
        
        /// Uses the length from the center to the farthest corner
        case farthestCorner
        
        /// Uses the distance to where the ray intersects the box's sides
        case sides
    }
    
    /// Specifies the coordinate box to use for the offset path
    public enum CoordBox: Sendable, Hashable {
        /// The box is positioned at the border edge of the element
        case borderBox
        
        /// The box is positioned at the padding edge of the element
        case paddingBox
        
        /// The box is positioned at the content edge of the element
        case contentBox
        
        /// The box is positioned at the fill of an SVG element
        case fillBox
        
        /// The box is positioned at the stroke of an SVG element
        case strokeBox
        
        /// The box is positioned at the SVG viewBox
        case viewBox
    }
    
    /// Factory method for creating a path-based offset path
    ///
    /// - Parameter pathData: SVG path data string
    /// - Returns: An OffsetPath with path data
    public static func path(_ pathData: String, fillRule: BasicShape.FillRule? = nil) -> Self {
        .shape(.path(fillRule: fillRule, pathData: pathData))
    }
    
    /// Factory method for creating a circle-based offset path
    ///
    /// - Parameters:
    ///   - radius: Optional radius (defaults to closest-side if nil)
    ///   - position: Optional position (defaults to center if nil)
    /// - Returns: An OffsetPath with a circle shape
    public static func circle(_ radius: LengthPercentage? = nil, at position: CSSTypeTypes.Position? = nil) -> Self {
        let shapeRadius = radius.map { BasicShape.ShapeRadius.lengthPercentage($0) }
        return .shape(.circle(radius: shapeRadius, at: position))
    }
    
    /// Factory method for creating an ellipse-based offset path
    ///
    /// - Parameters:
    ///   - radiusX: Optional horizontal radius
    ///   - radiusY: Optional vertical radius
    ///   - position: Optional position (defaults to center if nil)
    /// - Returns: An OffsetPath with an ellipse shape
    public static func ellipse(radiusX: LengthPercentage? = nil, radiusY: LengthPercentage? = nil, at position: CSSTypeTypes.Position? = nil) -> Self {
        let rx = radiusX.map { BasicShape.ShapeRadius.lengthPercentage($0) }
        let ry = radiusY.map { BasicShape.ShapeRadius.lengthPercentage($0) }
        return .shape(.ellipse(radiusX: rx, radiusY: ry, at: position))
    }
    
    /// Factory method for creating a polygon-based offset path
    ///
    /// - Parameters:
    ///   - fillRule: Optional fill rule
    ///   - points: Array of points defining the polygon
    /// - Returns: An OffsetPath with a polygon shape
    public static func polygon(fillRule: BasicShape.FillRule? = nil, points: [(LengthPercentage, LengthPercentage)]) -> Self {
        let polygonPoints = points.map { BasicShape.PolygonPoint($0.0, $0.1) }
        return .shape(.polygon(fillRule: fillRule, points: polygonPoints))
    }
    
    /// Factory method for creating an inset-based offset path
    ///
    /// - Parameters:
    ///   - top: Top inset
    ///   - right: Right inset
    ///   - bottom: Bottom inset
    ///   - left: Left inset
    ///   - borderRadius: Optional border radius
    /// - Returns: An OffsetPath with an inset shape
    public static func inset(top: LengthPercentage, right: LengthPercentage, bottom: LengthPercentage, left: LengthPercentage, borderRadius: String? = nil) -> Self {
        .shape(.inset(top: top, right: right, bottom: bottom, left: left, borderRadius: borderRadius))
    }
}

/// CSS Output conversion
extension OffsetPath: CustomStringConvertible {
    /// Converts the offset-path value to its CSS string representation
    public var description: String {
        switch self {
        case .none:
            return "none"
        case .url(let url):
            return url.description
        case .ray(let angle, let size, let contain, let position):
            var result = "ray(\(angle)"
            if let s = size {
                result += " \(s.description)"
            }
            if contain {
                result += " contain"
            }
            if let p = position {
                result += " at \(p)"
            }
            result += ")"
            return result
        case .shape(let shape):
            return shape.description
        case .coordBox(let box):
            return box.description
        case .coordBoxShape(let box, let shape):
            return "\(box.description) \(shape.description)"
        case .global(let global):
            return global.description
        }
    }
}

/// Provides string conversion for RaySize and CoordBox
extension OffsetPath.RaySize: CustomStringConvertible {
    /// Converts the ray size to its CSS string representation
    public var description: String {
        switch self {
        case .closestSide:
            return "closest-side"
        case .closestCorner:
            return "closest-corner"
        case .farthestSide:
            return "farthest-side"
        case .farthestCorner:
            return "farthest-corner"
        case .sides:
            return "sides"
        }
    }
}

extension OffsetPath.CoordBox: CustomStringConvertible {
    /// Converts the coordinate box to its CSS string representation
    public var description: String {
        switch self {
        case .borderBox:
            return "border-box"
        case .paddingBox:
            return "padding-box"
        case .contentBox:
            return "content-box"
        case .fillBox:
            return "fill-box"
        case .strokeBox:
            return "stroke-box"
        case .viewBox:
            return "view-box"
        }
    }
}
