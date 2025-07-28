import CSSTypeTypes
import Foundation

/// The CSS `inset-inline-start` property defines the logical inline start offset of an element,
/// which maps to a physical inset depending on the element's writing mode, directionality,
/// and text orientation.
///
/// It corresponds to the `top`, `right`, `bottom`, or `left` property depending on
/// the values defined for `writing-mode`, `direction`, and `text-orientation`.
///
/// This property is essential for creating layouts that adapt properly to different writing systems:
/// - In `horizontal-tb` (horizontal top-to-bottom) writing mode with `ltr` direction, it maps to `left`
/// - In `horizontal-tb` writing mode with `rtl` direction, it maps to `right`
/// - In `vertical-rl` (vertical right-to-left) writing mode, it maps to `top`
/// - In `vertical-lr` (vertical left-to-right) writing mode, it maps to `top`
///
/// This property has no effect on non-positioned elements.
///
/// Example:
/// ```swift
/// .insetInlineStart(.auto)                // inset-inline-start: auto
/// .insetInlineStart(20)                   // inset-inline-start: 20px
/// .insetInlineStart(.percentage(10))      // inset-inline-start: 10%
/// .insetInlineStart(.em(2.5))             // inset-inline-start: 2.5em
/// ```
///
/// - SeeAlso: [MDN Web Docs on inset-inline-start](https://developer.mozilla.org/en-US/docs/Web/CSS/inset-inline-start)
public enum InsetInlineStart: Property, LengthPercentageConvertible {
    public static let property: String = "inset-inline-start"

    /// The position is determined automatically based on the element's normal flow position
    case auto

    /// A specific length or percentage value
    case lengthPercentage(LengthPercentage)

    /// Global values
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .auto:
            return "auto"
        case .lengthPercentage(let value):
            return value.description
        case .global(let value):
            return value.description
        }
    }
}

/// Convenience initializers for InsetInlineStart
extension InsetInlineStart {
    /// Creates an instance with a pixel value
    public init(_ value: Double) {
        self = .lengthPercentage(.px(value))
    }

    /// Creates an instance with an integer pixel value
    public init(_ value: Int) {
        self = .lengthPercentage(.px(Double(value)))
    }
}

/// Allow creation from Length values
extension InsetInlineStart: LengthConvertible {}
