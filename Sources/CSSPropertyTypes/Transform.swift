import CSSTypeTypes
import Foundation

/// The CSS `transform` property lets you rotate, scale, skew, or translate an element.
/// It modifies the coordinate space of the CSS visual formatting model.
///
/// Example:
/// ```swift
/// .transform(.none)                                   // transform: none
/// .transform(.translate(.px(120), .percentage(50)))      // transform: translate(120px, 50%)
/// .transform(.scale(2, 0.5))                          // transform: scale(2, 0.5)
/// .transform(.rotate(.turn(0.5)))                     // transform: rotate(0.5turn)
/// .transform(.skew(.deg(30), .deg(20)))               // transform: skew(30deg, 20deg)
/// ```
///
/// You can also chain multiple transformations:
/// ```swift
/// .transform(.scale(0.5) + .translate(.percentage(-100), .percentage(-100)))
/// // transform: scale(0.5) translate(-100%, -100%)
/// ```
///
/// - Note: If the property has a value different from `none`, a stacking context will be created.
///         In that case, the element will act as a containing block for any `position: fixed` or
///         `position: absolute` elements that it contains.
///
/// - Warning: Only transformable elements can be transformed. That is, all elements whose layout is governed
///            by the CSS box model except for: non-replaced inline boxes, table-column boxes, and table-column-group boxes.
///
/// - SeeAlso: [MDN Web Docs on transform](https://developer.mozilla.org/en-US/docs/Web/CSS/transform)
public enum Transform: Property {
    public static let property: String = "transform"
    /// No transformation
    case none

    /// A single transform function
    case function(TransformFunction)

    /// Multiple transform functions applied in sequence
    case compound([TransformFunction])

    /// Global values
    case global(CSSTypeTypes.Global)
}

extension Transform {
    /// Matrix transform with 6 values (2D transformation)
    ///
    /// - Parameters:
    ///   - a: Scale factor in the X direction
    ///   - b: Skew factor in the Y direction
    ///   - c: Skew factor in the X direction
    ///   - d: Scale factor in the Y direction
    ///   - tx: Translation in the X direction
    ///   - ty: Translation in the Y direction
    /// - Returns: A transform using the matrix function
    public static func matrix(
        a: Number,
        b: Number,
        c: Number,
        d: Number,
        tx: Number,
        ty: Number
    ) -> Transform {
        .function(.matrix(a: a, b: b, c: c, d: d, tx: tx, ty: ty))
    }

    /// Matrix3d transform with 16 values (3D transformation)
    ///
    /// - Parameter values: The 16 values of the 4×4 matrix, in column-major order
    /// - Returns: A transform using the matrix3d function
    public static func matrix3d(_ values: [Number]) -> Transform {
        .function(.matrix3d(values: values))
    }

    /// Perspective transform for 3D transformations
    ///
    /// - Parameter distance: The distance from the viewer to the z=0 plane
    /// - Returns: A transform using the perspective function
    public static func perspective(_ distance: Length) -> Transform {
        .function(.perspective(distance))
    }

    /// Rotation transform
    ///
    /// - Parameter angle: The angle of rotation
    /// - Returns: A transform using the rotate function
    public static func rotate(_ angle: Angle) -> Transform {
        .function(.rotate(angle))
    }

    /// 3D rotation transform
    ///
    /// - Parameters:
    ///   - x: X-coordinate of the vector describing the axis of rotation
    ///   - y: Y-coordinate of the vector describing the axis of rotation
    ///   - z: Z-coordinate of the vector describing the axis of rotation
    ///   - angle: The angle of rotation
    /// - Returns: A transform using the rotate3d function
    public static func rotate3d(x: Number, y: Number, z: Number, angle: Angle) -> Transform {
        .function(.rotate3d(x: x, y: y, z: z, angle: angle))
    }

    /// X-axis rotation transform
    ///
    /// - Parameter angle: The angle of rotation
    /// - Returns: A transform using the rotateX function
    public static func rotateX(_ angle: Angle) -> Transform {
        .function(.rotateX(angle))
    }

    /// Y-axis rotation transform
    ///
    /// - Parameter angle: The angle of rotation
    /// - Returns: A transform using the rotateY function
    public static func rotateY(_ angle: Angle) -> Transform {
        .function(.rotateY(angle))
    }

    /// Z-axis rotation transform
    ///
    /// - Parameter angle: The angle of rotation
    /// - Returns: A transform using the rotateZ function
    public static func rotateZ(_ angle: Angle) -> Transform {
        .function(.rotateZ(angle))
    }

    /// Scale transform
    ///
    /// - Parameters:
    ///   - sx: The scaling factor in the horizontal direction
    ///   - sy: The scaling factor in the vertical direction (if nil, uses sx value)
    /// - Returns: A transform using the scale function
    public static func scale(_ sx: NumberPercentage, _ sy: NumberPercentage? = nil) -> Transform {
        .function(.scale(sx, sy))
    }

