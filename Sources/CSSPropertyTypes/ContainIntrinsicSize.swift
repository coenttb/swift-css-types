import CSSTypeTypes
import Foundation

/// The `contain-intrinsic-size` CSS shorthand property sets the size of an element that a browser will use for layout when
/// the element is subject to size containment.
///
/// This shorthand sets both `contain-intrinsic-width` and `contain-intrinsic-height` properties at once.
/// It's commonly used with `content-visibility: auto` to provide hints for offscreen rendering optimization.
///
/// - SeeAlso: [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/CSS/contain-intrinsic-size)
public enum ContainIntrinsicSize: Property, GlobalConvertible, LengthConvertible {
    public static let property: String = "contain-intrinsic-size"

    /// The element has no intrinsic size in both dimensions.
    case none

    /// The element has the specified length in both dimensions.
    case length(Length)

    /// Different width and height values for the element.
    case widthHeight(Length, Length)

    /// When the element is in size containment and skipping its contents, both dimensions are remembered
    /// from the actual size of the element when it was last rendered. If there is no remembered value
    /// or it is not skipping contents, both dimensions are the specified length.
    case auto(Length)

    /// Auto with none value for both dimensions.
    case autoNone

    /// Different auto values for width and height dimensions.
    case autoWidthHeight(ContainIntrinsicWidth, ContainIntrinsicHeight)

    /// Global values
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .none:
            return "none"
        case .length(let length):
            return length.description
        case .widthHeight(let width, let height):
            return "\(width.description) \(height.description)"
        case .auto(let length):
            return "auto \(length.description)"
        case .autoNone:
            return "auto none"
        case .autoWidthHeight(let width, let height):
            return "\(width.description) \(height.description)"
        case .global(let value):
            return value.description
        }
    }
}

// MARK: - Factory Methods

public extension ContainIntrinsicSize {

    /// Different auto values for width and height dimensions.
    static func auto(width: ContainIntrinsicWidth, height: ContainIntrinsicHeight) -> Self {
        .autoWidthHeight(width, height)
    }

    /// Different width and height values for the element.
    static func size(width: Length, height: Length) -> Self {
        .widthHeight(width, height)
    }
}
