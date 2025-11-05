//
// ShapeRendering.swift

import CSSTypeTypes

/// The `shape-rendering` CSS property provides hints to the renderer about what tradeoffs to make when rendering
/// shapes like paths, circles, or rectangles. It only has an effect on the SVG elements like `<circle>`, `<ellipse>`,
/// `<line>`, `<path>`, `<polygon>`, `<polyline>`, and `<rect>`.
///
/// ```css
/// shape-rendering: auto;
/// shape-rendering: crispEdges;
/// shape-rendering: geometricPrecision;
/// shape-rendering: optimizeSpeed;
/// ```
public enum ShapeRendering: Property {
    public static let property: String = "shape-rendering"

    /// Directs user agents to make tradeoffs balancing speed, edge crispness, and geometric precision,
    /// with geometric precision given more importance
    case auto

    /// Emphasizes edge contrast over geometric precision or rendering speed,
    /// likely skipping techniques like anti-aliasing
    case crispEdges

    /// Emphasizes geometric precision over speed or crisp edges,
    /// may involve anti-aliasing
    case geometricPrecision

    /// Emphasizes rendering speed over geometric precision or edge crispness,
    /// likely skipping techniques like anti-aliasing
    case optimizeSpeed

    /// Global CSS value
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .auto: return "auto"
        case .crispEdges: return "crispEdges"
        case .geometricPrecision: return "geometricPrecision"
        case .optimizeSpeed: return "optimizeSpeed"
        case .global(let global): return global.description
        }
    }
}
