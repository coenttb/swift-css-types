import CSSTypeTypes
import Foundation

/// The CSS `stop-color` property defines the color to use for an SVG `<stop>` element within
/// a gradient. If present, it overrides the element's stop-color attribute.
///
/// Note: The stop-color property only applies to `<stop>` elements nested in an `<svg>`.
/// It doesn't apply to other SVG, HTML, or pseudo-elements.
///
/// Example:
/// ```swift
/// .stopColor(.named(.red))           // stop-color: red
/// .stopColor(.hex("#66ccff"))        // stop-color: #66ccff
/// .stopColor(.hsl(120, 75, 25, 0.6)) // stop-color: hsl(120deg 75% 25% / 60%)
/// .stopColor(.currentColor)          // stop-color: currentcolor
/// .stopColor(.global(.inherit))      // stop-color: inherit
/// ```
///
/// - SeeAlso: [MDN Web Docs on stop-color](https://developer.mozilla.org/en-US/docs/Web/CSS/stop-color)
public enum StopColor: Property, ColorConvertible {
  public static let property: String = "stop-color"

  /// A specific color value
  case color(CSSTypeTypes.Color)

  /// Global values
  case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension StopColor: CustomStringConvertible {
  public var description: String {
    switch self {
    case .color(let color):
      return color.description

    case .global(let global):
      return global.description
    }
  }
}

/// Factory methods for creating stop-color values
extension StopColor {
  /// Creates a color that matches the current color value
  public static let currentColor: StopColor = .color(.currentColor)
}
