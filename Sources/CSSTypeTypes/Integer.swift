import Foundation

/// Represents a CSS integer value.
///
/// The `Integer` type represents a positive or negative whole number in CSS.
/// Integers can be used in numerous CSS properties such as `column-count`,
/// `counter-increment`, `grid-column`, `grid-row`, and `z-index`.
///
/// Example:
/// ```swift
/// .zIndex(5)              // z-index: 5
/// .columnCount(-2)        // column-count: -2
/// ```
///
/// - Note: There is no official range of valid integer values in the CSS specifications.
///
/// - SeeAlso: [MDN Web Docs on integer](https://developer.mozilla.org/en-US/docs/Web/CSS/integer)
public struct Integer: Sendable, Hashable {
    /// The integer value
    public let value: Int

    /// Creates a new CSS integer value
    /// - Parameter value: The integer value
    public init(_ value: Int) {
        self.value = value
    }

    /// Creates a CSS integer value with value 0
    public static let zero = Integer(0)

    /// Creates a CSS integer value with value 1
    public static let one = Integer(1)
}

/// Provides string conversion for CSS output
extension Integer: CustomStringConvertible {
    /// Converts the integer to its CSS string representation
    public var description: String {
        return "\(value)"
    }
}

/// Integer literal conversion
extension Integer: ExpressibleByIntegerLiteral {
    /// Creates an integer from an integer literal
    public init(integerLiteral value: Int) {
        self.init(value)
    }
}

/// Integer comparison and arithmetic operations
extension Integer {
    /// Compares two integers
    public static func < (lhs: Integer, rhs: Integer) -> Bool {
        return lhs.value < rhs.value
    }

    /// Adds two integers
    public static func + (lhs: Integer, rhs: Integer) -> Integer {
        return Integer(lhs.value + rhs.value)
    }

    /// Subtracts one integer from another
    public static func - (lhs: Integer, rhs: Integer) -> Integer {
        return Integer(lhs.value - rhs.value)
    }

    /// Negates an integer
    public static prefix func - (operand: Integer) -> Integer {
        return Integer(-operand.value)
    }

    /// Absolute value of an integer
    public var absolute: Integer {
        return Integer(abs(value))
    }
}
