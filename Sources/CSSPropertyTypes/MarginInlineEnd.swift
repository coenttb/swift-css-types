import Foundation
import CSSTypeTypes

/// The CSS `margin-inline-end` property defines the logical inline end margin of an element.
///
/// This property maps to a physical margin depending on the element's writing mode, directionality,
/// and text orientation. It corresponds to the different physical margin properties as follows:
/// - In `horizontal-tb` with `ltr` direction, it maps to `margin-right`
/// - In `horizontal-tb` with `rtl` direction, it maps to `margin-left`
/// - In `vertical-rl`, it maps to `margin-bottom`
/// - In `vertical-lr`, it maps to `margin-top`
///
/// Examples:
/// ```swift
/// .marginInlineEnd(.auto)                // margin-inline-end: auto
/// .marginInlineEnd(.px(20))              // margin-inline-end: 20px
/// .marginInlineEnd(.percentage(10))      // margin-inline-end: 10%
/// .marginInlineEnd(.em(2.5))             // margin-inline-end: 2.5em
/// .marginInlineEnd(.zero)                // margin-inline-end: 0
/// ```
///
/// - SeeAlso: [MDN Web Docs on margin-inline-end](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-inline-end)
public enum MarginInlineEnd: Property, LengthPercentageConvertible, ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
    public static let property: String = "margin-inline-end"
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
}
