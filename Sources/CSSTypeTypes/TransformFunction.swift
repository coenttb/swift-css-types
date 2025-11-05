import Foundation

/// Represents CSS transform functions that modify an element's appearance.
///
/// The `TransformFunction` type represents transformation functions used in the `transform`
/// property to apply geometric operations to elements in 2D or 3D space.
/// Transformations can rotate, resize, distort, or move elements.
///
/// Example:
/// ```swift
/// .transform(.scale(1.5))                           // transform: scale(1.5)
/// .transform(.rotate(.deg(45)))                     // transform: rotate(45deg)
/// .transform(.translate(.px(100), .px(50)))         // transform: translate(100px, 50px)
/// .transform(.skew(.deg(10), .deg(5)))              // transform: skew(10deg, 5deg)
/// ```
///
/// - Note: Multiple transform functions can be combined using the `transform` property.
///
/// - SeeAlso: [MDN Web Docs on transform-function](https://developer.mozilla.org/en-US/docs/Web/CSS/transform-function)
public enum TransformFunction: Sendable, Hashable {

    // MARK: - Matrix Transformations

    /// The matrix() transform function describes a homogeneous 2D transformation matrix.
    /// - Parameters:
    ///   - a: Scale factor in the X direction
    ///   - b: Skew factor in the Y direction
    ///   - c: Skew factor in the X direction
    ///   - d: Scale factor in the Y direction
    ///   - tx: Translation in the X direction
    ///   - ty: Translation in the Y direction
    case matrix(a: Number, b: Number, c: Number, d: Number, tx: Number, ty: Number)

    /// The matrix3d() transform function describes a 3D transformation as a 4×4 homogeneous matrix.
    /// - Parameters:
    ///   - values: The 16 values of the 4×4 matrix, in column-major order
    case matrix3d(values: [Number])

    // MARK: - Perspective

    /// The perspective() transform function sets the distance between the user and the z=0 plane.
    /// - Parameter distance: The distance from the viewer to the z=0 plane in pixels
    case perspective(Length)

    // MARK: - Rotation

    /// The rotate() transform function rotates an element around a fixed point in 2D space.
    /// - Parameter angle: The angle of rotation (positive is clockwise)
    case rotate(Angle)

    /// The rotate3d() transform function rotates an element around a fixed axis in 3D space.
    /// - Parameters:
    ///   - x: X-coordinate of the vector describing the axis of rotation
    ///   - y: Y-coordinate of the vector describing the axis of rotation
    ///   - z: Z-coordinate of the vector describing the axis of rotation
    ///   - angle: The angle of rotation
    case rotate3d(x: Number, y: Number, z: Number, angle: Angle)

    /// The rotateX() transform function rotates an element around the horizontal axis.
    /// - Parameter angle: The angle of rotation
    case rotateX(Angle)

    /// The rotateY() transform function rotates an element around the vertical axis.
    /// - Parameter angle: The angle of rotation
    case rotateY(Angle)

    /// The rotateZ() transform function rotates an element around the z-axis.
    /// - Parameter angle: The angle of rotation
    case rotateZ(Angle)

    // MARK: - Scaling

    /// The scale() transform function scales an element in 2D space.
    /// - Parameters:
    ///   - sx: The scaling factor in the horizontal direction
    ///   - sy: The scaling factor in the vertical direction (defaults to sx if nil)
    case scale(sx: NumberPercentage, sy: NumberPercentage? = nil)

    /// The scale3d() transform function scales an element in 3D space.
    /// - Parameters:
    ///   - sx: The scaling factor in the horizontal direction
    ///   - sy: The scaling factor in the vertical direction
    ///   - sz: The scaling factor in the z direction
    case scale3d(sx: Number, sy: Number, sz: Number)

    /// The scaleX() transform function scales an element horizontally.
    /// - Parameter factor: The scaling factor
    case scaleX(Number)

    /// The scaleY() transform function scales an element vertically.
    /// - Parameter factor: The scaling factor
    case scaleY(Number)

    /// The scaleZ() transform function scales an element along the z-axis.
    /// - Parameter factor: The scaling factor
    case scaleZ(Number)

    // MARK: - Skewing

    /// The skew() transform function skews an element in 2D space.
    /// - Parameters:
    ///   - angleX: The skew angle in the horizontal direction
    ///   - angleY: The skew angle in the vertical direction (defaults to 0deg if nil)
    case skew(Angle, Angle? = nil)

    /// The skewX() transform function skews an element horizontally.
    /// - Parameter angle: The skew angle
    case skewX(Angle)

    /// The skewY() transform function skews an element vertically.
    /// - Parameter angle: The skew angle
    case skewY(Angle)

    // MARK: - Translation

    /// The translate() transform function moves an element in 2D space.
    /// - Parameters:
    ///   - tx: The translation distance in the horizontal direction
    ///   - ty: The translation distance in the vertical direction (defaults to 0 if nil)
    case translate(LengthPercentage, LengthPercentage? = nil)

    /// The translate3d() transform function moves an element in 3D space.
    /// - Parameters:
    ///   - tx: The translation distance in the horizontal direction
    ///   - ty: The translation distance in the vertical direction
    ///   - tz: The translation distance in the z direction
    case translate3d(LengthPercentage, LengthPercentage, Length)

