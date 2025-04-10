import Foundation
import CSSTypeTypes

/// The CSS `margin-left` property sets the margin area on the left side of an element.
///
/// A positive value places the element farther from its neighbors, while a negative value
/// places it closer. When both `margin-left` and `margin-right` are set to `auto` in certain
/// layout contexts, the element can be centered horizontally.
///
/// Examples:
/// ```swift
/// .marginLeft(.auto)                // margin-left: auto
/// .marginLeft(.px(20))              // margin-left: 20px
/// .marginLeft(.percentage(10))      // margin-left: 10%
/// .marginLeft(.em(2.5))             // margin-left: 2.5em
/// .marginLeft(.zero)                // margin-left: 0
/// .marginLeft(-10)                  // margin-left: -10px (negative margin)
/// ```
///
/// - SeeAlso: [MDN Web Docs on margin-left](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-left)
public enum MarginLeft: Property, LengthPercentageConvertible, ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
    public static let property: String = "margin-left"
    
    /// A specific length or percentage value for the margin
    case lengthPercentage(LengthPercentage)
    
    /// Browser automatically determines the margin, which can be used for centering in certain contexts
    case auto
    
    /// Global values
    case global(CSSTypeTypes.Global)
    
    // MARK: - Protocol Conformance
    
    /// Implementation of the CustomStringConvertible protocol
    public var description: String {
        switch self {
        case .lengthPercentage(let value):
            return value.description
        case .auto:
            return "auto"
        case .global(let global):
            return global.description
        }
    }
    
    // MARK: - Convenience initializers
    
    /// Create a margin value using a float literal as pixels
    public init(floatLiteral value: Double) {
        self = .px(value)
    }
    
    /// Create a margin value using an integer literal as pixels
    public init(integerLiteral value: Int) {
        self = .px(Double(value))
    }
}
