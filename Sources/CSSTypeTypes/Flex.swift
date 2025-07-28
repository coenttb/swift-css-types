import Foundation

/// Represents a CSS flexible length unit (fr) used in grid layouts.
///
/// The `Flex` data type denotes a fraction of the available space in a grid container.
/// It is used primarily in `grid-template-columns`, `grid-template-rows`, and related
/// grid layout properties.
///
/// Example:
/// ```swift
/// .gridTemplateColumns([.flex(1), .flex(2), .flex(1)])  // Creates three columns with a 1:2:1 ratio
/// .gridTemplateRows([.px(50), .flex(1), .flex(2)])     // Fixed height row followed by two flexible rows
/// ```
///
/// - Note: The `fr` unit distributes available space after accounting for all non-flexible items.
///         Multiple `fr` units create proportional divisions of space.
///
/// - SeeAlso: [MDN Web Docs on flex data type](https://developer.mozilla.org/en-US/docs/Web/CSS/flex_number)
public struct Flex: Sendable, Hashable {
    /// The number of fractions of available space to use
    public let number: Number

    /// Creates a flex number with the specified number of fractions
    ///
    /// - Parameter number: The number of fractions of available space
    public init(_ number: Number) {
        self.number = number
    }

    /// Creates a flex number with the specified number of fractions
    ///
    /// - Parameter number: The number of fractions of available space as an integer
    public init(_ number: Int) {
        self.number = .init(number)
    }
}

/// Provides string conversion for CSS output
extension Flex: CustomStringConvertible {
    /// Converts the flex number to its CSS string representation
    ///
    /// This method formats the number and appends the 'fr' unit.
    public var description: String {
        return "\(number)fr"
    }
}

/// Allow creation of flex numbers from integer literals
extension Flex: ExpressibleByIntegerLiteral {
    /// Creates a flex number from an integer literal
    ///
    /// - Parameter number: The integer literal to convert to a flex number
    public init(integerLiteral number: IntegerLiteralType) {
        self.init(.init(number))
    }
}

/// Allow creation of flex numbers from floating point literals
extension Flex: ExpressibleByFloatLiteral {
    /// Creates a flex number from a floating point literal
    ///
    /// - Parameter number: The floating point literal to convert to a flex number
    public init(floatLiteral number: FloatLiteralType) {
        self.init(Number(number))
    }
}
