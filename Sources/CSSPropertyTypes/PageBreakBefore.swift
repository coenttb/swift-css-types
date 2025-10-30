import CSSTypeTypes
import Foundation

/// The CSS `page-break-before` property adjusts page breaks before the current element.
///
/// - Note: This property is deprecated. Modern CSS has replaced it with the `break-before` property,
///         which works for both paged media and multi-column layouts.
///
/// Example:
/// ```swift
/// .pageBreakBefore(.auto)     // page-break-before: auto
/// .pageBreakBefore(.always)   // page-break-before: always
/// .pageBreakBefore(.avoid)    // page-break-before: avoid
/// .pageBreakBefore(.left)     // page-break-before: left
/// .pageBreakBefore(.right)    // page-break-before: right
/// ```
///
/// - SeeAlso: [MDN Web Docs on page-break-before](https://developer.mozilla.org/en-US/docs/Web/CSS/page-break-before)
public enum PageBreakBefore: Property {
  public static let property: String = "page-break-before"

  /// Let the browser determine automatically where page breaks should occur (default)
  case auto

  /// Always force a page break before the element
  case always

  /// Avoid a page break before the element if possible
  case avoid

  /// Force page breaks before the element until a left page is reached
  case left

  /// Force page breaks before the element until a right page is reached
  case right

  /// Global values
  case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension PageBreakBefore: CustomStringConvertible {
  /// Converts the page-break-before value to its CSS string representation
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
