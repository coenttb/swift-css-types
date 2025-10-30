import CSSTypeTypes
import Foundation

/// Sets the color of decorations added to text by text-decoration-line.
///
/// The text-decoration-color CSS property sets the color of decorations added to text
/// by text-decoration-line. The color applies to decorations, such as underlines,
/// overlines, strikethroughs, and wavy lines like those used to mark misspellings.
///
/// [Learn more at MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/text-decoration-color)
///
/// # Example
/// ```swift
/// let style = Text.textDecorationColor(.color(.red))
/// let style = Text.textDecorationColor(.color(.hex("#21ff21")))
/// let style = Text.textDecorationColor(.color(.rgb(255, 90, 255)))
/// let style = Text.textDecorationColor(.color(.hsl(70, 100, 40)))
/// let style = Text.textDecorationColor(.color(.currentColor))
/// ```
///
/// # CSS Values
/// ```css
/// text-decoration-color: red;
/// text-decoration-color: #21ff21;
/// text-decoration-color: rgb(255, 90, 255);
/// text-decoration-color: hsl(70, 100%, 40%);
/// text-decoration-color: currentColor;
/// ```
public enum TextDecorationColor: Property, ColorConvertible {
  public static let property: String = "text-decoration-color"

  /// A specific color value for the text decoration.
  case color(CSSTypeTypes.Color)

  /// Global CSS values
  case global(CSSTypeTypes.Global)
}

extension TextDecorationColor: CustomStringConvertible {
  public var description: String {
    switch self {
    case .color(let color):
      return color.description
    case .global(let global):
      return global.description
    }
  }
}
