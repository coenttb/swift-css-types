//
//  TextEmphasisStyle.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `text-emphasis-style` property sets the appearance of emphasis marks.
///
/// This property is used in conjunction with `text-emphasis-color` to add emphasis marks to text.
/// It can also be set, and reset, using the `text-emphasis` shorthand.
///
/// - SeeAlso: [MDN Web Docs on text-emphasis-style](https://developer.mozilla.org/en-US/docs/Web/CSS/text-emphasis-style)
public enum TextEmphasisStyle: Property {
  public static let property: String = "text-emphasis-style"

  /// No emphasis marks.
  case none

  /// Single shape-based emphasis mark, can be filled (solid) or open (hollow)
  case shape(EmphasisShape, EmphasisFill)

  /// Display the given string as marks. Authors should not specify more than one character.
  /// The UA may truncate or ignore strings consisting of more than one grapheme cluster.
  case string(CSSString)

  /// Global value
  case global(CSSTypeTypes.Global)

  public var description: String {
    switch self {
    case .none:
      return "none"
    case .shape(let shape, let fill):
      return "\(fill.rawValue) \(shape.rawValue)"
    case .string(let string):
      return string.description
    case .global(let global):
      return global.description
    }
  }
}

/// The fill style for emphasis marks: filled (solid) or open (hollow)
public enum EmphasisFill: String, Sendable, Hashable {
  /// The shape is filled with solid color. This is the default if not specified.
  case filled

  /// The shape is hollow.
  case open
}

/// The shape used for emphasis marks
public enum EmphasisShape: String, Sendable, Hashable {
  /// Display small circles as marks.
  /// The filled dot is '•' (U+2022), and the open dot is '◦' (U+25E6).
  case dot

  /// Display large circles as marks.
  /// The filled circle is '●' (U+25CF), and the open circle is '○' (U+25CB).
  case circle

  /// Display double circles as marks.
  /// The filled double-circle is '◉' (U+25C9), and the open double-circle is '◎' (U+25CE).
  case doubleCircle = "double-circle"

  /// Display triangles as marks.
  /// The filled triangle is '▲' (U+25B2), and the open triangle is '△' (U+25B3).
  case triangle

  /// Display sesames as marks.
  /// The filled sesame is '﹅' (U+FE45), and the open sesame is '﹆' (U+FE46).
  case sesame
}

/// Convenience factories for common emphasis styles
extension TextEmphasisStyle {
  /// Filled dot emphasis
  public static var filledDot: TextEmphasisStyle {
    .shape(.dot, .filled)
  }

  /// Open dot emphasis
  public static var openDot: TextEmphasisStyle {
    .shape(.dot, .open)
  }

  /// Filled circle emphasis
  public static var filledCircle: TextEmphasisStyle {
    .shape(.circle, .filled)
  }

  /// Open circle emphasis
  public static var openCircle: TextEmphasisStyle {
    .shape(.circle, .open)
  }

  /// Filled double-circle emphasis
  public static var filledDoubleCircle: TextEmphasisStyle {
    .shape(.doubleCircle, .filled)
  }

  /// Open double-circle emphasis
  public static var openDoubleCircle: TextEmphasisStyle {
    .shape(.doubleCircle, .open)
  }

  /// Filled triangle emphasis
  public static var filledTriangle: TextEmphasisStyle {
    .shape(.triangle, .filled)
  }

  /// Open triangle emphasis
  public static var openTriangle: TextEmphasisStyle {
    .shape(.triangle, .open)
  }

  /// Filled sesame emphasis
  public static var filledSesame: TextEmphasisStyle {
    .shape(.sesame, .filled)
  }

  /// Open sesame emphasis
  public static var openSesame: TextEmphasisStyle {
    .shape(.sesame, .open)
  }
}
