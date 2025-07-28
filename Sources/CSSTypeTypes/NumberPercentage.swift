import Foundation

/// Represents a CSS value that can be either a number or a percentage.
///
/// The `NumberPercentage` type is used in properties that accept either a number value
/// (like `10px`, `2em`) or a percentage value (like `50%`). This combined type is used
/// throughout CSS in properties like `width`, `height`, `margin`, `padding`, etc.
///
/// Example:
/// ```swift
/// .width(.number(.px(200)))      // width: 200px
/// .height(.percentage(50))       // height: 50%
/// .margin(.calc("100% - 20px"))  // margin: calc(100% - 20px)
/// ```
///
/// - Note: When a percentage is used in a calc() expression, it resolves to a number,
///         making it suitable for calculations involving number units.
///
/// - SeeAlso: [MDN Web Docs on number-percentage](https://developer.mozilla.org/en-US/docs/Web/CSS/number-percentage)
public enum NumberPercentage: Sendable, Hashable, NumberConvertible, PercentageConvertible {
    /// A number value with a specific unit
    case number(Number)

    /// A percentage value
    case percentage(Percentage)
}

/// Provides string conversion for CSS output
extension NumberPercentage: CustomStringConvertible {
    /// Converts the number-percentage to its CSS string representation
    public var description: String {
        switch self {
        case .number(let number):
            return number.description
        case .percentage(let percentage):
            return percentage.description
        }
    }
}

/// Allow creation of NumberPercentage values from integer literals
extension NumberPercentage: ExpressibleByIntegerLiteral {
    /// Creates a number-percentage from an integer literal (pixels)
    ///
    /// - Parameter value: The pixel value as an integer
    public init(integerLiteral value: IntegerLiteralType) {
        self = .number(.init(value))
    }
}

/// Allow creation of NumberPercentage values from floating point literals
extension NumberPercentage: ExpressibleByFloatLiteral {
    /// Creates a number-percentage from a floating point literal (pixels)
    ///
    /// - Parameter value: The pixel value as a double
    public init(floatLiteral value: FloatLiteralType) {
        self = .number(.init(value))
    }
}
