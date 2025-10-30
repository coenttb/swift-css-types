//
// TableLayout.swift

import CSSTypeTypes

/// The `table-layout` CSS property sets the algorithm used to lay out table cells, rows, and columns.
///
/// - `auto`: The automatic table layout algorithm adjusts the widths of the table and its cells
///   to fit the content. This is the default algorithm used by most browsers.
///
/// - `fixed`: A faster algorithm where column widths are determined by the first row or by column
///   elements with explicit widths. This allows the table to be rendered earlier but might cause
///   content overflow if cells contain more content than the calculated width allows.
///
/// ```css
/// table-layout: auto;
/// table-layout: fixed;
/// ```
public enum TableLayout: Property {
  public static let property: String = "table-layout"

  /// The automatic table layout algorithm is used (content-based sizing)
  case auto

  /// The fixed table layout algorithm is used (faster, based on first row only)
  case fixed

  /// Global CSS value
  case global(CSSTypeTypes.Global)

  public var description: String {
    switch self {
    case .auto: return "auto"
    case .fixed: return "fixed"
    case .global(let global): return global.description
    }
  }
}
