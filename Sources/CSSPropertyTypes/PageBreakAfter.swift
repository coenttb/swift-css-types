import CSSTypeTypes
import Foundation

/// The CSS `page-break-after` property adjusts page breaks after the current element.
///
/// - Note: This property is deprecated. Modern CSS has replaced it with the `break-after` property,
///         which works for both paged media and multi-column layouts.
///
/// Example:
/// ```swift
/// .pageBreakAfter(.auto)     // page-break-after: auto
/// .pageBreakAfter(.always)   // page-break-after: always
/// .pageBreakAfter(.avoid)    // page-break-after: avoid
/// .pageBreakAfter(.left)     // page-break-after: left
/// .pageBreakAfter(.right)    // page-break-after: right
/// ```
///
/// - SeeAlso: [MDN Web Docs on page-break-after](https://developer.mozilla.org/en-US/docs/Web/CSS/page-break-after)
public enum PageBreakAfter: Property {
  public static let property: String = "page-break-after"

  /// Let the browser determine automatically where page breaks should occur (default)
  case auto

  /// Always force a page break after the element
  case always

  /// Avoid a page break after the element if possible
  case avoid

  /// Force page breaks after the element until a left page is reached
  case left

  /// Force page breaks after the element until a right page is reached
  case right

  /// Global values
  case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension PageBreakAfter: CustomStringConvertible {
  /// Converts the page-break-after value to its CSS string representation
  public var description: String {
    switch self {
    case .auto:
      return "auto"

    case .always:
      return "always"

    case .avoid:
      return "avoid"

    case .left:
      return "left"

    case .right:
      return "right"

    case .global(let global):
      return global.description
    }
  }
}
