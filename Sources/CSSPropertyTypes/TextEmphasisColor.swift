//
//  TextEmphasisColor.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `text-emphasis-color` property sets the color of emphasis marks.
///
/// This property is used in conjunction with `text-emphasis-style` to add emphasis marks to text.
/// It can also be set using the `text-emphasis` shorthand.
///
/// - SeeAlso: [MDN Web Docs on text-emphasis-color](https://developer.mozilla.org/en-US/docs/Web/CSS/text-emphasis-color)
public enum TextEmphasisColor: Property, ColorConvertible {
  public static let property: String = "text-emphasis-color"

  /// Defines the color of the emphasis marks.
  /// If no color is present, it defaults to currentcolor.
  case color(CSSTypeTypes.Color)

  /// Global value
  case global(CSSTypeTypes.Global)

  public var description: String {
    switch self {
    case .color(let color):
      return color.description
    case .global(let global):
      return global.description
    }
  }
}

/// Convenience factory for common color values
extension TextEmphasisColor {
  /// The default color value (currentColor)
  public static var currentColor: TextEmphasisColor {
    .color(.currentColor)
  }
}
