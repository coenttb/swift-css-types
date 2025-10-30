import CSSTypeTypes
import Foundation

/// The CSS `outline-color` property sets the color of an element's outline.
///
/// An outline is a line drawn around an element, outside the border.
/// This property defines the color of that line.
///
/// Example:
/// ```swift
/// .outlineColor(.red)                   // outline-color: red
/// .outlineColor(.hex("#32a1ce"))        // outline-color: #32a1ce
/// .outlineColor(.rgba(170, 50, 220, 0.6)) // outline-color: rgba(170, 50, 220, 0.6)
/// .outlineColor(.currentColor)         // outline-color: currentcolor
/// ```
///
/// - SeeAlso: [MDN Web Docs on outline-color](https://developer.mozilla.org/en-US/docs/Web/CSS/outline-color)
public enum OutlineColor: Property, ColorConvertible {
  public static let property: String = "outline-color"

  /// A specific color value
  case color(CSSTypeTypes.Color)

  /// Automatically determined color (typically the inverse of the background)
  case auto

  /// Global value
  case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension OutlineColor: CustomStringConvertible {
  /// Converts the outline-color value to its CSS string representation
  public var description: String {
    switch self {
    case .color(let color):
      return color.description
    case .auto:
      return "auto"
    case .global(let global):
      return global.description
    }
  }
}
