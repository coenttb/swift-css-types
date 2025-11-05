import Foundation

/// Represents a CSS time value.
///
/// The `Time` type represents a time value expressed in seconds or milliseconds. It is used
/// in animation, transition, and related properties to specify durations and delays.
///
/// Example:
/// ```swift
/// .transitionDuration(.s(0.3))          // transition-duration: 0.3s
/// .animationDelay(.ms(500))             // animation-delay: 500ms
/// .transition(duration: .s(1))          // transition: 1s
/// ```
///
/// - Note: Even for time values of 0, a unit (s or ms) must always be specified in CSS.
///
/// - SeeAlso: [MDN Web Docs on time](https://developer.mozilla.org/en-US/docs/Web/CSS/time)
public struct Time: Sendable, Hashable {
    /// Represents a time unit (seconds or milliseconds)
    public enum Unit: String, Sendable, Hashable {
        /// Seconds
        case second = "s"

        /// Milliseconds
        case millisecond = "ms"

        public static let s: Self = .second
        public static let ms: Self = .millisecond
    }

    /// The numeric value of the time
    public let value: Double

    /// The unit of the time
    public let unit: Unit

    /// Creates a new CSS time value
    /// - Parameters:
    ///   - value: The numeric time value
    ///   - unit: The time unit (s or ms)
    public init(_ value: Double, unit: Unit) {
        self.value = value
        self.unit = unit
    }

    /// Creates a time value in seconds
    /// - Parameter value: The time in seconds
    /// - Returns: A time value in seconds
    public static func s(_ value: Double) -> Time {
        return .init(value, unit: .second)
    }

    /// Creates a time value in milliseconds
    /// - Parameter value: The time in milliseconds
    /// - Returns: A time value in milliseconds
    public static func ms(_ value: Double) -> Time {
        return .init(value, unit: .millisecond)
    }

    /// Creates a time value of 0 seconds
    public static let zero = Time(0, unit: .second)

    /// Creates a time value of 1 second
    public static let oneSecond = Time(1, unit: .second)

    /// Creates a time value of 0.5 seconds (500ms)
    public static let halfSecond = Time(0.5, unit: .second)

    /// Converts the time to seconds, regardless of the original unit
    public var inSeconds: Double {
        switch unit {
        case .second:
            return value
        case .millisecond:
            return value / 1000
        }
    }

    /// Converts the time to milliseconds, regardless of the original unit
    public var inMilliseconds: Double {
        switch unit {
        case .second:
            return value * 1000
        case .millisecond:
            return value
        }
    }

    /// Converts the time to a different unit
    /// - Parameter targetUnit: The unit to convert to
    /// - Returns: A new time in the requested unit with an equivalent value
    public func converted(to targetUnit: Unit) -> Time {
        if unit == targetUnit {
            return self
        }

        switch targetUnit {
        case .second:
            return .init(inSeconds, unit: .second)
        case .millisecond:
            return .init(inMilliseconds, unit: .ms)
        }
    }
}

/// Provides string conversion for CSS output
extension Time: CustomStringConvertible {
    /// Converts the time to its CSS string representation
    public var description: String {
        return "\(value.truncatingRemainder())\(unit.rawValue)"
    }
}

/// Arithmetic operations for Time values
extension Time {
    /// Adds two time values
    /// - Parameters:
    ///   - lhs: First time value
    ///   - rhs: Second time value
    /// - Returns: The sum, using the unit of the left operand
    public static func + (lhs: Time, rhs: Time) -> Time {
        let seconds = lhs.inSeconds + rhs.inSeconds
        return .init(seconds, unit: .second).converted(to: lhs.unit)
    }

    /// Subtracts one time value from another
    /// - Parameters:
    ///   - lhs: First time value
    ///   - rhs: Second time value
    /// - Returns: The difference, using the unit of the left operand
    public static func - (lhs: Time, rhs: Time) -> Time {
        let seconds = lhs.inSeconds - rhs.inSeconds
        return .init(seconds, unit: .second).converted(to: lhs.unit)
    }

    /// Multiplies a time value by a scalar
    /// - Parameters:
    ///   - lhs: Time value
    ///   - rhs: Scalar multiplier
    /// - Returns: The product
    public static func * (lhs: Time, rhs: Double) -> Time {
        return .init(lhs.value * rhs, unit: lhs.unit)
    }

    /// Divides a time value by a scalar
    /// - Parameters:
    ///   - lhs: Time value
    ///   - rhs: Scalar divisor
    /// - Returns: The quotient
    public static func / (lhs: Time, rhs: Double) -> Time {
        return .init(lhs.value / rhs, unit: lhs.unit)
    }

    /// Negates a time value
    /// - Parameter value: Time value to negate
    /// - Returns: The negated value
    public static prefix func - (value: Time) -> Time {
        return .init(-value.value, unit: value.unit)
    }
}

/// Comparison operations for Time values
extension Time: Comparable {
    /// Compares two time values
    /// - Parameters:
    ///   - lhs: First time value
    ///   - rhs: Second time value
    /// - Returns: True if the first value is less than the second
    public static func < (lhs: Time, rhs: Time) -> Bool {
        return lhs.inSeconds < rhs.inSeconds
    }

    /// Checks if two time values are equal by comparing their durations
    /// - Parameters:
    ///   - lhs: First time value
    ///   - rhs: Second time value
    /// - Returns: True if the time values represent the same duration
    public static func == (lhs: Time, rhs: Time) -> Bool {
        return lhs.inSeconds == rhs.inSeconds
    }
}

/// Integer literal conversion
extension Time: ExpressibleByIntegerLiteral {
    /// Creates a time in seconds from an integer literal
    public init(integerLiteral value: Int) {
        self.init(Double(value), unit: .second)
    }
}

/// Floating point literal conversion
extension Time: ExpressibleByFloatLiteral {
    /// Creates a time in seconds from a floating point literal
    public init(floatLiteral value: Double) {
        self.init(value, unit: .second)
    }
}
