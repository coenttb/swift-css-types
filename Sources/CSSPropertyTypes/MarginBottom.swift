import Foundation
import CSSTypeTypes

/// The CSS `margin-bottom` property sets the margin area on the bottom of an element.
///
/// A positive value places the element farther from its neighbors, while a negative value
/// places it closer. This property has no effect on non-replaced inline elements, such as
/// `<span>` or `<code>`.
///
/// Examples:
/// ```swift
/// .marginBottom(.auto)                // margin-bottom: auto
/// .marginBottom(.px(20))              // margin-bottom: 20px
/// .marginBottom(.percentage(10))      // margin-bottom: 10%
/// .marginBottom(.em(2.5))             // margin-bottom: 2.5em
/// .marginBottom(.zero)                // margin-bottom: 0
/// .marginBottom(-10)                  // margin-bottom: -10px (negative margin)
/// ```
///
/// - SeeAlso: [MDN Web Docs on margin-bottom](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-bottom)
public enum MarginBottom: Property, LengthPercentageConvertible, ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
    public static let property: String = "margin-bottom"
    
    /// A specific length or percentage value for the margin
    case lengthPercentage(LengthPercentage)
    
    /// Browser automatically determines the margin
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
extension MarginBottom: LengthConvertible {}

