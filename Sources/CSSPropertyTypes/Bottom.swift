import CSSTypeTypes
import Foundation

/// The CSS `bottom` property participates in setting the vertical position of a positioned element.
/// This inset property has no effect on non-positioned elements.
///
/// The effect of `bottom` depends on how the element is positioned (i.e., the value of the `position` property):
/// - When `position` is set to `absolute` or `fixed`, the `bottom` property specifies the distance
///   between the element's bottom edge and the bottom edge of its containing block.
/// - When `position` is set to `relative`, the `bottom` property specifies the distance
///   the element's bottom edge is moved above its normal position.
/// - When `position` is set to `sticky`, the `bottom` property is used to compute
///   the sticky-constraint rectangle.
/// - When `position` is set to `static`, the `bottom` property has no effect.
///
/// Example:
/// ```swift
/// .bottom(.auto)                // bottom: auto
/// .bottom(.px(20))              // bottom: 20px
/// .bottom(.percentage(10))      // bottom: 10%
/// .bottom(.length(4, .em))      // bottom: 4em
/// .bottom(.zero)                // bottom: 0
/// ```
///
/// - Note: This property has logical mappings in different writing modes.
///         In vertical writing modes, `bottom` corresponds to the physical side
///         that would be "bottom" when viewed in the default orientation.
///
/// - SeeAlso: [MDN Web Docs on bottom](https://developer.mozilla.org/en-US/docs/Web/CSS/bottom)
public enum Bottom: Property, LengthPercentageConvertible {

    public static let property: String = "bottom"

    /// The position is determined automatically based on the element's normal flow position
    case auto

    /// A specific length value
    case lengthPercentage(LengthPercentage)

    /// Global values
    case global(CSSTypeTypes.Global)

}

/// CSS Output conversion
extension Bottom: CustomStringConvertible {
    /// Converts the bottom value to its CSS string representation
    public var description: String {
        switch self {
        case .auto:
            return "auto"

        case .lengthPercentage(let value):
            return value.description
        case .global(let global):
            return global.description
        }
    }
}
