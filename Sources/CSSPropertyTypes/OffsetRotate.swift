import CSSTypeTypes
import Foundation

/// The CSS `offset-rotate` property defines the orientation/direction of the element
/// as it is positioned along the `offset-path`.
///
/// This property controls how elements are rotated while following a path, allowing for
/// either automatic rotation to match the path direction, a fixed angle, or a combination.
///
/// Example:
/// ```swift
/// .offsetRotate(.auto)           // offset-rotate: auto
/// .offsetRotate(.angle(.deg(45))) // offset-rotate: 45deg
/// .offsetRotate(.autoAngle(.deg(30))) // offset-rotate: auto 30deg
/// .offsetRotate(.reverse)        // offset-rotate: reverse
/// ```
///
/// - SeeAlso: [MDN Web Docs on offset-rotate](https://developer.mozilla.org/en-US/docs/Web/CSS/offset-rotate)
public enum OffsetRotate: Property, AngleConvertible {
    public static let property: String = "offset-rotate"

    /// The element is rotated to match the direction of the path
    case auto

    /// The element is rotated by a specific angle
    case angle(Angle)

    /// The element follows the path direction with an additional angle offset
    case autoAngle(Angle)

    /// The element is rotated in the opposite direction of the path
    case reverse

    /// Global value
    case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension OffsetRotate: CustomStringConvertible {
    /// Converts the offset-rotate value to its CSS string representation
    public var description: String {
        switch self {
        case .auto:
            return "auto"
        case .angle(let angle):
            return angle.description
        case .autoAngle(let angle):
            return "auto \(angle.description)"
        case .reverse:
            return "reverse"
        case .global(let global):
            return global.description
        }
    }
}

/// Convenience initializers for OffsetRotate
extension OffsetRotate {

    /// Creates an auto offset-rotate with a degree offset
    ///
    /// - Parameter value: The degree offset
    /// - Returns: An OffsetRotate with auto and the specified angle offset
    public static func autoDeg(_ value: Double) -> Self {
        .autoAngle(.deg(value))
    }
}

/// Allow for numeric literals to be used directly
extension OffsetRotate: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
    /// Creates an offset-rotate with a degree value from an integer literal
    ///
    /// - Parameter value: The degree value as an integer
    public init(integerLiteral value: Int) {
        self = .angle(.deg(Double(value)))
    }

    /// Creates an offset-rotate with a degree value from a floating-point literal
    ///
    /// - Parameter value: The degree value as a double
    public init(floatLiteral value: Double) {
        self = .angle(.deg(value))
    }
}
