import CSSTypeTypes
import Foundation

/// Represents the CSS `border-block-start` shorthand property, which sets border properties for the block-start edge.
///
/// This logical property sets border width, style, and color for the block-start border of an element,
/// which maps to a different physical border depending on the element's writing mode, directionality,
/// and text orientation. For example, in horizontal top-to-bottom writing mode, `border-block-start` affects
/// the top border.
///
/// Visual Reference:
/// ```
/// horizontal-tb writing mode:
/// ┌───────────────────────────┐   ← border-block-start (top)
/// │                           │
/// │                           │
/// │                           │
/// │                           │
/// └───────────────────────────┘
///
/// vertical-rl writing mode:
/// ┌───────────────────────────┐
/// │                           │
/// │                           │
/// │                           │ ↑
/// │                           │ border-block-start (right)
/// └───────────────────────────┘
/// ```
///
/// Example:
/// ```swift
/// // Set only border style
/// .borderBlockStart(.properties(style: .solid))
///
/// // Set border style and color
/// .borderBlockStart(.properties(style: .dashed, color: .red))
///
/// // Set border width and style
/// .borderBlockStart(.properties(width: .px(2), style: .dotted))
///
/// // Set all three properties
/// .borderBlockStart(.properties(width: .px(3), style: .double, color: .blue))
/// ```
///
/// - Note: This logical property adapts to the writing mode of the document,
///         making layout more flexible for different writing systems.
///
/// - SeeAlso: [MDN Web Docs on border-block-start](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-start)
public enum BorderBlockStart: Property {

  public static let property: String = "border-block-start"

  /// Specifies border properties (width, style, color)
  /// Note that per CSS spec, these can be specified in any order
  case properties(width: BorderWidth? = nil, style: LineStyle? = nil, color: Color? = nil)

  /// Global CSS values
  case global(CSSTypeTypes.Global)

  public init(
    width: BorderWidth? = nil,
    style: LineStyle? = nil,
    color: Color? = nil
  ) {
    self = .properties(width: width, style: style, color: color)
  }
}

/// Provides string conversion for CSS output
extension BorderBlockStart: CustomStringConvertible {
  /// Converts the border-block-start to its CSS string representation
  ///
  /// ```css
  /// border-block-start: solid;
  /// border-block-start: dashed red;
  /// border-block-start: 2px dotted;
  /// border-block-start: 3px double blue;
  /// border-block-start: inherit;
  /// ```
  public var description: String {
    switch self {
    case .properties(let width, let style, let color):
      var parts: [String] = []

      if let width = width {
        parts.append(width.description)
      }

      if let style = style {
        parts.append(style.description)
      }

      if let color = color {
        parts.append(color.description)
      }

      return parts.isEmpty ? "none" : parts.joined(separator: " ")

    case .global(let global):
      return global.description
    }
  }
}

/// Line style conversion
extension BorderBlockStart: LineStyleConvertible {
  public static func lineStyle(_ lineStyle: CSSTypeTypes.LineStyle) -> BorderBlockStart {
    .properties(style: lineStyle)
  }
}

/// Convenience methods for creating BorderBlockStart objects
extension BorderBlockStart {

  /// Creates a thin border-block-start with the specified style
  ///
  /// - Parameter style: The border style
  /// - Returns: A thin border-block-start with the specified style
  public static func thin(_ style: LineStyle) -> BorderBlockStart {
    .properties(width: .thin, style: style)
  }

  /// Creates a medium border-block-start with the specified style
  ///
  /// - Parameter style: The border style
  /// - Returns: A medium border-block-start with the specified style
  public static func medium(_ style: LineStyle) -> BorderBlockStart {
    .properties(width: .medium, style: style)
  }

  /// Creates a thick border-block-start with the specified style
  ///
  /// - Parameter style: The border style
  /// - Returns: A thick border-block-start with the specified style
  public static func thick(_ style: LineStyle) -> BorderBlockStart {
    .properties(width: .thick, style: style)
  }
}
