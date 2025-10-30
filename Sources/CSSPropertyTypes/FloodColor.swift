import CSSTypeTypes
import Foundation

/// The CSS `flood-color` property defines the color used in filter effects for the
/// `<feFlood>` and `<feDropShadow>` SVG filter elements.
///
/// This property applies only to SVG filter elements and overrides the element's flood-color attribute.
///
/// Example:
/// ```swift
/// .floodColor(.red)                // flood-color: red
/// .floodColor(.hex("#f36"))        // flood-color: #f36
/// .floodColor(.currentColor)       // flood-color: currentcolor
/// .floodColor(.global(.inherit))   // flood-color: inherit
/// ```
///
/// - SeeAlso: [MDN Web Docs on flood-color](https://developer.mozilla.org/en-US/docs/Web/CSS/flood-color)
public enum FloodColor: Property, ColorConvertible {
  public static let property: String = "flood-color"

  /// A specific color value
  case color(CSSTypeTypes.Color)

  /// Current color value
  case currentColor

  /// Global values
  case global(CSSTypeTypes.Global)

  public var description: String {
    switch self {
    case .color(let color):
      return color.description
    case .currentColor:
      return "currentcolor"
    case .global(let value):
      return value.description
    }
  }
}
