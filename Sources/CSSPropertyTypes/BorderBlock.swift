import CSSTypeTypes
import Foundation

/// Represents the CSS `border-block` shorthand property, which sets border properties for the block dimension.
///
/// This logical property sets border width, style, and color for the block borders of an element,
/// which map to different physical borders depending on the element's writing mode, directionality,
/// and text orientation. For example, in horizontal top-to-bottom writing mode, `border-block` affects
/// the top and bottom borders.
///
/// Visual Reference:
/// ```
/// horizontal-tb writing mode:
/// ┌───────────────────────────┐
/// │                           │   ← border-block-start (top)
/// │                           │
/// │                           │
/// │                           │
/// └───────────────────────────┘   ← border-block-end (bottom)
///
/// vertical-rl writing mode:
/// ┌───────────────────────────┐
/// │                           │
/// │                           │
/// │                           │ ↑
/// │                           │ border-block-start (right)
/// └───────────────────────────┘
///   ↑
///   border-block-end (left)
/// ```
///
/// Example:
/// ```swift
/// // Set only border style
/// .borderBlock(.style(.solid))
///
/// // Set border style and color
/// .borderBlock(.styleAndColor(.dashed, .red))
///
/// // Set border width and style
/// .borderBlock(.widthAndStyle(.px(2), .dotted))
///
/// // Set all three properties
/// .borderBlock(.all(.px(3), .double, .blue))
/// ```
///
/// - Note: This logical property adapts to the writing mode of the document,
///         making layout more flexible for different writing systems.
///
/// - SeeAlso: [MDN Web Docs on border-block](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block)
public enum BorderBlock: Property, LineStyleConvertible {

  public static let property: String = "border-block"

  /// Only specifies the border style
  case lineStyle(LineStyle)

  /// Specifies the style and color
  case styleAndColor(LineStyle, Color)

  /// Specifies the width and style
  case widthAndStyle(BorderWidth, LineStyle)

  /// Specifies all three properties: width, style, and color
  case all(BorderWidth, LineStyle, Color)

  /// Just a width value
  case width(BorderWidth)

  /// Global CSS values
  case global(CSSTypeTypes.Global)

}

/// Provides string conversion for CSS output
extension BorderBlock: CustomStringConvertible {
  /// Converts the border-block to its CSS string representation
  ///
  /// This method generates CSS like:
  /// ```css
  /// border-block: solid;
  /// border-block: dashed red;
  /// border-block: 2px dotted;
  /// border-block: 3px double blue;
  /// border-block: inherit;
  /// ```
  public var description: String {
    switch self {
    case .lineStyle(let lineStyle):
      return lineStyle.description

    case .styleAndColor(let style, let color):
      return "\(style.description) \(color.description)"

    case .widthAndStyle(let width, let style):
      return "\(width.description) \(style.description)"

    case .all(let width, let style, let color):
      return "\(width.description) \(style.description) \(color.description)"

    case .width(let width):
      return width.description

    case .global(let global):
      return global.description
    }
  }
}

/// Convenience methods for creating BorderBlock objects
extension BorderBlock {

  /// Creates a thin border-block with the specified style
  ///
  /// - Parameter style: The border style
  /// - Returns: A thin border-block with the specified style
  public static func thin(_ style: LineStyle) -> BorderBlock {
    .widthAndStyle(.thin, style)
  }

  /// Creates a medium border-block with the specified style
  ///
  /// - Parameter style: The border style
  /// - Returns: A medium border-block with the specified style
  public static func medium(_ style: LineStyle) -> BorderBlock {
    .widthAndStyle(.medium, style)
  }

  /// Creates a thick border-block with the specified style
  ///
  /// - Parameter style: The border style
  /// - Returns: A thick border-block with the specified style
  public static func thick(_ style: LineStyle) -> BorderBlock {
    .widthAndStyle(.thick, style)
  }
}
