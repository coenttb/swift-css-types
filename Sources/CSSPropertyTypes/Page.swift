//
//  Page.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 28/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `page` property is used to specify a named page, a specific type of page defined by
/// the `@page` at-rule, which controls the layout of printed documents.
///
/// This property is typically used to assign different page styles to different elements when
/// printing a document. For example, you might want to print a table of contents, foreword,
/// and chapters using different page formats or orientations.
///
/// Example:
/// ```swift
/// // Use the auto value (default)
/// .page(.auto)
///
/// // Use a specific named page
/// .page(.name("toc"))
///
/// // Use a custom page name
/// .page(.name("chapterIntro"))
/// ```
///
/// - Note: If there are multiple selectors using a named page consecutively, a forced
///         page break using `break-after` may be needed to ensure proper pagination.
///
/// - SeeAlso: [MDN Web Docs on page](https://developer.mozilla.org/en-US/docs/Web/CSS/page)
public enum Page: Property {
  public static let property: String = "page"

  /// Uses the value of the nearest ancestor with a non-auto value.
  /// If no ancestor has a named page value set, the used value is the empty string.
  case auto

  /// A case-sensitive name defined in a @page at-rule
  case name(String)

  /// Global CSS values
  case global(CSSTypeTypes.Global)

  public var description: String {
    switch self {
    case .auto:
      return "auto"
    case .name(let pageName):
      return pageName
    case .global(let global):
      return global.description
    }
  }
}
