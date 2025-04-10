import Foundation
import CSSTypeTypes

/// The CSS `margin-right` property sets the margin area on the right side of an element.
///
/// A positive value places the element farther from its neighbors, while a negative value
/// places it closer. When both `margin-left` and `margin-right` are set to `auto` in certain
/// layout contexts, the element can be centered horizontally.
///
/// Examples:
/// ```swift
/// .marginRight(.auto)                // margin-right: auto
/// .marginRight(.px(20))              // margin-right: 20px
/// .marginRight(.percentage(10))      // margin-right: 10%
/// .marginRight(.em(2.5))             // margin-right: 2.5em
/// .marginRight(.zero)                // margin-right: 0
/// .marginRight(-10)                  // margin-right: -10px (negative margin)
/// ```
///
/// - SeeAlso: [MDN Web Docs on margin-right](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-right)
public enum MarginRight: Property, LengthPercentageConvertible, ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
    public static let property: String = "margin-right"
    
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
    
    // MARK: - Factory methods
    
    /// Sets margin to 0
    public static var zero: Self {
        return .px(0)
    }
    
    /// Create a margin with pixel units
    public static func px(_ value: Double) -> Self {
        .lengthPercentage(.px(value))
    }
    
    /// Create a margin with em units
    public static func em(_ value: Double) -> Self {
        .lengthPercentage(.em(value))
    }
    
    /// Create a margin with rem units
    public static func rem(_ value: Double) -> Self {
        .lengthPercentage(.rem(value))
    }
    
    /// Create a margin with a percentage value
    public static func percentage(_ value: Double) -> Self {
        .lengthPercentage(.percentage(Percentage(value)))
    }
}

// Allow creation from Length values
extension MarginRight: LengthConvertible {}

