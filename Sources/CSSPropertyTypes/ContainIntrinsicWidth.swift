import CSSTypeTypes
import Foundation

/// The `contain-intrinsic-width` CSS property defines the width of an element that a browser can use for
/// layout when the element is subject to size containment.
///
/// This property is often used with `content-visibility: auto` to provide a hint for offscreen rendering optimization.
///
/// - SeeAlso: [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/CSS/contain-intrinsic-width)
public enum ContainIntrinsicWidth: Property, GlobalConvertible, LengthConvertible {
    public static let property: String = "contain-intrinsic-width"

    /// The element has no intrinsic width.
    case none

    /// The element has the specified width.
    case length(Length)

    /// When the element is in size containment and skipping its contents, the width is remembered
    /// from the actual size of the element when it was last rendered. If there is no remembered value
    /// or it is not skipping contents, the width is the specified length.
    case auto(Length)

    /// Auto with none value
    case autoNone

    /// Global values
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .none:
            return "none"
        case .length(let length):
            return length.description
        case .auto(let length):
            return "auto \(length.description)"
        case .autoNone:
            return "auto none"
        case .global(let value):
            return value.description
        }
    }
}
