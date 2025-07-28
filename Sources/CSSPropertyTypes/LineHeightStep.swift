import CSSTypeTypes
import Foundation

/// The CSS `line-height-step` property sets the step unit for line box heights.
///
/// When the property is set, line box heights are rounded up to the closest multiple of the value.
/// This property promotes better rhythm and regularity in line heights, creating a more consistent
/// vertical rhythm across text with different fonts, sizes, and other properties.
///
/// Example:
/// ```swift
/// .lineHeightStep(.px(12))           // line-height-step: 12px
/// .lineHeightStep(.global(.inherit))  // line-height-step: inherit
/// ```
///
/// - Note: This is an experimental property and may not be supported by all browsers.
///
/// - SeeAlso: [MDN Web Docs on line-height-step](https://developer.mozilla.org/en-US/docs/Web/CSS/line-height-step)
public enum LineHeightStep: Property, LengthConvertible, ExpressibleByFloatLiteral, ExpressibleByIntegerLiteral {
    public static let property: String = "line-height-step"
    /// A specific length value defining the step unit
    case length(Length)

    /// Global values
    case global(CSSTypeTypes.Global)

    // MARK: - Protocol Conformance

    /// Implementation of the CustomStringConvertible protocol
    public var description: String {
        switch self {
        case .length(let length):
            return length.description
        case .global(let global):
            return global.description
        }
    }

    // MARK: - Convenience initializers

    /// Create a line-height-step using a float literal as pixels
    public init(floatLiteral value: Double) {
        self = .px(value)
    }

    /// Create a line-height-step using an integer literal as pixels
    public init(integerLiteral value: Int) {
        self = .px(Double(value))
    }

}
