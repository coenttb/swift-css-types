//
//  HyphenateCharacter.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `hyphenate-character` property sets the character (or string) used at the end of a line
/// before a hyphenation break.
///
/// Both automatic and soft hyphens are displayed according to the specified hyphenate-character value.
///
/// - SeeAlso: [MDN Web Docs on hyphenate-character](https://developer.mozilla.org/en-US/docs/Web/CSS/hyphenate-character)
public enum HyphenateCharacter: Property {

  public static let property: String = "hyphenate-character"

  /// The user-agent selects an appropriate string based on the content language's typographic conventions.
  /// This is the default property value.
  case auto

  /// The string to use at the end of the line before a hyphenation break.
  /// The user agent may truncate this value if too many characters are used.
  case string(CSSString)

  /// Global value
  case global(CSSTypeTypes.Global)

  public var description: String {
    switch self {
    case .auto:
      return "auto"
    case .string(let string):
      return string.description
    case .global(let global):
      return global.description
    }
  }
}