    /// The translateX() transform function moves an element horizontally.
    /// - Parameter distance: The translation distance
    case translateX(LengthPercentage)

    /// The translateY() transform function moves an element vertically.
    /// - Parameter distance: The translation distance
    case translateY(LengthPercentage)

    /// The translateZ() transform function moves an element along the z-axis.
    /// - Parameter distance: The translation distance
    case translateZ(Length)
}

extension TransformFunction {
    /// Creates a scale transform with NumberPercentage values
    /// - Parameters:
    ///   - sx: The x-axis scaling factor
    ///   - sy: The y-axis scaling factor (optional)
    /// - Returns: A scale transform function
    public static func scale(_ sx: NumberPercentage, _ sy: NumberPercentage? = nil) -> Self {
        .scale(sx: sx, sy: sy)
    }

    /// Creates a scale transform with a Percentage value directly
    /// - Parameter percentage: The uniform scaling percentage
    /// - Returns: A scale transform function
    public static func scale(_ percentage: Percentage) -> Self {
        .scale(sx: .percentage(percentage))
    }

    /// Creates a scale transform with a Number value directly
    /// - Parameter number: The uniform scaling factor
    /// - Returns: A scale transform function
    public static func scale(_ number: Number) -> Self {
        .scale(sx: .number(number))
    }

    /// Creates a scale transform with a Double value directly (as a Number)
    /// - Parameter value: The uniform scaling factor as a Double
    /// - Returns: A scale transform function
    public static func scale(_ value: Double) -> Self {
        .scale(sx: .number(Number(value)))
    }

    /// Creates a scale transform with an Int value directly (as a Number)
    /// - Parameter value: The uniform scaling factor as an Int
    /// - Returns: A scale transform function
    public static func scale(_ value: Int) -> Self {
        .scale(sx: .number(Number(value)))
    }
}
/// Provides string conversion for CSS output
extension TransformFunction: CustomStringConvertible {
    /// Converts the transform function to its CSS string representation
    public var description: String {
        switch self {
        case .matrix(let a, let b, let c, let d, let tx, let ty):
            return "matrix(\(a), \(b), \(c), \(d), \(tx), \(ty))"

        case .matrix3d(let values):
            let valuesString = values.map(\.description).joined(separator: ", ")
            return "matrix3d(\(valuesString))"

        case .perspective(let distance):
            return "perspective(\(distance))"

        case .rotate(let angle):
            return "rotate(\(angle))"

        case .rotate3d(let x, let y, let z, let angle):
            return "rotate3d(\(x), \(y), \(z), \(angle))"

        case .rotateX(let angle):
            return "rotateX(\(angle))"

        case .rotateY(let angle):
            return "rotateY(\(angle))"

        case .rotateZ(let angle):
            return "rotateZ(\(angle))"

        case .scale(let sx, let sy):
            if let sy = sy {
                return "scale(\(sx), \(sy))"
            } else {
                return "scale(\(sx))"
            }

        case .scale3d(let sx, let sy, let sz):
            return "scale3d(\(sx), \(sy), \(sz))"

        case .scaleX(let factor):
            return "scaleX(\(factor))"

        case .scaleY(let factor):
            return "scaleY(\(factor))"

        case .scaleZ(let factor):
            return "scaleZ(\(factor))"

        case .skew(let angleX, let angleY):
            if let angleY = angleY {
                return "skew(\(angleX), \(angleY))"
            } else {
                return "skew(\(angleX))"
            }

        case .skewX(let angle):
            return "skewX(\(angle))"

        case .skewY(let angle):
            return "skewY(\(angle))"

        case .translate(let tx, let ty):
            if let ty = ty {
                return "translate(\(tx), \(ty))"
            } else {
                return "translate(\(tx))"
            }

        case .translate3d(let tx, let ty, let tz):
            return "translate3d(\(tx), \(ty), \(tz))"

        case .translateX(let distance):
            return "translateX(\(distance))"

        case .translateY(let distance):
            return "translateY(\(distance))"

        case .translateZ(let distance):
            return "translateZ(\(distance))"
        }
    }
}

// MARK: - Convenience Constructors

/// Provides common convenience constructors for transform functions
extension TransformFunction {
    /// Creates a 2D identity matrix transformation
    public static let identity = TransformFunction.matrix(a: 1, b: 0, c: 0, d: 1, tx: 0, ty: 0)

    /// Creates a transform that translates an element by the same amount in both directions
    /// - Parameter distance: The translation distance
    public static func translate(_ distance: LengthPercentage) -> TransformFunction {
        return .translate(distance, distance)
    }

    /// Creates a transform that translates an element using pixel values
    /// - Parameters:
    ///   - x: Horizontal translation in pixels
    ///   - y: Vertical translation in pixels
    public static func translate(_ x: Length, _ y: Length) -> TransformFunction {
        return Self.translate(LengthPercentage.length(x), LengthPercentage.length(y))
    }

    /// Creates a transform that translates an element using percentage values
    /// - Parameters:
    ///   - x: Horizontal translation as percentage
    ///   - y: Vertical translation as percentage
    public static func translatePercent(_ x: Percentage, _ y: Percentage) -> TransformFunction {
        return .translate(.percentage(x), .percentage(y))
    }
}
