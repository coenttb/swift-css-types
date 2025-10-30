//
//  WebkitBorderBefore.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 28/03/2025.
//

import CSSTypeTypes
import Foundation

/// The non-standard `-webkit-border-before` CSS property is a shorthand property for setting
/// border properties for the logical block-start edge of an element.
///
/// This property maps to a physical border depending on the element's writing mode, directionality,
/// and text orientation. It corresponds to border-top, border-right, border-bottom, or border-left
/// depending on the values defined for writing-mode, direction, and text-orientation.
///
/// The standard alternative to this property is `border-block-start`.
///
/// Example:
/// ```swift
/// // Set only border style
/// .webkitBorderBefore(.properties(style: .solid))
///
/// // Set border style and color
/// .webkitBorderBefore(.properties(style: .dashed, color: .red))
///
/// // Set border width and style
/// .webkitBorderBefore(.properties(width: .px(2), style: .dotted))
///
/// // Set all three properties
/// .webkitBorderBefore(.properties(width: .px(3), style: .double, color: .blue))
/// ```
///
/// - Note: This is a non-standard property and may not be supported by all browsers.
///         Consider using the standard `border-block-start` property for production sites.
///
public enum WebkitBorderBefore: Property {

  public static let property: String = "-webkit-border-before"

  /// Specifies border properties (width, style, color)
  /// Note that per CSS spec, these can be specified in any order
  case properties(width: BorderWidth? = nil, style: LineStyle? = nil, color: Color? = nil)

  /// Global CSS values
  case global(CSSTypeTypes.Global)

  /// Convenience initializer for border properties
  public init(
    width: BorderWidth? = nil,
    style: LineStyle? = nil,
    color: Color? = nil
  ) {
    self = .properties(width: width, style: style, color: color)
  }
}

/// Provides string conversion for CSS output
extension WebkitBorderBefore: CustomStringConvertible {
  /// Converts the -webkit-border-before to its CSS string representation
  ///
  /// ```css
  /// -webkit-border-before: solid;
  /// -webkit-border-before: dashed red;
  /// -webkit-border-before: 2px dotted;
  /// -webkit-border-before: 3px double blue;
  /// -webkit-border-before: inherit;
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
extension WebkitBorderBefore: LineStyleConvertible {
  public static func lineStyle(_ lineStyle: CSSTypeTypes.LineStyle) -> WebkitBorderBefore {
    .properties(style: lineStyle)
  }
}

/// Convenience methods for creating WebkitBorderBefore objects
extension WebkitBorderBefore {
  /// Creates a thin border with the specified style
  ///
  /// - Parameter style: The border style
  /// - Returns: A thin border with the specified style
  public static func thin(_ style: LineStyle) -> WebkitBorderBefore {
    .properties(width: .thin, style: style)
  }

  /// Creates a medium border with the specified style
  ///
  /// - Parameter style: The border style
  /// - Returns: A medium border with the specified style
  public static func medium(_ style: LineStyle) -> WebkitBorderBefore {
    .properties(width: .medium, style: style)
  }

  /// Creates a thick border with the specified style
  ///
  /// - Parameter style: The border style
  /// - Returns: A thick border with the specified style
  public static func thick(_ style: LineStyle) -> WebkitBorderBefore {
    .properties(width: .thick, style: style)
  }
}
