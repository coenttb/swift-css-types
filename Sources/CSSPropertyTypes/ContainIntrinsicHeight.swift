import Foundation
import CSSTypeTypes

/// The `contain-intrinsic-height` CSS property defines the height of an element that a browser can use for
/// layout when the element is subject to size containment.
///
/// This property is often used with `content-visibility: auto` to provide a hint for offscreen rendering optimization.
///
/// - SeeAlso: [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/CSS/contain-intrinsic-height)
public enum ContainIntrinsicHeight: Property, LengthConvertible {
    public static let property: String = "contain-intrinsic-height"
    
    /// The element has no intrinsic height.
    case none
    
    /// The element has the specified height.
    case length(Length)
    
    /// When the element is in size containment and skipping its contents, the height is remembered
    /// from the actual size of the element when it was last rendered. If there is no remembered value
    /// or it is not skipping contents, the height is the specified length.
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

