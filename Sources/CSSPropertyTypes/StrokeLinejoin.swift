//
// StrokeLinejoin.swift

import CSSTypeTypes

/// The `stroke-linejoin` CSS property defines the shape to be used at the corners of an SVG element's stroked paths.
/// If present, it overrides the element's stroke-linejoin attribute.
///
/// This property applies to any SVG corner-generating shape or text-content element, but as an inherited property,
/// it may be applied to elements such as `<g>` and still have the intended effect on descendant elements.
///
/// ```css
/// stroke-linejoin: bevel;
/// stroke-linejoin: miter;
/// stroke-linejoin: round;
/// ```
public enum StrokeLinejoin: Property {
    public static let property: String = "stroke-linejoin"

    /// A sharp corner is used to join path segments
    case miter

    /// A bevelled corner is used to join path segments
    case bevel

    /// A round corner is used to join path segments
    case round

    /// Global CSS value
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .miter: return "miter"
        case .bevel: return "bevel"
        case .round: return "round"
        case .global(let global): return global.description
        }
    }
}
