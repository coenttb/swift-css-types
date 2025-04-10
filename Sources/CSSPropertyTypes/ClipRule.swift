import Foundation
import CSSTypeTypes

/// The CSS `clip-rule` property defines how to determine which pixels in a mask's box are inside the
/// clipping shape defined by a clip path, and which are outside, when parts of the path overlap other parts.
///
/// It chooses between the "non-zero" and "even-odd" methods of determining inclusion.
/// This property applies to all SVG elements but only has an effect on those which are part of a clipping path.
///
/// Example:
/// ```swift
/// .clipRule(.nonzero)  // clip-rule: nonzero
/// .clipRule(.evenodd)  // clip-rule: evenodd
/// ```
///
/// - SeeAlso: [MDN Web Docs on clip-rule](https://developer.mozilla.org/en-US/docs/Web/CSS/clip-rule)
public enum ClipRule: Property {
    public static let property: String = "clip-rule"
    
    /// For points inside a clipping region, a ray is drawn from that point in any direction.
    /// The number of times the ray crosses path segments that are moving right-to-left vs. left-to-right is counted.
    /// If the total is non-zero, the point is inside the shape.
    case nonzero
    
    /// For points inside a clipping region, a ray is drawn from that point in any direction.
    /// The number of times the ray crosses any path segment is counted.
    /// If this count is odd, the point is inside the shape; if it's even, the point is outside.
    case evenodd
    
    /// Global values
    case global(CSSTypeTypes.Global)
    
    public var description: String {
        switch self {
        case .nonzero: return "nonzero"
        case .evenodd: return "evenodd"
        case .global(let global): return global.description
        }
    }
}
