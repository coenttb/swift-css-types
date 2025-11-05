import CSSTypeTypes
import Foundation

/// The CSS `padding-inline-end` property defines the logical inline end padding of an element,
/// which maps to a physical padding depending on the element's writing mode, directionality, and text orientation.
///
/// This is part of CSS Logical Properties, which are writing-mode aware equivalents of physical properties.
/// For example, in a left-to-right horizontal writing mode (like English), `padding-inline-end` is equivalent
/// to `padding-right`. In a right-to-left writing mode (like Arabic), it would be equivalent to `padding-left`.
///
/// Example:
/// ```swift
/// .paddingInlineEnd(.px(20))      // padding-inline-end: 20px
/// .paddingInlineEnd(.em(1.5))     // padding-inline-end: 1.5em
/// .paddingInlineEnd(.percentage(10)) // padding-inline-end: 10%
/// .paddingInlineEnd(0)            // padding-inline-end: 0
/// ```
///
/// - SeeAlso: [MDN Web Docs on padding-inline-end](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-inline-end)
public enum PaddingInlineEnd: Property, LengthPercentageConvertible {
    public static let property: String = "padding-inline-end"

    /// A length or percentage value for the inline-end padding
    case lengthPercentage(LengthPercentage)

    /// Global values
    case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension PaddingInlineEnd: CustomStringConvertible {
    /// Converts the padding-inline-end value to its CSS string representation
    public var description: String {
        switch self {
        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description

        case .global(let global):
            return global.description
        }
    }
}

extension PaddingInlineEnd: ExpressibleByIntegerLiteral {
    /// Creates a padding-inline-end from an integer literal (interpreted as pixels)
    ///
    /// - Parameter value: The padding in pixels
    public init(integerLiteral value: Int) {
        self = .lengthPercentage(.px(Double(value)))
    }
}

extension PaddingInlineEnd: ExpressibleByFloatLiteral {
    /// Creates a padding-inline-end from a floating-point literal (interpreted as pixels)
    ///
    /// - Parameter lengthPercentage: The padding in pixels
    public init(floatLiteral lengthPercentage: Double) {
        self = .lengthPercentage(.px(lengthPercentage))
    }
}
