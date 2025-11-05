import Foundation

/// Represents CSS basic shape values used for clipping and wrapping content.
///
/// The `BasicShape` data type is used in properties like `clip-path`, `shape-outside`,
/// and `offset-path` to define geometric shapes such as circles, ellipses,
/// polygons, and insets.
///
/// Example:
/// ```swift
/// .clipPath(.circle(radius: .percentage(50), at: .center))
/// .clipPath(.polygon(points: [
///     PolygonPoint(.percentage(50), .percentage(0)),
///     PolygonPoint(.percentage(100), .percentage(50)),
///     PolygonPoint(.percentage(50), .percentage(100)),
///     PolygonPoint(.percentage(0), .percentage(50))
/// ]))
/// ```
///
/// - Note: When creating a shape, the coordinate system has its origin (0,0) at the
///         top-left corner of the element's reference box, with the x-axis running
///         right and the y-axis running downward.
///
/// - SeeAlso: [MDN Web Docs on basic-shape values](https://developer.mozilla.org/en-US/docs/Web/CSS/basic-shape)
public enum BasicShape: Sendable, Hashable {
    /// Represents a fill rule for the polygon and path shapes
    public enum FillRule: String, Sendable, Hashable {
        /// The default fill rule
        case nonzero = "nonzero"

        /// Alternative fill rule for complex shapes with self-intersections
        case evenodd = "evenodd"
    }

    /// Specifies a radius keyword for circle and ellipse shapes
    public enum ShapeRadius: Sendable, Hashable, LengthPercentageConvertible {
        case lengthPercentage(LengthPercentage)

        /// Uses the length from the center to the closest side as radius
        case closestSide

        /// Uses the length from the center to the farthest side as radius
        case farthestSide
    }

    /// Represents a point in a polygon shape
    public struct PolygonPoint: Sendable, Hashable {
        /// The x-coordinate of the point
        public let x: LengthPercentage

        /// The y-coordinate of the point
        public let y: LengthPercentage

        /// Creates a new point for a polygon
        ///
        /// - Parameters:
        ///   - x: The x-coordinate of the point
        ///   - y: The y-coordinate of the point
        public init(_ x: LengthPercentage, _ y: LengthPercentage) {
            self.x = x
            self.y = y
        }
    }

    /// Defines an inset rectangle
    /// ```css
    /// clip-path: inset(20px 50px 10px 30px round 10px);
    /// ```
    case inset(
        top: LengthPercentage,
        right: LengthPercentage,
        bottom: LengthPercentage,
        left: LengthPercentage,
        borderRadius: String?
    )

    /// Defines a rectangle with x, y coordinates and width, height
    /// ```css
    /// clip-path: xywh(10px 20px 200px 100px);
    /// ```
    case xywh(
        x: LengthPercentage,
        y: LengthPercentage,
        width: LengthPercentage,
        height: LengthPercentage,
        borderRadius: String?
    )

    /// Defines a rectangle by distances from edges
    /// ```css
    /// clip-path: rect(10px 210px 110px 20px);
    /// ```
    case rect(
        top: LengthPercentage,
        right: LengthPercentage,
        bottom: LengthPercentage,
        left: LengthPercentage,
        borderRadius: String?
    )

    /// Defines a circle
    /// ```css
    /// clip-path: circle(50px at 25% 25%);
    /// ```
    case circle(radius: ShapeRadius?, at: Position?)

    /// Defines an ellipse
    /// ```css
    /// clip-path: ellipse(100px 50px at center);
    /// ```
    case ellipse(radiusX: ShapeRadius?, radiusY: ShapeRadius?, at: Position?)

    /// Defines a polygon
    /// ```css
    /// clip-path: polygon(50% 0%, 100% 50%, 50% 100%, 0% 50%);
    /// ```
    case polygon(fillRule: FillRule? = nil, points: [PolygonPoint])

    /// Defines a path using an SVG path string
    /// ```css
    /// clip-path: path("M 0,0 H 100 V 100 H 0 Z");
    /// ```
    case path(fillRule: FillRule? = nil, pathData: String)
}

/// Provides string conversion for CSS output
extension BasicShape: CustomStringConvertible {
    /// Converts the basic shape value to its CSS string representation
    public var description: String {
        switch self {
        case .inset(let top, let right, let bottom, let left, let borderRadius):
            let insetValues = "\(top) \(right) \(bottom) \(left)"
            if let radius = borderRadius {
                return "inset(\(insetValues) round \(radius))"
            } else {
                return "inset(\(insetValues))"
            }

        case .xywh(let x, let y, let width, let height, let borderRadius):
            let values = "\(x) \(y) \(width) \(height)"
            if let radius = borderRadius {
                return "xywh(\(values) round \(radius))"
            } else {
                return "xywh(\(values))"
            }

        case .rect(let top, let right, let bottom, let left, let borderRadius):
            let values = "\(top) \(right) \(bottom) \(left)"
            if let radius = borderRadius {
                return "rect(\(values) round \(radius))"
            } else {
                return "rect(\(values))"
            }

        case .circle(let radius, let position):
            var result = "circle("
            if let r = radius {
                result += r.description
            }
            if let pos = position {
                result += " at \(pos)"
            }
            result += ")"
            return result

        case .ellipse(let rx, let ry, let position):
            var result = "ellipse("
            if let radiusX = rx, let radiusY = ry {
                result += "\(radiusX) \(radiusY)"
            }
            if let pos = position {
                result += " at \(pos)"
            }
            result += ")"
            return result

        case .polygon(let fillRule, let points):
            var result = "polygon("
            if let rule = fillRule {
                result += "\(rule.rawValue), "
            }
            let pointsStr = points.map { "\($0.x) \($0.y)" }.joined(separator: ", ")
            result += pointsStr + ")"
            return result

        case .path(let fillRule, let pathData):
            var result = "path("
            if let rule = fillRule {
                result += "\(rule.rawValue), "
            }
            result += "\"\(pathData)\")"
            return result
        }
    }
}

/// Extension for ShapeRadius description
extension BasicShape.ShapeRadius: CustomStringConvertible {
    /// Converts the shape radius value to its CSS string representation
    public var description: String {
        switch self {
        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description
        case .closestSide:
            return "closest-side"
        case .farthestSide:
            return "farthest-side"
        }
    }
}

/// Factory methods for creating basic shapes
extension BasicShape {
    /// Creates a polygon from an array of x,y coordinate tuples
    ///
    /// This method simplifies creating polygons by accepting tuples instead of PolygonPoint instances.
    ///
    /// - Parameters:
    ///   - fillRule: Optional fill rule for the polygon
    ///   - points: Array of (x, y) coordinate tuples
    /// - Returns: A polygon shape
    public static func polygon(
        fillRule: FillRule? = nil,
        points: [(LengthPercentage, LengthPercentage)]
    ) -> Self {
        let polygonPoints = points.map { PolygonPoint($0.0, $0.1) }
        return .polygon(fillRule: fillRule, points: polygonPoints)
    }
}
