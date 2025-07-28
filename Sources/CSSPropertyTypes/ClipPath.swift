import CSSTypeTypes
import Foundation

/// The CSS `clip-path` property creates a clipping region that sets what part of an element should be shown.
/// Parts that are inside the region are shown, while those outside are hidden.
///
/// Example:
/// ```swift
/// .clipPath(.none)                                     // clip-path: none
/// .clipPath(.url("#myPath"))                           // clip-path: url(#myPath)
/// .clipPath(.circle(.px(50)))                          // clip-path: circle(50px)
/// .clipPath(.circle(.px(50), at: (.percentage(25), .percentage(25)))) // clip-path: circle(50px at 25% 25%)
/// .clipPath(.inset(top: .px(10), right: .px(20), bottom: .px(30), left: .px(40))) // clip-path: inset(10px 20px 30px 40px)
/// .clipPath(.polygon([(0, 0), (100, 0), (100, 100), (0, 100)].map { (.percentage($0.0), .percentage($0.1)) })) // clip-path: polygon(0% 0%, 100% 0%, 100% 100%, 0% 100%)
/// ```
///
/// A computed value other than `none` results in the creation of a new stacking context, similar
/// to how CSS `opacity` does for values other than 1.
///
/// - SeeAlso: [MDN Web Docs on clip-path](https://developer.mozilla.org/en-US/docs/Web/CSS/clip-path)
public enum ClipPath: Property {
    public static let property: String = "clip-path"
    /// No clipping path is created.
    case none

    /// A URL referencing an SVG <clipPath> element.
    case url(Url)

    /// A circle shape defined by a radius and optional position.
    case circle(CircleShape)

    /// An ellipse shape defined by horizontal and vertical radii and optional position.
    case ellipse(EllipseShape)

    /// An inset rectangle shape with optional border radius.
    case inset(InsetShape)

    /// A polygon shape defined by a set of points.
    case polygon(PolygonShape)

    /// A path shape defined using an SVG path definition.
    case path(CSSString)

    /// A custom clip path value.
    case custom(CSSString)

    /// Global values
    case global(CSSTypeTypes.Global)

    /// Initialize with a custom string value
    public init(_ value: CSSString) {
        self = .custom(value)
    }
}

/// Represents a circle clipping shape
public struct CircleShape: Sendable, Hashable {
    /// The radius of the circle
    public var radius: LengthPercentage

    /// The center position of the circle (optional)
    public var center: Point?

    /// Initialize a circle with radius and optional center
    public init(radius: LengthPercentage, center: Point? = nil) {
        self.radius = radius
        self.center = center
    }
}

/// Represents an ellipse clipping shape
public struct EllipseShape: Sendable, Hashable {
    /// The horizontal radius of the ellipse
    public var radiusX: LengthPercentage

    /// The vertical radius of the ellipse
    public var radiusY: LengthPercentage

    /// The center position of the ellipse (optional)
    public var center: Point?

    /// Initialize an ellipse with radii and optional center
    public init(
        radiusX: LengthPercentage,
        radiusY: LengthPercentage,
        center: Point? = nil
    ) {
        self.radiusX = radiusX
        self.radiusY = radiusY
        self.center = center
    }
}

/// Represents an inset rectangle shape
public struct InsetShape: Sendable, Hashable {
    /// The top inset distance
    public var top: LengthPercentage

    /// The right inset distance
    public var right: LengthPercentage

    /// The bottom inset distance
    public var bottom: LengthPercentage

    /// The left inset distance
    public var left: LengthPercentage

    /// The border radius (optional)
    public var borderRadius: LengthPercentage?

    /// Initialize an inset with specific values
    public init(
        top: LengthPercentage,
        right: LengthPercentage,
        bottom: LengthPercentage,
        left: LengthPercentage,
        borderRadius: LengthPercentage? = nil
    ) {
        self.top = top
        self.right = right
        self.bottom = bottom
        self.left = left
        self.borderRadius = borderRadius
    }

