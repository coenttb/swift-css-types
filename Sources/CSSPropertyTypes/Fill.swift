import CSSTypeTypes
import Foundation

/// The `fill` CSS property defines how the interior of SVG shapes and text content are painted.
///
/// This property controls the fill color, gradient, or pattern used to paint the inside areas of
/// SVG shapes like circles, rectangles, paths, and text elements. If present, it overrides
/// the element's `fill` attribute.
///
/// - Note: This property only applies to SVG elements like `<circle>`, `<ellipse>`, `<path>`,
///         `<polygon>`, `<polyline>`, `<rect>`, `<text>`, and related text elements.
///
/// - SeeAlso: [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/CSS/fill)
public indirect enum Fill: Property, ColorConvertible {
    public static let property: String = "fill"

    /// No fill is painted (transparent)
    case none

    /// Uses the fill value from a context element
    case contextFill

    /// Uses the stroke value from a context element
    case contextStroke

    /// A specific color for the fill
    case color(CSSTypeTypes.Color)

    /// A URL reference to an SVG paint server element (gradient, pattern)
    case url(Url)

    /// A URL with a fallback color if the URL reference doesn't resolve
    case urlWithFallback(url: Url, fallback: Fill = .none)

    /// Global values
    case global(CSSTypeTypes.Global)

    public var description: String {
        switch self {
        case .none:
            return "none"
        case .contextFill:
            return "context-fill"
        case .contextStroke:
            return "context-stroke"
        case .color(let color):
            return color.description
        case .url(let url):
            return url.description
        case .urlWithFallback(let url, let fallback):
            return "url(\(url)) \(fallback)"
        case .global(let value):
            return value.description
        }
    }
}
