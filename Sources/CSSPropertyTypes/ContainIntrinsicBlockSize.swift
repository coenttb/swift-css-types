import CSSTypeTypes
import Foundation

/// The `contain-intrinsic-block-size` CSS property defines the block size of an element that a browser can use for
/// layout when the element is subject to size containment.
///
/// Block size is the size in the dimension perpendicular to the flow of text within a line. In horizontal writing
/// modes, this is the vertical dimension (height); in vertical writing modes, it's the horizontal dimension.
///
/// - SeeAlso: [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/CSS/contain-intrinsic-block-size)
public enum ContainIntrinsicBlockSize: Property, LengthConvertible {
    public static let property: String = "contain-intrinsic-block-size"

    /// The element has no intrinsic block size.
    case none

    /// The element has the specified block size.
    case length(Length)

    /// When the element is in size containment and skipping its contents, the block size is remembered
    /// from the actual size of the element when it was last rendered. If there is no remembered value
    /// or it is not skipping contents, the block size is the specified length.
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
