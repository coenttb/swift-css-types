import CSSTypeTypes
import Foundation

/// The CSS `padding-bottom` property sets the height of the padding area on the bottom of an element.
///
/// An element's padding area is the space between its content and its border.
///
/// Example:
/// ```swift
/// .paddingBottom(.px(20))      // padding-bottom: 20px
/// .paddingBottom(.em(1.5))     // padding-bottom: 1.5em
/// .paddingBottom(.percentage(10)) // padding-bottom: 10%
/// .paddingBottom(0)            // padding-bottom: 0
/// ```
///
/// - SeeAlso: [MDN Web Docs on padding-bottom](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-bottom)
public enum PaddingBottom: Property, LengthPercentageConvertible {
    public static let property: String = "padding-bottom"

    /// A length or percentage value for the bottom padding
    case lengthPercentage(LengthPercentage)

    /// Global values
    case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension PaddingBottom: CustomStringConvertible {
    /// Converts the padding-bottom value to its CSS string representation
    public var description: String {
        switch self {
        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description

        case .global(let global):
            return global.description
        }
    }
}

extension PaddingBottom: ExpressibleByFloatLiteral {
    /// Creates a padding-bottom from a floating-point literal (interpreted as pixels)
    ///
    /// - Parameter value: The padding in pixels
    public init(floatLiteral value: Double) {
        self = .lengthPercentage(.px(value))
    }
}
