import CSSTypeTypes
import Foundation

/// Represents the CSS `border-block-end` shorthand property, which sets border properties for the block-end edge.
///
/// This logical property sets border width, style, and color for the block-end border of an element,
/// which maps to a different physical border depending on the element's writing mode, directionality,
/// and text orientation. For example, in horizontal top-to-bottom writing mode, `border-block-end` affects
/// the bottom border.
///
/// Visual Reference:
/// ```
/// horizontal-tb writing mode:
/// ┌───────────────────────────┐
/// │                           │
/// │                           │
/// │                           │
/// │                           │
/// └───────────────────────────┘   ← border-block-end (bottom)
///
/// vertical-rl writing mode:
/// ┌───────────────────────────┐
/// │                           │
/// │                           │
/// │                           │
/// │                           │
/// └───────────────────────────┘
///   ↑
///   border-block-end (left)
/// ```
///
/// Example:
/// ```swift
/// // Set only border style
/// .borderBlockEnd(.properties(style: .solid))
///
/// // Set border style and color
/// .borderBlockEnd(.properties(style: .dashed, color: .red))
///
/// // Set border width and style
/// .borderBlockEnd(.properties(width: .px(2), style: .dotted))
///
/// // Set all three properties
/// .borderBlockEnd(.properties(width: .px(3), style: .double, color: .blue))
/// ```
///
/// - Note: This logical property adapts to the writing mode of the document,
///         making layout more flexible for different writing systems.
///
/// - SeeAlso: [MDN Web Docs on border-block-end](https://developer.mozilla.org/en-US/docs/Web/CSS/border-block-end)
public enum BorderBlockEnd: Property {

  public static let property: String = "border-block-end"

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
extension BorderBlockEnd: CustomStringConvertible {
  /// Converts the border-block-end to its CSS string representation
  ///
  /// ```css
  /// border-block-end: solid;
  /// border-block-end: dashed red;
  /// border-block-end: 2px dotted;
  /// border-block-end: 3px double blue;
  /// border-block-end: inherit;
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

extension BorderBlockEnd: LineStyleConvertible {
  public static func lineStyle(_ lineStyle: CSSTypeTypes.LineStyle) -> BorderBlockEnd {
    .init(style: lineStyle)
  }
}

/// Convenience methods for creating BorderBlockEnd objects
extension BorderBlockEnd {

  /// Creates a thin border-block-end with the specified style
  ///
  /// - Parameter style: The border style
  /// - Returns: A thin border-block-end with the specified style
  public static func thin(_ style: LineStyle) -> BorderBlockEnd {
    .properties(width: .thin, style: style)
  }

  /// Creates a medium border-block-end with the specified style
  ///
  /// - Parameter style: The border style
  /// - Returns: A medium border-block-end with the specified style
  public static func medium(_ style: LineStyle) -> BorderBlockEnd {
    .properties(width: .medium, style: style)
  }

  /// Creates a thick border-block-end with the specified style
  ///
  /// - Parameter style: The border style
  /// - Returns: A thick border-block-end with the specified style
  public static func thick(_ style: LineStyle) -> BorderBlockEnd {
    .properties(width: .thick, style: style)
  }
}