    /// 3D scale transform
    ///
    /// - Parameters:
    ///   - x: The scaling factor in the horizontal direction
    ///   - y: The scaling factor in the vertical direction
    ///   - z: The scaling factor in the z direction
    /// - Returns: A transform using the scale3d function
    public static func scale3d(x: Number, y: Number, z: Number) -> Transform {
        .function(.scale3d(sx: x, sy: y, sz: z))
    }

    /// X-axis scale transform
    ///
    /// - Parameter factor: The scaling factor
    /// - Returns: A transform using the scaleX function
    public static func scaleX(_ factor: Number) -> Transform {
        .function(.scaleX(factor))
    }

    /// Y-axis scale transform
    ///
    /// - Parameter factor: The scaling factor
    /// - Returns: A transform using the scaleY function
    public static func scaleY(_ factor: Number) -> Transform {
        .function(.scaleY(factor))
    }

    /// Z-axis scale transform
    ///
    /// - Parameter factor: The scaling factor
    /// - Returns: A transform using the scaleZ function
    public static func scaleZ(_ factor: Number) -> Transform {
        .function(.scaleZ(factor))
    }

    /// Skew transform
    ///
    /// - Parameters:
    ///   - angleX: The skew angle in the horizontal direction
    ///   - angleY: The skew angle in the vertical direction (if nil, defaults to 0)
    /// - Returns: A transform using the skew function
    public static func skew(_ angleX: Angle, _ angleY: Angle? = nil) -> Transform {
        .function(.skew(angleX, angleY))
    }

    /// X-axis skew transform
    ///
    /// - Parameter angle: The skew angle
    /// - Returns: A transform using the skewX function
    public static func skewX(_ angle: Angle) -> Transform {
        .function(.skewX(angle))
    }

    /// Y-axis skew transform
    ///
    /// - Parameter angle: The skew angle
    /// - Returns: A transform using the skewY function
    public static func skewY(_ angle: Angle) -> Transform {
        .function(.skewY(angle))
    }

    /// Translation transform
    ///
    /// - Parameters:
    ///   - tx: The translation distance in the horizontal direction
    ///   - ty: The translation distance in the vertical direction (if nil, defaults to 0)
    /// - Returns: A transform using the translate function
    public static func translate(_ tx: LengthPercentage, _ ty: LengthPercentage? = nil) -> Transform
    {
        .function(.translate(tx, ty))
    }

    /// 3D translation transform
    ///
    /// - Parameters:
    ///   - x: The translation distance in the horizontal direction
    ///   - y: The translation distance in the vertical direction
    ///   - z: The translation distance in the z direction
    /// - Returns: A transform using the translate3d function
    public static func translate3d(x: LengthPercentage, y: LengthPercentage, z: Length) -> Transform
    {
        .function(.translate3d(x, y, z))
    }

    /// X-axis translation transform
    ///
    /// - Parameter distance: The translation distance
    /// - Returns: A transform using the translateX function
    public static func translateX(_ distance: LengthPercentage) -> Transform {
        .function(.translateX(distance))
    }

    /// Y-axis translation transform
    ///
    /// - Parameter distance: The translation distance
    /// - Returns: A transform using the translateY function
    public static func translateY(_ distance: LengthPercentage) -> Transform {
        .function(.translateY(distance))
    }

    /// Z-axis translation transform
    ///
    /// - Parameter distance: The translation distance
    /// - Returns: A transform using the translateZ function
    public static func translateZ(_ distance: Length) -> Transform {
        .function(.translateZ(distance))
    }
}

/// CSS Output conversion
extension Transform: CustomStringConvertible {
    /// Converts the transform value to its CSS string representation
    public var description: String {
        switch self {
        case .none:
            return "none"

        case .function(let function):
            return function.description

        case .compound(let functions):
            return functions.map { $0.description }.joined(separator: " ")

        case .global(let global):
            return global.description
        }
    }
}

/// Transform combination operator
extension Transform {
    /// Combines two transforms into a compound transform
    ///
    /// - Parameters:
    ///   - lhs: The first transform
    ///   - rhs: The second transform
    /// - Returns: A new compound transform applying both transforms in sequence
    public static func + (lhs: Transform, rhs: Transform) -> Transform {
        let functions: [TransformFunction] = {
            switch (lhs, rhs) {
            case (.none, _):
                return transformFunctions(from: rhs)

            case (_, .none):
                return transformFunctions(from: lhs)

            case (.global, _), (_, .global):
                // Combining with globals doesn't make sense, so just use the left side
                return transformFunctions(from: lhs)

            default:
                return transformFunctions(from: lhs) + transformFunctions(from: rhs)
            }
        }()

        return .compound(functions)
    }

    /// Helper to extract transform functions from a Transform
    private static func transformFunctions(from transform: Transform) -> [TransformFunction] {
        switch transform {
        case .none:
            return []

        case .function(let function):
            return [function]

        case .compound(let functions):
            return functions

        case .global:
            return []
        }
    }
}
