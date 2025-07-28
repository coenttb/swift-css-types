import CSSTypeTypes
import Foundation

/// Represents the CSS `border-end-end-radius` property, which defines a logical border radius on an element,
/// which maps to a physical border radius that depends on the element's writing-mode, direction, and text-orientation.
///
/// This property affects the corner between the block-end and the inline-end sides of the element.
/// For instance, in a horizontal-tb writing mode with ltr direction, it corresponds to the border-bottom-right-radius property.
///
/// Visual reference based on writing mode:
/// ```
/// horizontal-tb + ltr:          horizontal-tb + rtl:
/// ┌───────────────────┐         ┌───────────────────┐
/// │                   │         │                   │
/// │                   │         │                   │
/// │                   │         │                   │
/// │                   │         │                   │
/// └───────────────────┘         └───────────────────┘
///                    ▲                   ▲
///             border-end-end-radius    border-end-end-radius
///
/// vertical-rl:                vertical-lr:
/// ┌───────────────────┐       ┌───────────────────┐
/// │                   │       │                   │
/// │                   │       │                   │
/// │                   │       │                   │
/// │                   │       │                   │
/// └───────────────────┘       └───────────────────┘
///  ▲                                            ▲
/// border-end-end-radius                  border-end-end-radius
/// ```
///
/// Example:
/// ```swift
/// // Set the border-end-end-radius to 5px
/// .borderEndEndRadius(.px(5))
///
/// // Set the border-end-end-radius to different horizontal and vertical radii
/// .borderEndEndRadius(.px(5), .px(10))
/// ```
///
/// - SeeAlso: [MDN Web Docs on border-end-end-radius](https://developer.mozilla.org/en-US/docs/Web/CSS/border-end-end-radius)
public enum BorderEndEndRadius: Property {

    public static let property: String = "border-end-end-radius"

    /// A single radius applied to both the horizontal and vertical dimensions
    case radius(LengthPercentage)

    /// Different radii for horizontal and vertical dimensions
    case horizontal_vertical(LengthPercentage, LengthPercentage)

    /// Global CSS values
    case global(CSSTypeTypes.Global)
}

/// Provides string conversion for CSS output
extension BorderEndEndRadius: CustomStringConvertible {
    /// Converts the border-end-end-radius to its CSS string representation
    ///
    /// This method generates CSS like:
    /// ```css
    /// border-end-end-radius: 5px;
    /// border-end-end-radius: 5px 10px;
    /// ```
    public var description: String {
        switch self {
        case .radius(let radius):
            return radius.description
        case .horizontal_vertical(let horizontal, let vertical):
            return "\(horizontal) \(vertical)"
        case .global(let global):
            return global.description
        }
    }
}

extension BorderEndEndRadius: LengthPercentageConvertible {
    public static func lengthPercentage(_ value: CSSTypeTypes.LengthPercentage) -> BorderEndEndRadius {
        .radius(value)
    }
}
