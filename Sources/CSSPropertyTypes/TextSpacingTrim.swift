//
//  TextSpacingTrim.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `text-spacing-trim` property controls the internal spacing set on
/// Chinese/Japanese/Korean (CJK) punctuation characters between adjacent characters (kerning)
/// and at the start or end of text lines.
///
/// This property applies spacing/kerning to CJK punctuation characters to produce
/// visually pleasing typography as defined by the Requirements for Japanese text
/// layout (JLREQ) and the Requirements for Chinese text layout (CLREQ).
///
/// - Warning: This is an experimental property and may change in the future.
///
/// - SeeAlso: [MDN Web Docs on text-spacing-trim](https://developer.mozilla.org/en-US/docs/Web/CSS/text-spacing-trim)
public enum TextSpacingTrim: Property {
  public static let property: String = "text-spacing-trim"

  /// Sets CJK full-width opening punctuation characters to be full-width at the start of each line.
  /// Sets CJK full-width closing punctuation characters to be full-width at the end of each line,
  /// or half-width if they do not fit on the line before justification.
  /// Collapses spacing between punctuation characters.
  case normal

  /// All CJK full-width punctuation characters are set to be full-width.
  case spaceAll

  /// Behaves as normal, except that CJK full-width opening punctuation characters are set to be
  /// full-width at the start of the first line of the text's block container, and the start of
  /// every subsequent line coming after an explicit line break such as a newline character.
  case spaceFirst

  /// Behaves as normal, except that CJK full-width opening punctuation characters
  /// are set to be half-width at the start of each line.
  case trimStart

  /// The browser automatically selects an appropriate trimming algorithm based on the content.
  case auto

  /// Global value
  case global(CSSTypeTypes.Global)

  public var description: String {
    switch self {
    case .normal: return "normal"
    case .spaceAll: return "space-all"
    case .spaceFirst: return "space-first"
    case .trimStart: return "trim-start"
    case .auto: return "auto"
    case .global(let global): return global.description
    }
  }
}