    /// Initialize an inset with the same value for all sides
    public init(all: LengthPercentage, borderRadius: LengthPercentage? = nil) {
        self.top = all
        self.right = all
        self.bottom = all
        self.left = all
        self.borderRadius = borderRadius
    }
}

public struct Point: Sendable, Hashable {
    public let x: LengthPercentage
    public let y: LengthPercentage
}

/// Represents a polygon clipping shape
public struct PolygonShape: Sendable, Hashable {
    /// The points defining the polygon
    public var points: [Point]

    /// Initialize a polygon with a set of points
    public init(points: [Point]) {
        self.points = points
    }
}

/// CSS Output conversion for shapes
extension CircleShape: CustomStringConvertible {
    public var description: String {
        if let center = center {
            return "circle(\(radius) at \(center.x) \(center.y))"
        } else {
            return "circle(\(radius) )"
        }
    }
}

extension EllipseShape: CustomStringConvertible {
    public var description: String {
        if let center = center {
            return "ellipse(\(radiusX) \(radiusY) at \(center.x) \(center.y))"
        } else {
            return "ellipse(\(radiusX) \(radiusY) )"
        }
    }
}

extension InsetShape: CustomStringConvertible {
    public var description: String {
        let insetPart = "inset(\(top) \(right) \(bottom) \(left))"
        if let borderRadius = borderRadius {
            return "\(insetPart) round \(borderRadius)"
        } else {
            return insetPart
        }
    }
}

extension PolygonShape: CustomStringConvertible {
    public var description: String {
        let pointsString = points.map { "\($0.x) \($0.y)" }.joined(separator: ", ")
        return "polygon(\(pointsString))"
    }
}

/// CSS Output conversion
extension ClipPath: CustomStringConvertible {
    public var description: String {
        switch self {
        case .none:
            return "none"

        case .url(let url):
            return url.description

        case .circle(let shape):
            return shape.description

        case .ellipse(let shape):
            return shape.description

        case .inset(let shape):
            return shape.description

        case .polygon(let shape):
            return shape.description

        case .path(let path):
            return "path('\(path)')"

        case .custom(let value):
            return value.description

        case .global(let global):
            return global.description
        }
    }
}

/// Factory methods
extension ClipPath {
    /// Creates a circle clip path with the given radius
    public static func circle(_ radius: LengthPercentage) -> ClipPath {
        .circle(CircleShape(radius: radius))
    }

    public static func circle(radius: LengthPercentage) -> ClipPath {
        .circle(CircleShape(radius: radius))
    }

    /// Creates a circle clip path with the given radius and center position
    public static func circle(
        _ radius: LengthPercentage,
        at center: Point
    ) -> ClipPath {
        .circle(CircleShape(radius: radius, center: center))
    }

    /// Creates an ellipse clip path with the given radii
    public static func ellipse(
        radiusX: LengthPercentage,
        radiusY: LengthPercentage
    ) -> ClipPath {
        .ellipse(EllipseShape(radiusX: radiusX, radiusY: radiusY))
    }

    /// Creates an ellipse clip path with the given radii and center position
    public static func ellipse(
        radiusX: LengthPercentage,
        radiusY: LengthPercentage,
        center: Point
    ) -> ClipPath {
        .ellipse(EllipseShape(radiusX: radiusX, radiusY: radiusY, center: center))
    }

    /// Creates an inset clip path with the given insets
    public static func inset(
        top: LengthPercentage,
        right: LengthPercentage,
        bottom: LengthPercentage,
        left: LengthPercentage,
        borderRadius: LengthPercentage? = nil
    ) -> ClipPath {
        .inset(InsetShape(top: top, right: right, bottom: bottom, left: left, borderRadius: borderRadius))
    }

    /// Creates an inset clip path with the same value for all sides
    public static func inset(all: LengthPercentage, borderRadius: LengthPercentage? = nil) -> ClipPath {
        .inset(InsetShape(all: all, borderRadius: borderRadius))
    }

    /// Creates a polygon clip path with the given points
    public static func polygon(points: [Point]) -> ClipPath {
        .polygon(PolygonShape(points: points))
    }
}
