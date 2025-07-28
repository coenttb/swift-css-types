import CSSTypeTypes
import Foundation

/// The CSS `margin-block-end` property defines the logical block end margin of an element.
///
/// This property maps to a physical margin depending on the element's writing mode, directionality,
/// and text orientation. It corresponds to the different physical margin properties as follows:
/// - In `horizontal-tb` (horizontal top-to-bottom) writing mode, it maps to `margin-bottom`
/// - In `vertical-rl` (vertical right-to-left) writing mode, it maps to `margin-left`
/// - In `vertical-lr` (vertical left-to-right) writing mode, it maps to `margin-right`
///
/// Examples:
/// ```swift
/// .marginBlockEnd(.auto)                // margin-block-end: auto
/// .marginBlockEnd(.px(20))              // margin-block-end: 20px
/// .marginBlockEnd(.percentage(10))      // margin-block-end: 10%
/// .marginBlockEnd(.em(2.5))             // margin-block-end: 2.5em
/// .marginBlockEnd(.zero)                // margin-block-end: 0
/// ```
///
/// - SeeAlso: [MDN Web Docs on margin-block-end](https://developer.mozilla.org/en-US/docs/Web/CSS/margin-block-end)
public enum MarginBlockEnd: Property, LengthPercentageConvertible, ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
    public static let property: String = "margin-block-end"
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

// Allow creation from Length values
extension MarginBlockEnd: LengthConvertible {}
