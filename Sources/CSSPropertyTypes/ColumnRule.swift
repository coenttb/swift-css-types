//
//  ColumnRule.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `column-rule` shorthand property sets the width, style, and color of the
/// line drawn between columns in a multi-column layout.
///
/// This is a shorthand for setting `column-rule-width`, `column-rule-style`, and `column-rule-color`
/// in a single declaration.
///
/// - SeeAlso: [MDN Web Docs on column-rule](https://developer.mozilla.org/en-US/docs/Web/CSS/column-rule)
public enum ColumnRule: Property, LineStyleConvertible {
  public static let property: String = "column-rule"
  /// A rule with style, width, and color
  case full(LineStyle, BorderWidth.Width, Color?)

  /// A rule with just style and width
  case styleWidth(LineStyle, BorderWidth.Width)

  /// A rule with just style and color
  case styleColor(LineStyle, Color)

  /// A rule with just style
  case lineStyle(LineStyle)

  /// Global CSS values
  case global(CSSTypeTypes.Global)

  /// Creates a column rule with style, width, and color
  ///
  /// - Parameters:
  ///   - style: The line style for the rule
  ///   - width: The width for the rule
  ///   - color: The color for the rule
  /// - Returns: A column rule with full specification
  public static func rule(
    _ style: LineStyle,
    _ width: BorderWidth.Width,
    _ color: Color? = nil
  ) -> ColumnRule {
    return .full(style, width, color)
  }

  /// Creates a column rule with just style and width
  ///
  /// - Parameters:
  ///   - style: The line style for the rule
  ///   - width: The width for the rule
  /// - Returns: A column rule with style and width
  public static func rule(_ style: LineStyle, _ width: BorderWidth.Width) -> ColumnRule {
    return .styleWidth(style, width)
  }

  /// Creates a column rule with just style and color
  ///
  /// - Parameters:
  ///   - style: The line style for the rule
  ///   - color: The color for the rule
  /// - Returns: A column rule with style and color
  public static func rule(_ style: LineStyle, _ color: Color) -> ColumnRule {
    return .styleColor(style, color)
  }

  /// Creates a column rule with just style
  ///
  /// - Parameter style: The line style for the rule
  /// - Returns: A column rule with specified style
  public static func rule(_ lineStyle: LineStyle) -> ColumnRule {
    return .lineStyle(lineStyle)
  }

  /// String representation of the column-rule
  public var description: String {
    switch self {
    case .full(let style, let width, let color):
      if let color = color {
        return "\(style.description) \(width.description) \(color.description)"
      } else {
        return "\(style.description) \(width.description)"
      }
    case .styleWidth(let style, let width):
      return "\(style.description) \(width.description)"
    case .styleColor(let style, let color):
      return "\(style.description) \(color.description)"
    case .lineStyle(let lineStyle):
      return lineStyle.description
    case .global(let global):
      return global.description
    }
  }
}

/// Convenience methods for creating common column rules
extension ColumnRule {

  /// Creates a thin solid column rule
  public static let thin = ColumnRule.styleWidth(.solid, .thin)

  /// Creates a medium solid column rule
  public static let medium = ColumnRule.styleWidth(.solid, .medium)

  /// Creates a thick solid column rule
  public static let thick = ColumnRule.styleWidth(.solid, .thick)
}
