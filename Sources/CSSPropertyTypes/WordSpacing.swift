//
//  WordSpacing.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `word-spacing` property sets the length of space between words and between tags.
///
/// This property can be used to adjust the spacing between words for better readability or design purposes.
///
/// - Note: Setting too large positive or negative values can negatively impact readability.
///
/// - SeeAlso: [MDN Web Docs on word-spacing](https://developer.mozilla.org/en-US/docs/Web/CSS/word-spacing)
public enum WordSpacing: Property {
  public static let property: String = "word-spacing"

  /// The normal inter-word spacing, as defined by the current font and/or the browser.
  case normal

  /// Specifies extra spacing in addition to the intrinsic inter-word spacing defined by the font.
  case length(Length)

  /// Global value
  case global(CSSTypeTypes.Global)

  public var description: String {
    switch self {
    case .normal:
      return "normal"
    case .length(let length):
      return length.description
    case .global(let global):
      return global.description
    }
  }
}

extension WordSpacing: LengthConvertible {}
