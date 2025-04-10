import Foundation
import CSSTypeTypes

/// The CSS `line-height` property sets the height of a line box.
///
/// It controls the spacing between lines of text within an element. This property can be specified
/// using different units or unit-less values.
///
/// Example:
/// ```swift
/// .lineHeight(.normal)             // line-height: normal
/// .lineHeight(.multiple(1.5))      // line-height: 1.5
/// .lineHeight(.px(24))             // line-height: 24px
/// .lineHeight(.percentage(150))    // line-height: 150%
/// .lineHeight(.global(.inherit))   // line-height: inherit
/// ```
///
/// - SeeAlso: [MDN Web Docs on line-height](https://developer.mozilla.org/en-US/docs/Web/CSS/line-height)
public enum LineHeight: Property, LengthPercentageConvertible, ExpressibleByFloatLiteral, ExpressibleByIntegerLiteral {
    public static let property: String = "line-height"
    /// Default value. Browser dependent, typically around 1.2 times the font size
    case normal
    
    case lengthPercentage(LengthPercentage)
    
    /// A unitless multiplier value (preferred method for setting line height)
    case multiple(Double)

    
    /// Global values
    case global(CSSTypeTypes.Global)
    
    // MARK: - Convenience initializers
    
    /// Create a line-height using a float literal as a multiplier
    public init(floatLiteral value: Double) {
        self = .multiple(value)
    }
    
    /// Create a line-height using an integer literal as a multiplier
    public init(integerLiteral value: Int) {
        self = .multiple(Double(value))
    }
    

    
    // MARK: - Convenience initializers for common length units
    
    public static func px(_ value: Double) -> LineHeight {
        .length(.px(value))
    }
    
    public static func em(_ value: Double) -> LineHeight {
        .length(.em(value))
    }
    
    public static func rem(_ value: Double) -> LineHeight {
        .length(.rem(value))
    }
    
    public var description: String {
        switch self {
        case .normal:
            return "normal"
        case .lengthPercentage(let lengthPercentage):
            return lengthPercentage.description
        case .multiple(let factor):
            // Ensure non-negative value
            let nonNegative = max(0, factor)
            return nonNegative.truncatingRemainder()
        case .global(let value):
            return value.description
        }
    }
}
