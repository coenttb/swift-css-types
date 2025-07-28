import CSSTypeTypes
import Foundation

/// The CSS `inset-block-start` property defines the logical block start offset of an element,
/// which maps to a physical inset depending on the element's writing mode, directionality,
/// and text orientation.
///
/// It corresponds to the `top`, `right`, `bottom`, or `left` property depending on
/// the values defined for `writing-mode`, `direction`, and `text-orientation`.
///
/// This property is essential for creating layouts that adapt properly to different writing systems:
/// - In `horizontal-tb` (horizontal top-to-bottom) writing mode with `ltr` direction, it maps to `top`
/// - In `horizontal-tb` writing mode with `rtl` direction, it maps to `top`
/// - In `vertical-rl` (vertical right-to-left) writing mode, it maps to `right`
/// - In `vertical-lr` (vertical left-to-right) writing mode, it maps to `left`
///
/// This property has no effect on non-positioned elements.
///
/// Example:
/// ```swift
/// .insetBlockStart(.auto)                // inset-block-start: auto
/// .insetBlockStart(.px(20))              // inset-block-start: 20px
/// .insetBlockStart(.percentage(10))      // inset-block-start: 10%
/// .insetBlockStart(.em(2.5))             // inset-block-start: 2.5em
/// .insetBlockStart(.zero)                // inset-block-start: 0
/// ```
///
/// - SeeAlso: [MDN Web Docs on inset-block-start](https://developer.mozilla.org/en-US/docs/Web/CSS/inset-block-start)
public enum InsetBlockStart: Property, LengthPercentageConvertible {
    public static let property: String = "inset-block-start"

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
