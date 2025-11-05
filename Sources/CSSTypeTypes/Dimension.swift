import Foundation

/// Represents a CSS dimension, which is a number with a unit.
///
/// The `Dimension` data type is the generic parent type for all CSS values that combine
/// a numeric value with a unit, such as lengths, times, frequencies, and resolutions.
///
/// This protocol provides common functionality for various dimension types such as
/// `Length`, `Time`, `Frequency`, and `Resolution`.
///
/// - Note: A dimension value always consists of a number immediately followed by a unit.
///         No whitespace is allowed between the number and unit.
///
/// - SeeAlso: [MDN Web Docs on dimension values](https://developer.mozilla.org/en-US/docs/Web/CSS/dimension)
public protocol Dimension: Sendable, Hashable, CustomStringConvertible {
    /// The numeric value of the dimension
    var value: Double { get }

    /// The unit of the dimension
    var unit: String { get }
}

/// Default implementation for Dimension types
extension Dimension {
    /// Converts the dimension to its CSS string representation
    ///
    /// This method formats the numeric value with its unit for CSS output.
    public var description: String {
        return "\(value.truncatingRemainder())\(unit)"
    }
}

/// Represents a CSS length dimension.
///
/// The `Length` type represents CSS length values with various units like
/// pixels, ems, percentages, etc. This is a concrete implementation of
/// the `Dimension` protocol for length values.
///
/// ```swift
/// let pixels = Length(20, unit: "px")   // 20px
/// let ems = Length(1.5, unit: "em")     // 1.5em
/// ```
///
/// - Note: This is a basic implementation. The full library would likely have
///         specialized types for each specific dimension category.
public struct GenericDimension: Dimension {
    /// The numeric value of the dimension
    public let value: Double

    /// The unit of the dimension
    public let unit: String

    /// Creates a new dimension with the specified value and unit
    ///
    /// - Parameters:
    ///   - value: The numeric value of the dimension
    ///   - unit: The unit of the dimension
    public init(_ value: Double, unit: String) {
        self.value = value
        self.unit = unit
    }

    /// Creates a new dimension with the specified value and unit
    ///
    /// - Parameters:
    ///   - value: The numeric value of the dimension as an integer
    ///   - unit: The unit of the dimension
    public init(_ value: Int, unit: String) {
        self.value = Double(value)
        self.unit = unit
    }
}
