import Foundation

/// Represents a CSS percentage value.
///
/// The `Percentage` type represents a percentage value in CSS, which is often used to
/// define a size as relative to an element's parent object. Percentages can be used in
/// numerous properties such as `width`, `height`, `margin`, `padding`, and `font-size`.
///
/// Example:
/// ```swift
/// .width(.percentage(50))          // width: 50%
/// .marginLeft(.percentage(20))     // margin-left: 20%
/// .fontSize(.percentage(150))      // font-size: 150%
/// ```
///
/// - Note: When percentages are inherited, the calculated value (not the percentage itself)
///         is passed to child elements.
///
/// - SeeAlso: [MDN Web Docs on percentage](https://developer.mozilla.org/en-US/docs/Web/CSS/percentage)
@dynamicMemberLookup
public struct Percentage: Sendable, Hashable {
    /// The percentage value
    public let value: Double

    /// Creates a new CSS percentage value
    /// - Parameter value: The percentage value (e.g., 50 for 50%)
    public init(_ value: Double) {
        self.value = value
    }

    /// Creates a new CSS percentage value from an integer
    /// - Parameter value: The percentage value as an integer
    public init(_ value: Int) {
        self.value = Double(value)
    }

    /// Creates a CSS percentage value of 0%
    public static let zero = Percentage(0)

    /// Creates a CSS percentage value of 50%
    public static let half = Percentage(50)

    /// Creates a CSS percentage value of 100%
    public static let full = Percentage(100)

    subscript<T>(dynamicMember keyPath: KeyPath<Double, T>) -> T {
        value[keyPath: keyPath]
    }
}

/// Provides string conversion for CSS output
extension Percentage: CustomStringConvertible {
    /// Converts the percentage to its CSS string representation
    public var description: String {
        return "\(value.truncatingRemainder())%"
    }
}

/// Integer literal conversion
extension Percentage: ExpressibleByIntegerLiteral {
    /// Creates a percentage from an integer literal
    public init(integerLiteral value: Int) {
        self.init(value)
    }
}

/// Floating point literal conversion
extension Percentage: ExpressibleByFloatLiteral {
    /// Creates a percentage from a floating point literal
    public init(floatLiteral value: Double) {
        self.init(value)
    }
}

/// Percentage comparison and arithmetic operations
extension Percentage {
    /// Compares two percentages
    public static func < (lhs: Percentage, rhs: Percentage) -> Bool {
        return lhs.value < rhs.value
    }

    /// Adds two percentages
    public static func + (lhs: Percentage, rhs: Percentage) -> Percentage {
        return Percentage(lhs.value + rhs.value)
    }

    /// Subtracts one percentage from another
    public static func - (lhs: Percentage, rhs: Percentage) -> Percentage {
        return Percentage(lhs.value - rhs.value)
    }

    /// Multiplies a percentage by a factor
    public static func * (lhs: Percentage, rhs: Double) -> Percentage {
        return Percentage(lhs.value * rhs)
    }

    /// Divides a percentage by a factor
    public static func / (lhs: Percentage, rhs: Double) -> Percentage {
        return Percentage(lhs.value / rhs)
    }

    /// Creates a percentage that represents the fraction of this percentage
    ///
    /// - Parameter fraction: The fraction to calculate (0.0 to 1.0)
    /// - Returns: A new percentage representing the specified fraction
    public func fraction(_ fraction: Double) -> Percentage {
        return self * fraction
    }
}

extension Percentage {
    public func truncatingRemainder() -> String {
        value.truncatingRemainder()
    }
}

extension Int {
    public var percentage: Percentage { .init(integerLiteral: self) }
    public var percent: Percentage { self.percentage }
}

extension Double {
    public var percentage: Percentage { .init(floatLiteral: self) }
    public var percent: Percentage { self.percentage }
}

extension Percentage: Comparable {

}
