//
//  TextOrientation.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `text-orientation` property sets the orientation of text characters in a line.
///
/// It only affects text in vertical mode (when writing-mode is not horizontal-tb).
/// It is useful for controlling the display of languages that use vertical script,
/// and also for making vertical table headers.
///
/// - SeeAlso: [MDN Web Docs on text-orientation](https://developer.mozilla.org/en-US/docs/Web/CSS/text-orientation)
public enum TextOrientation: Property {
  public static let property: String = "text-orientation"

  /// Rotates the characters of horizontal scripts 90° clockwise.
  /// Lays out the characters of vertical scripts naturally. Default value.
  case mixed

  /// Lays out the characters of horizontal scripts naturally (upright),
  /// as well as the glyphs for vertical scripts.
  /// Note that this keyword causes all characters to be considered as left-to-right:
  /// the used value of direction is forced to be ltr.
  case upright

  /// Causes characters to be laid out as they would be horizontally,
  /// but with the whole line rotated 90° clockwise.
  case sideways

  /// An alias to sideways that is kept for compatibility purposes.
  case sidewaysRight

  /// On SVG elements, this keyword leads to use the value of the deprecated SVG properties
  /// glyph-orientation-vertical and glyph-orientation-horizontal.
  case useGlyphOrientation

  /// Global value
  case global(CSSTypeTypes.Global)

  public var description: String {
    switch self {
    case .mixed: return "mixed"
    case .upright: return "upright"
    case .sideways: return "sideways"
    case .sidewaysRight: return "sideways-right"
    case .useGlyphOrientation: return "use-glyph-orientation"
    case .global(let global): return global.description
    }
  }
}
