//
//  LineBreak.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `line-break` property sets how to break lines of Chinese, Japanese, or Korean (CJK) text
/// when working with punctuation and symbols.
///
/// - SeeAlso: [MDN Web Docs on line-break](https://developer.mozilla.org/en-US/docs/Web/CSS/line-break)
public enum LineBreak: Property {
  public static let property: String = "line-break"
  /// Break text using the default line break rule.
  case auto

  /// Break text using the least restrictive line break rule.
  /// Typically used for short lines, such as in newspapers.
  case loose

  /// Break text using the most common line break rule.
  case normal

  /// Break text using the most stringent line break rule.
  case strict

  /// There is a soft wrap opportunity around every typographic character unit,
  /// including around any punctuation character or preserved white spaces,
  /// or in the middle of words, disregarding any prohibition against line breaks.
  /// Hyphenation is not applied.
  case anywhere

  /// Global value
  case global(CSSTypeTypes.Global)

  public var description: String {
    switch self {
    case .auto:
      return "auto"
    case .loose:
      return "loose"
    case .normal:
      return "normal"
    case .strict:
      return "strict"
    case .anywhere:
      return "anywhere"
    case .global(let global):
      return global.description
    }
  }
}
