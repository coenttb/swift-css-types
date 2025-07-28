import CSSTypeTypes
import Foundation

/// The CSS `padding-block-start` property defines the logical block start padding of an element, 
/// which maps to a physical padding depending on the element's writing mode, directionality, and text orientation.
///
/// This is part of CSS Logical Properties, which are writing-mode aware equivalents of physical properties.
/// For example, in a horizontal top-to-bottom writing mode (like English), `padding-block-start` is equivalent
/// to `padding-top`.
///
/// Example:
/// ```swift
/// .paddingBlockStart(.px(20))      // padding-block-start: 20px
/// .paddingBlockStart(.em(1.5))     // padding-block-start: 1.5em
/// .paddingBlockStart(.percentage(10)) // padding-block-start: 10%
/// .paddingBlockStart(0)            // padding-block-start: 0
/// ```
///
/// - SeeAlso: [MDN Web Docs on padding-block-start](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-block-start)
public enum PaddingBlockStart: Property, LengthPercentageConvertible {
    public static let property: String = "padding-block-start"

    /// A length or percentage value for the block-start padding
    case lengthPercentage(LengthPercentage)

    /// Global values
    case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension PaddingBlockStart: CustomStringConvertible {
    /// Converts the padding-block-start value to its CSS string representation
    public var description: String {
        switch self {
        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description

        case .global(let global):
            return global.description
        }
    }
}

extension PaddingBlockStart: ExpressibleByIntegerLiteral {
    /// Creates a padding-block-start from an integer literal (interpreted as pixels)
    ///
    /// - Parameter value: The padding in pixels
    public init(integerLiteral value: Int) {
        self = .lengthPercentage(.px(Double(value)))
    }
}

extension PaddingBlockStart: ExpressibleByFloatLiteral {
    /// Creates a padding-block-start from a floating-point literal (interpreted as pixels)
    ///
    /// - Parameter value: The padding in pixels
    public init(floatLiteral value: Double) {
        self = .lengthPercentage(.px(value))
    }
}
