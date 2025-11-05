import Foundation

/// Represents a CSS value that can be either an angle or a percentage.
///
/// The `AnglePercentage` data type allows expressing a value as either a specific angle
/// (like 45deg, 0.5turn) or as a percentage that will be calculated relative to
/// a context-dependent reference value.
///
/// Example:
/// ```swift
/// .hue(.angle(.deg(45)))     // Rotate hue by 45 degrees
/// .hue(.percentage(50))      // Rotate hue by 50% of the reference angle
/// .rotate(.angle(.turn(0.5))) // Rotate by half a turn (180 degrees)
/// .rotate(.percentage(50))    // Rotate by 50% of the reference angle
/// ```
///
/// - Note: When percentages are used, they resolve to an angle value based on the context.
///         This means percentage values can be used in `calc()` expressions where angles
///         are expected.
///
/// - SeeAlso: [MDN Web Docs on angle-percentage values](https://developer.mozilla.org/en-US/docs/Web/CSS/angle-percentage)
public enum AnglePercentage: Sendable, Hashable, ExpressibleByIntegerLiteral,
    ExpressibleByFloatLiteral, PercentageConvertible, AngleConvertible
{
    /// An angle value with specific units
    /// ```css
    /// hue-rotate(45deg);
    /// rotate(0.5turn);
    /// ```
    case angle(Angle)

    /// A percentage value that resolves to an angle in context
    /// ```css
    /// hue-rotate(50%);
    /// rotate(50%);
    /// ```
    case percentage(Percentage)

    /// Creates an angle-percentage value from an integer literal (as degrees)
    ///
    /// This allows you to use integers directly where angle-percentages are expected.
    /// Note that numeric literals are interpreted as degrees.
    ///
    /// ```swift
    /// .hueRotate(45)     // 45 degrees
    /// .rotate(90)        // 90 degrees
    /// ```
    ///
    /// If you need other angle units or percentages, use the specific cases:
    /// ```swift
    /// .hueRotate(.angle(.turn(0.5)))   // Half turn (180 degrees)
    /// .hueRotate(.percentage(50))      // 50% of the reference angle
    /// ```
    public init(integerLiteral value: Int) {
        self = .angle(.deg(Double(value)))
    }

    /// Creates an angle-percentage value from a floating-point literal (as degrees)
    ///
    /// This allows you to use decimals directly where angle-percentages are expected.
    /// Note that numeric literals are interpreted as degrees.
    ///
    /// ```swift
    /// .hueRotate(45.5)   // 45.5 degrees
    /// .rotate(0.5)       // 0.5 degrees (NOT 0.5 turns or 50%!)
    /// ```
    ///
    /// If you need other angle units or percentages, use the specific cases:
    /// ```swift
    /// .hueRotate(.angle(.turn(0.5)))   // Half turn (180 degrees)
    /// .hueRotate(.percentage(50))      // 50% of the reference angle
    /// ```
    public init(floatLiteral value: Double) {
        self = .angle(.deg(value))
    }
}

/// Provides string conversion for CSS output
extension AnglePercentage: CustomStringConvertible {
    /// Converts the angle-percentage value to its CSS string representation
    ///
    /// This method generates the appropriate CSS string for either an angle or percentage value.
    public var description: String {
        switch self {
        case .angle(let angle):
            return angle.description
        case .percentage(let percentage):
            return percentage.description
        }
    }
}
