import Foundation

/// Represents a CSS number value.
///
/// The `Number` type represents a number in CSS, which can be either an integer
/// or a number with a fractional component. Numbers are used in various CSS properties
/// like `opacity`, `line-height`, and `animation-iteration-count`.
///
/// Example:
/// ```swift
/// .opacity(0.5)               // opacity: 0.5
/// .lineHeight(1.2)            // line-height: 1.2
/// .animationIterationCount(3) // animation-iteration-count: 3
/// ```
///
/// - SeeAlso: [MDN Web Docs on number](https://developer.mozilla.org/en-US/docs/Web/CSS/number)
public struct Number: Sendable, Equatable {
    /// The numeric value
    public let value: Double
    
    /// Creates a new CSS number value
    /// - Parameter value: The numeric value
    public init(_ value: Double) {
        self.value = value
    }
    
    /// Creates a new CSS number value from an integer
    /// - Parameter value: The integer value
    public init(_ value: Int) {
        self.value = Double(value)
    }
    
    /// Creates a CSS number value with value 0
    public static let zero = Number(0)
    
    /// Creates a CSS number value with value 1
    public static let one = Number(1)
}


/// Literal conversions
extension Number: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
    /// Creates a number from an integer literal
    public init(integerLiteral value: Int) {
        self.init(value)
    }
    
    /// Creates a number from a float literal
    public init(floatLiteral value: Double) {
        self.init(value)
    }
}

/// Number comparison and arithmetic operations
extension Number {
    /// Compares two numbers
    public static func < (lhs: Number, rhs: Number) -> Bool {
        return lhs.value < rhs.value
    }
    
    /// Compares two numbers
    public static func > (lhs: Number, rhs: Number) -> Bool {
        return lhs.value > rhs.value
    }
    
    /// Adds two numbers
    public static func + (lhs: Number, rhs: Number) -> Number {
        return Number(lhs.value + rhs.value)
    }
    
    /// Subtracts one number from another
    public static func - (lhs: Number, rhs: Number) -> Number {
        return Number(lhs.value - rhs.value)
    }
    
    /// Multiplies two numbers
    public static func * (lhs: Number, rhs: Number) -> Number {
        return Number(lhs.value * rhs.value)
    }
    
    /// Divides one number by another
    public static func / (lhs: Number, rhs: Number) -> Number {
        return Number(lhs.value / rhs.value)
    }
    
    /// Negates a number
    public static prefix func - (operand: Number) -> Number {
        return Number(-operand.value)
    }
    
    /// Absolute value of a number
    public var absolute: Number {
        return Number(abs(value))
    }
    
    /// Rounds the number to the nearest integer
    public var rounded: Number {
        return Number(round(value))
    }
    
    /// Rounds the number down to the nearest integer
    public var floor: Number {
        return Number(Foundation.floor(value))
    }
    
    /// Rounds the number up to the nearest integer
    public var ceil: Number {
        return Number(Foundation.ceil(value))
    }
}

/// Provides string conversion for CSS output
extension Number: CustomStringConvertible {
    /// Converts the number to its CSS string representation
    ///
    /// - Returns: A string representation with decimal points removed if not needed
    public var description: String {
        return value.truncatingRemainder()
    }
}
