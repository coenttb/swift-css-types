//
//  NumberConvertible.swift
//  swift-css
//
//  Created on 03/31/2025.
//

import Foundation

/// Protocol for types that can be created from CSS Number values
///
/// NumberConvertible provides a common interface for types that accept CSS number values.
/// This enables consistent handling of numeric values across different CSS properties,
/// allowing for ergonomic API design and code reuse.
///
/// Types that conform to this protocol can be initialized with any CSS Number value
/// and gain access to a standard set of factory methods for creating instances with
/// common numeric operations.
///
/// Example:
/// ```swift
/// // FlexGrow conforms to NumberConvertible
/// FlexGrow(1.5)      // 1.5
/// FlexGrow.number(2) // 2
///
/// // Direct conversion from Number values
/// let num: Number = 0.75
/// let flexGrow = FlexGrow(num)
/// ```
///
/// This protocol is particularly useful for CSS properties that accept number values
/// but require specific types for additional functionality or validation.
public protocol NumberConvertible {
    /// Creates an instance from a CSS Number value
    ///
    /// This is the core method of the protocol that all conforming types must implement.
    /// It defines how to convert a generic CSS Number into the specific type.
    ///
    /// - Parameter number: A CSS Number value
    /// - Returns: An instance of the conforming type
    ///
    /// Example implementation:
    /// ```swift
    /// static func number(_ number: Number) -> Self {
    ///     return Self(cssValue: number.description)
    /// }
    /// ```
    static func number(_ number: Number) -> Self
}

/// Default initializer for NumberConvertible types
extension NumberConvertible {
    /// Creates an instance from a CSS Number value
    ///
    /// This initializer provides a convenient way to create a number-convertible instance
    /// directly from a Number value.
    ///
    /// - Parameter number: A CSS Number value
    ///
    /// Example:
    /// ```swift
    /// let number: Number = 1.5
    /// let flexGrow = FlexGrow(number)
    /// ```
    public init(_ number: Number) {
        self = .number(number)
    }

    /// Creates an instance from a Double value
    ///
    /// This initializer provides a convenient way to create a number-convertible instance
    /// directly from a Double value.
    ///
    /// - Parameter value: A Double value
    ///
    /// Example:
    /// ```swift
    /// let flexGrow = FlexGrow(1.5)
    /// ```
    public init(_ value: Double) {
        self = .number(Number(value))
    }

    /// Creates an instance from an Int value
    ///
    /// This initializer provides a convenient way to create a number-convertible instance
    /// directly from an Int value.
    ///
    /// - Parameter value: An Int value
    ///
    /// Example:
    /// ```swift
    /// let flexGrow = FlexGrow(2)
    /// ```
    public init(_ value: Int) {
        self = .number(Number(value))
    }
}

/// Factory methods for creating NumberConvertible instances
extension NumberConvertible {
    /// Creates an instance with a value of zero
    ///
    /// - Returns: A new instance representing the value 0
    ///
    /// Example:
    /// ```swift
    /// FlexGrow.zero  // 0
    /// ```
    public static var zero: Self { .number(.zero) }

    /// Creates an instance with a value of one
    ///
    /// - Returns: A new instance representing the value 1
    ///
    /// Example:
    /// ```swift
    /// FlexGrow.one  // 1
    /// ```
    public static var one: Self { .number(.one) }
}
