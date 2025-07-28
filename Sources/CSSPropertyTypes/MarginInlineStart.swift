import CSSTypeTypes
import Foundation

/// The CSS `margin-inline-start` property defines the logical inline start margin of an element.
///
/// This property maps to a physical margin depending on the element's writing mode, directionality,
/// and text orientation. It corresponds to the different physical margin properties as follows:
/// - In `horizontal-tb` with `ltr` direction, it maps to `margin-left`
/// - In `horizontal-tb` with `rtl` direction, it maps to `margin-right`
/// - In `vertical-rl`, it maps to `margin-top`
/// - In `vertical-lr`, it maps to `margin-bottom`
///
/// Examples:
/// ```swift
/// .marginInlineStart(.auto)                // margin-inline-start: auto
/// .marginInlineStart(.px(20))              // margin-inline-start: 20px
/// .marginInlineStart(.percentage(10))      // margin-inline-start: 10%
/// .marginInlineStart(.em(2.5))             // margin-inline-start: 2.5em
/// .marginInlineStart(.zero)                // margin-inline-start: 0
/// ```
///
/// - SeeAlso: [MDN Web Docs on margin-inline-start](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-inline-start)
public enum MarginInlineStart: Property, LengthPercentageConvertible, ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
    public static let property: String = "margin-inline-start"
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
