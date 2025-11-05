import CSSTypeTypes
import Foundation

/// The CSS `outline-offset` property sets the amount of space between an outline and the edge or border of an element.
///
/// This property allows you to place the outline inside or outside the element's box.
/// Negative values place the outline inside the element's borders.
///
/// Example:
/// ```swift
/// .outlineOffset(.px(4))     // outline-offset: 4px
/// .outlineOffset(.em(0.6))    // outline-offset: 0.6em
/// .outlineOffset(.px(-5))     // outline-offset: -5px (inside the element)
/// ```
///
/// - SeeAlso: [MDN Web Docs on outline-offset](https://developer.mozilla.org/en-US/docs/Web/CSS/outline-offset)
public enum OutlineOffset: Property, LengthConvertible {
    public static let property: String = "outline-offset"

    /// A length value defining the offset distance
    case length(Length)

    /// Global value
    case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension OutlineOffset: CustomStringConvertible {
    /// Converts the outline-offset value to its CSS string representation
    public var description: String {
        switch self {
        case .length(let length):
            return length.description
        case .global(let global):
            return global.description
        }
    }
}

/// Convenience factory methods for OutlineOffset
extension OutlineOffset {
    /// Creates an outline-offset with a pixel value
    ///
    /// - Parameter value: The pixel value
    /// - Returns: An OutlineOffset with the specified pixel length
    public static func px(_ value: Double) -> Self {
        .length(.px(value))
    }

    /// Creates an outline-offset with an em value
    ///
    /// - Parameter value: The em value
    /// - Returns: An OutlineOffset with the specified em length
    public static func em(_ value: Double) -> Self {
        .length(.em(value))
    }

    /// Creates an outline-offset with a rem value
    ///
    /// - Parameter value: The rem value
    /// - Returns: An OutlineOffset with the specified rem length
    public static func rem(_ value: Double) -> Self {
        .length(.rem(value))
    }
}

/// Allow for numeric literals to be used directly
extension OutlineOffset: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
    /// Creates an outline-offset with a pixel value from an integer literal
    ///
    /// - Parameter value: The pixel value as an integer
    public init(integerLiteral value: Int) {
        self = .px(Double(value))
    }

    /// Creates an outline-offset with a pixel value from a floating-point literal
    ///
    /// - Parameter value: The pixel value as a double
    public init(floatLiteral value: Double) {
        self = .px(value)
    }
}
