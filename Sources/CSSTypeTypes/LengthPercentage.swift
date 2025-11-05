import Foundation

/// Represents a CSS value that can be either a length or a percentage.
///
/// The `LengthPercentage` type is used in properties that accept either a length value
/// (like `10px`, `2em`) or a percentage value (like `50%`). This combined type is used
/// throughout CSS in properties like `width`, `height`, `margin`, `padding`, etc.
///
/// Example:
/// ```swift
/// .width(.length(.px(200)))      // width: 200px
/// .height(.percentage(50))       // height: 50%
/// .margin(.calc("100% - 20px"))  // margin: calc(100% - 20px)
/// ```
///
/// - Note: When a percentage is used in a calc() expression, it resolves to a length,
///         making it suitable for calculations involving length units.
///
/// - SeeAlso: [MDN Web Docs on length-percentage](https://developer.mozilla.org/en-US/docs/Web/CSS/length-percentage)
public enum LengthPercentage: Sendable, Hashable, LengthConvertible, PercentageConvertible {
    /// A length value with a specific unit
    case length(Length)

    /// A percentage value
    case percentage(Percentage)

    /// A CSS calc() expression
    case calc(String)

    /// Creates a length-percentage from pixels
    ///
    /// - Parameter value: The length in pixels
    /// - Returns: A LengthPercentage with pixel units
    public static func px(_ value: Double) -> LengthPercentage {
        return .length(.px(value))
    }

    /// Creates a length-percentage from ems
    ///
    /// - Parameter value: The length in ems
    /// - Returns: A LengthPercentage with em units
    public static func em(_ value: Double) -> LengthPercentage {
        return .length(.em(value))
    }

    /// Creates a length-percentage from rems
    ///
    /// - Parameter value: The length in rems
    /// - Returns: A LengthPercentage with rem units
    public static func rem(_ value: Double) -> LengthPercentage {
        return .length(.rem(value))
    }
    /// The auto keyword
    ///
    /// The browser determines the appropriate size based on context.
    public static let auto: LengthPercentage = .length(.auto)

    /// Creates a length-percentage from an integer pixel value
    ///
    /// - Parameter value: The pixel value as an integer
    /// - Returns: A LengthPercentage with pixel units
    public static func px(_ value: Int) -> LengthPercentage {
        return .length(.px(Double(value)))
    }

    /// Creates a length-percentage from an integer em value
    ///
    /// - Parameter value: The em value as an integer
    /// - Returns: A LengthPercentage with em units
    public static func em(_ value: Int) -> LengthPercentage {
        return .length(.em(Double(value)))
    }

    /// Creates a length-percentage from an integer rem value
    ///
    /// - Parameter value: The rem value as an integer
    /// - Returns: A LengthPercentage with rem units
    public static func rem(_ value: Int) -> LengthPercentage {
        return .length(.rem(Double(value)))
    }

    /// Creates a length-percentage from an integer percentage
    ///
    /// - Parameter value: The percentage as an integer
    /// - Returns: A LengthPercentage with percentage
    public static func percentage(_ value: Int) -> LengthPercentage {
        return .percentage(Percentage(value))
    }
}

/// Provides string conversion for CSS output
extension LengthPercentage: CustomStringConvertible {
    /// Converts the length-percentage to its CSS string representation
    public var description: String {
        switch self {
        case .length(let length):
            return length.description
        case .percentage(let percentage):
            return percentage.description
        case .calc(let expression):
            return "calc(\(expression))"
        }
    }
}

/// Allow creation of LengthPercentage values from integer literals
extension LengthPercentage: ExpressibleByIntegerLiteral {
    /// Creates a length-percentage from an integer literal (pixels)
    ///
    /// - Parameter value: The pixel value as an integer
    public init(integerLiteral value: IntegerLiteralType) {
        self = .length(.px(Double(value)))
    }
}

/// Allow creation of LengthPercentage values from floating point literals
extension LengthPercentage: ExpressibleByFloatLiteral {
    /// Creates a length-percentage from a floating point literal (pixels)
    ///
    /// - Parameter value: The pixel value as a double
    public init(floatLiteral value: FloatLiteralType) {
        self = .length(.px(value))
    }
}

extension LengthPercentage {
    public static let zero: Self = .length(.zero)
}
