import Foundation
import CSSTypeTypes

/// The CSS `padding-right` property sets the width of the padding area on the right of an element.
///
/// An element's padding area is the space between its content and its border.
///
/// Example:
/// ```swift
/// .paddingRight(.px(20))      // padding-right: 20px
/// .paddingRight(.em(1.5))     // padding-right: 1.5em
/// .paddingRight(.percentage(10)) // padding-right: 10%
/// .paddingRight(0)            // padding-right: 0
/// ```
///
/// - SeeAlso: [MDN Web Docs on padding-right](https://developer.mozilla.org/en-US/docs/Web/CSS/padding-right)
public enum PaddingRight: Property, LengthPercentageConvertible {
    public static let property: String = "padding-right"
    
    /// A length or percentage value for the right padding
    case lengthPercentage(LengthPercentage)
    
    /// Global values
    case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension PaddingRight: CustomStringConvertible {
    /// Converts the padding-right value to its CSS string representation
    public var description: String {
        switch self {
        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description
            
        case .global(let global):
            return global.description
        }
    }
}

extension PaddingRight: ExpressibleByIntegerLiteral {
    /// Creates a padding-right from an integer literal (interpreted as pixels)
    ///
    /// - Parameter value: The padding in pixels
    public init(integerLiteral value: Int) {
        self = .lengthPercentage(.px(Double(value)))
    }
}

extension PaddingRight: ExpressibleByFloatLiteral {
    /// Creates a padding-right from a floating-point literal (interpreted as pixels)
    ///
    /// - Parameter value: The padding in pixels
    public init(floatLiteral value: Double) {
        self = .lengthPercentage(.px(value))
    }
}
