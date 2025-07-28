import Foundation

/// Represents a CSS hue angle value for color functions.
///
/// The `Hue` type represents the hue angle of a color, used in color functions such as
/// `hsl()`, `hwb()`, `lch()`, and `oklch()`. Hue is expressed either as an angle or a number.
///
/// Example:
/// ```swift
/// .color(.hsl(hue: .degrees(120), saturation: 100, lightness: 50))  // Lime green
/// .color(.hsl(hue: .turn(0.75), saturation: 100, lightness: 50))    // Blue (0.75 turn = 270 degrees)
/// ```
///
/// - Note: Hue values are normalized to the range [0deg, 360deg). They implicitly wrap around,
///         so 480deg is equivalent to 120deg, -120deg is equivalent to 240deg, etc.
///
/// - SeeAlso: [MDN Web Docs on hue](https://developer.mozilla.org/en-US/docs/Web/CSS/hue)
public enum Hue: Sendable, Hashable, AngleConvertible {
    /// Hue expressed as a number (interpreted as degrees)
    case number(Number)

    /// Hue expressed as an angle
    case angle(Angle)

    /// Normalizes the hue angle to its equivalent angle in the range [0, 360) degrees
    ///
    /// This method converts the hue angle to degrees and then ensures that the value
    /// is in the range of 0 to 360 (exclusive of 360 itself).
    ///
    /// - Returns: The normalized hue angle in degrees
    public func normalizedDegrees() -> Double {
        let degrees: Double

        switch self {
        case .number(let number):
            degrees = number.value
        case .angle(let angle):
            // Convert angle to degrees
            switch angle {
            case .deg(let value):
                degrees = value
            case .grad(let value):
                degrees = value * 0.9  // 1 grad = 0.9 deg
            case .rad(let value):
                degrees = value * 180.0 / .pi
            case .turn(let value):
                degrees = value * 360.0
            }
        }

        // Normalize to [0, 360)
        return ((degrees.truncatingRemainder(dividingBy: 360.0)) + 360.0).truncatingRemainder(dividingBy: 360.0)
    }
}

extension Hue: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: IntegerLiteralType) {
        self = .number(.init(value))
    }
}

extension Hue: ExpressibleByFloatLiteral {
    public init(floatLiteral value: FloatLiteralType) {
        self = .number(.init(value))
    }
}

/// Provides string conversion for CSS output
extension Hue: CustomStringConvertible {
    /// Converts the hue to its CSS string representation
    public var description: String {
        switch self {
        case .number(let value):
            return value.value.truncatingRemainder()
        case .angle(let angle):
            return angle.description
        }
    }
}
