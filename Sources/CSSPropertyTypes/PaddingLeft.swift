import CSSTypeTypes
import Foundation

/// The CSS `padding-left` property sets the width of the padding area to the left of an element.
///
/// An element's padding area is the space between its content and its border.
///
/// Example:
/// ```swift
/// .paddingLeft(.px(20))      // padding-left: 20px
/// .paddingLeft(.em(1.5))     // padding-left: 1.5em
/// .paddingLeft(.percentage(10)) // padding-left: 10%
/// .paddingLeft(0)            // padding-left: 0
/// ```
///
/// - SeeAlso: [MDN Web Docs on padding-left](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-left)
public enum PaddingLeft: Property, LengthPercentageConvertible {
    public static let property: String = "padding-left"

    /// A length or percentage value for the left padding
    case lengthPercentage(LengthPercentage)

    /// Global values
    case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension PaddingLeft: CustomStringConvertible {
    /// Converts the padding-left value to its CSS string representation
    public var description: String {
        switch self {
        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description

        case .global(let global):
            return global.description
        }
    }
}

extension PaddingLeft: ExpressibleByIntegerLiteral {
    /// Creates a padding-left from an integer literal (interpreted as pixels)
    ///
    /// - Parameter value: The padding in pixels
    public init(integerLiteral value: Int) {
        self = .lengthPercentage(.px(Double(value)))
    }
}

extension PaddingLeft: ExpressibleByFloatLiteral {
    /// Creates a padding-left from a floating-point literal (interpreted as pixels)
    ///
    /// - Parameter value: The padding in pixels
    public init(floatLiteral value: Double) {
        self = .lengthPercentage(.px(value))
    }
}
