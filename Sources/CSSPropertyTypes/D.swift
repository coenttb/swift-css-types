import CSSTypeTypes
import Foundation

/// The `d` CSS property defines a path to be drawn by SVG path elements.
///
/// This property overrides the SVG `d` attribute if present and only applies to `<path>`
/// elements nested in an `<svg>` element, not to other SVG elements or HTML elements.
///
/// - Note: The path data string follows SVG path syntax and contains commands that implicitly use pixel units.
///
/// - SeeAlso: [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/CSS/d)
public enum D: Property {
  public static let property: String = "d"

  /// No path is drawn
  case none

  /// A path definition string that defines an SVG path
  case path(String)

  /// Global values
  case global(CSSTypeTypes.Global)

  public var description: String {
    switch self {
    case .none:
      return "none"
    case .path(let pathData):
      return "path(\"\(pathData)\")"
    case .global(let value):
      return value.description
    }
  }
}
