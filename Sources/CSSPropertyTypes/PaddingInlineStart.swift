import CSSTypeTypes
import Foundation

/// The CSS `padding-inline-start` property defines the logical inline start padding of an element,
/// which maps to a physical padding depending on the element's writing mode, directionality, and text orientation.
///
/// This is part of CSS Logical Properties, which are writing-mode aware equivalents of physical properties.
/// For example, in a left-to-right horizontal writing mode (like English), `padding-inline-start` is equivalent
/// to `padding-left`. In a right-to-left writing mode (like Arabic), it would be equivalent to `padding-right`.
///
/// Example:
/// ```swift
/// .paddingInlineStart(.px(20))      // padding-inline-start: 20px
/// .paddingInlineStart(.em(1.5))     // padding-inline-start: 1.5em
/// .paddingInlineStart(.percentage(10)) // padding-inline-start: 10%
/// .paddingInlineStart(0)            // padding-inline-start: 0
/// ```
///
/// - SeeAlso: [MDN Web Docs on padding-inline-start](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-inline-start)
public enum PaddingInlineStart: Property, LengthPercentageConvertible {
    public static let property: String = "padding-inline-start"

    /// A length or percentage value for the inline-start padding
    case lengthPercentage(LengthPercentage)

    /// Global values
    case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension PaddingInlineStart: CustomStringConvertible {
    /// Converts the padding-inline-start value to its CSS string representation
    public var description: String {
        switch self {
        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description

        case .global(let global):
            return global.description
        }
    }
}

extension PaddingInlineStart: ExpressibleByIntegerLiteral {
    /// Creates a padding-inline-start from an integer literal (interpreted as pixels)
    ///
    /// - Parameter value: The padding in pixels
    public init(integerLiteral value: Int) {
        self = .lengthPercentage(.px(Double(value)))
    }
}

extension PaddingInlineStart: ExpressibleByFloatLiteral {
    /// Creates a padding-inline-start from a floating-point literal (interpreted as pixels)
    ///
    /// - Parameter value: The padding in pixels
    public init(floatLiteral value: Double) {
        self = .lengthPercentage(.px(value))
    }
}
