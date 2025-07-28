import CSSTypeTypes
import Foundation

/// The `fill-rule` CSS property defines the algorithm used to determine which parts of an SVG shape
/// are considered "inside" and should be filled.
///
/// This property is particularly important for complex shapes with intersecting paths or shapes 
/// with holes, where it may not be obvious which areas should be filled. If present, it overrides 
/// the SVG element's `fill-rule` attribute.
///
/// - Note: This property only applies to SVG elements like `<path>`, `<polygon>`, `<polyline>`, `<text>`,
///         and related text elements.
///
/// - SeeAlso: [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/CSS/fill-rule)
public enum FillRule: Property {
    public static let property: String = "fill-rule"
    /// Uses ray crossing algorithm counting intersections; if count is zero, point is outside
    case nonzero

    /// Uses ray crossing algorithm counting intersections; if count is odd, point is inside
    case evenodd

    /// Global values
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .nonzero:
            return "nonzero"
        case .evenodd:
            return "evenodd"
        case .global(let value):
            return value.description
        }
    }
}
