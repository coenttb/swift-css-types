//
//  OverflowWrap.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `overflow-wrap` property applies to text, setting whether the browser should insert
/// line breaks within an otherwise unbreakable string to prevent text from overflowing its line box.
///
/// In contrast to `word-break`, `overflow-wrap` will only create a break if an entire word cannot
/// be placed on its own line without overflowing.
///
/// Example:
/// ```swift
/// .overflowWrap(.normal)     // overflow-wrap: normal
/// .overflowWrap(.anywhere)   // overflow-wrap: anywhere
/// .overflowWrap(.breakWord)  // overflow-wrap: break-word
/// ```
///
/// - Note: This property was originally a nonstandard Microsoft extension called `word-wrap`,
///         and was implemented by most browsers with the same name. It has since been renamed
///         to `overflow-wrap`, with `word-wrap` being an alias.
///
/// - SeeAlso: [MDN Web Docs on overflow-wrap](https://developer.mozilla.org/en-US/docs/Web/CSS/overflow-wrap)
public enum OverflowWrap: Property, Sendable, Hashable, CustomStringConvertible {
  public static let property: String = "overflow-wrap"

  /// Lines may only break at normal word break points (such as a space between two words).
  case normal

  /// To prevent overflow, an otherwise unbreakable string of characters — like a long word or URL —
  /// may be broken at any point if there are no otherwise-acceptable break points in the line.
  /// No hyphenation character is inserted at the break point.
  /// Soft wrap opportunities introduced by the word break are considered when calculating min-content intrinsic sizes.
  case anywhere

  /// The same as the `anywhere` value, but soft wrap opportunities introduced by the word break
  /// are NOT considered when calculating min-content intrinsic sizes.
  case breakWord

  /// Global value
  case global(CSSTypeTypes.Global)

  public var description: String {
    switch self {
    case .normal:
      return "normal"
    case .anywhere:
      return "anywhere"
    case .breakWord:
      return "break-word"
    case .global(let global):
      return global.description
    }
  }
}
