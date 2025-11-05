import Foundation

/// Represents a CSS time-percentage value.
///
/// The `TimePercentage` type represents a value that can be either a time value
/// or a percentage value. It is used in properties where either a time or a
/// percentage is acceptable, such as in certain animation and transition properties.
///
/// Example:
/// ```swift
/// .transitionDelay(.time(.s(0.5)))       // transition-delay: 0.5s
/// .transitionDelay(.percentage(50))      // transition-delay: 50%
/// ```
///
/// - Note: When a percentage is used, it typically resolves to a time value based on context.
///
/// - SeeAlso: [MDN Web Docs on time-percentage](https://developer.mozilla.org/en-US/docs/Web/CSS/time-percentage)
public enum TimePercentage: Sendable, Hashable, PercentageConvertible {
    /// A time value in seconds or milliseconds
    case time(Time)

    /// A percentage value
    case percentage(Percentage)

    /// Creates a time value in seconds
    /// - Parameter value: The time in seconds
    /// - Returns: A time-percentage with a seconds value
    public static func s(_ value: Double) -> TimePercentage {
        return .time(.s(value))
    }

    /// Creates a time value in milliseconds
    /// - Parameter value: The time in milliseconds
    /// - Returns: A time-percentage with a milliseconds value
    public static func ms(_ value: Double) -> TimePercentage {
        return .time(.ms(value))
    }

    /// Creates a time-percentage value of 0 seconds
    public static let zero = TimePercentage.time(.zero)

    /// Creates a time-percentage value of 50%
    public static let half = TimePercentage.percentage(50)

    /// Creates a time-percentage value of 100%
    public static let full = TimePercentage.percentage(100)
}

/// Provides string conversion for CSS output
extension TimePercentage: CustomStringConvertible {
    /// Converts the time-percentage to its CSS string representation
    public var description: String {
        switch self {
        case .time(let time):
            return time.description
        case .percentage(let percentage):
            return percentage.description
        }
    }
}

/// Arithmetic operations for TimePercentage values
extension TimePercentage {
    /// Multiplies a time-percentage value by a scalar
    /// - Parameters:
    ///   - lhs: Time-percentage value
    ///   - rhs: Scalar multiplier
    /// - Returns: The product
    public static func * (lhs: TimePercentage, rhs: Double) -> TimePercentage {
        switch lhs {
        case .time(let time):
            return .time(time * rhs)
        case .percentage(let percentage):
            return .percentage(percentage * rhs)
        }
    }

    /// Divides a time-percentage value by a scalar
    /// - Parameters:
    ///   - lhs: Time-percentage value
    ///   - rhs: Scalar divisor
    /// - Returns: The quotient
    public static func / (lhs: TimePercentage, rhs: Double) -> TimePercentage {
        switch lhs {
        case .time(let time):
            return .time(time / rhs)
        case .percentage(let percentage):
            return .percentage(percentage / rhs)
        }
    }
}

/// Integer literal conversion
extension TimePercentage: ExpressibleByIntegerLiteral {
    /// Creates a time-percentage in seconds from an integer literal
    public init(integerLiteral value: Int) {
        self = .time(Time(integerLiteral: value))
    }
}

/// Floating point literal conversion
extension TimePercentage: ExpressibleByFloatLiteral {
    /// Creates a time-percentage in seconds from a floating point literal
    public init(floatLiteral value: Double) {
        self = .time(Time(floatLiteral: value))
    }
}
