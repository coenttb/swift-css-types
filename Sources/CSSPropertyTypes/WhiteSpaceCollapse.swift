//
//  WhiteSpaceCollapse.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `white-space-collapse` property controls how white space inside an element is collapsed.
///
/// This property determines how sequences of white space are handled within text.
///
/// - Note: The `white-space-collapse` and `text-wrap-mode` properties can be declared together
///         using the `white-space` shorthand property.
///
/// - SeeAlso: [MDN Web Docs on white-space-collapse](https://developer.mozilla.org/en-US/docs/Web/CSS/white-space-collapse)
public enum WhiteSpaceCollapse: Property {
  public static let property: String = "white-space-collapse"

  /// White space sequences are collapsed.
  case collapse

  /// White space sequences and segment break characters are preserved.
  case preserve

  /// White space sequences are collapsed, while segment break characters are preserved.
  case preserveBreaks

  /// White space sequences are preserved, while tabs and segment break characters are converted to spaces.
  case preserveSpaces

  /// Similar to preserve, but preserved white space takes up space (including at line end),
  /// line breaks can occur after any preserved white space character,
  /// and preserved spaces affect intrinsic sizes.
  case breakSpaces

  /// Global value
  case global(CSSTypeTypes.Global)

  public var description: String {
    switch self {
    case .collapse:
      return "collapse"
    case .preserve:
      return "preserve"
    case .preserveBreaks:
      return "preserve-breaks"
    case .preserveSpaces:
      return "preserve-spaces"
    case .breakSpaces:
      return "break-spaces"
    case .global(let global):
      return global.description
    }
  }
}
