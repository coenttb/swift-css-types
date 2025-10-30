import CSSTypeTypes
import Foundation

/// The `display` CSS property sets how an element is treated in the layout flow
/// and how its children are laid out.
///
/// This property defines both the element's inner and outer display types:
/// - The outer type determines the element's participation in flow layout
/// - The inner type determines the layout of the element's children
///
/// - SeeAlso: [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/CSS/display)
public enum Display: Property {
  public static let property: String = "display"

  // MARK: - Precomposed values

  /// Creates a block box that generates line breaks before and after
  case block

  /// Creates an inline box that doesn't generate line breaks
  case inline

  /// Creates a block box that flows with surrounding content as if it were a single inline box
  case inlineBlock

  /// Lays out contents using CSS Flexbox model with block-level behavior
  case flex

  /// Lays out contents using CSS Flexbox model with inline-level behavior
  case inlineFlex

  /// Lays out contents using CSS Grid model with block-level behavior
  case grid

  /// Lays out contents using CSS Grid model with inline-level behavior
  case inlineGrid

  /// Creates a block box that establishes a new block formatting context
  case flowRoot

  // MARK: - Box generation

  /// Removes the element from rendering (as if it didn't exist in the DOM)
  case none

  /// Element itself is not rendered, but its children are
  case contents

  // MARK: - Multi-keyword syntax

  /// Represents explicit outer and inner display types
  case multiKeyword(outer: DisplayOutside, inner: DisplayInside)

  /// Represents list item display with optional outer and inner types
  case listItem(outer: DisplayOutside? = nil, inner: DisplayInside? = nil)

  // MARK: - Table display values

  /// Behaves like an HTML table element
  case table

  /// Behaves like an HTML inline table element
  case inlineTable

  /// Behaves like a <tbody> HTML element
  case tableRowGroup

  /// Behaves like a <thead> HTML element
  case tableHeaderGroup

  /// Behaves like a <tfoot> HTML element
  case tableFooterGroup

  /// Behaves like a <tr> HTML element
  case tableRow

  /// Behaves like a <td> HTML element
  case tableCell

  /// Behaves like a <colgroup> HTML element
  case tableColumnGroup

  /// Behaves like a <col> HTML element
  case tableColumn

  /// Behaves like a <caption> HTML element
  case tableCaption

  // MARK: - Ruby display values

  /// Lays out content according to the ruby formatting model
  case ruby

  /// Behaves like an <rb> HTML element
  case rubyBase

  /// Behaves like an <rt> HTML element
  case rubyText

  /// Generated as anonymous boxes
  case rubyBaseContainer

  /// Behaves like an <rtc> HTML element
  case rubyTextContainer

  // MARK: - Global values

  /// Global values
  case global(CSSTypeTypes.Global)

  public var description: String {
    switch self {
    case .block:
      return "block"
    case .inline:
      return "inline"
    case .inlineBlock:
      return "inline-block"
    case .flex:
      return "flex"
    case .inlineFlex:
      return "inline-flex"
    case .grid:
      return "grid"
    case .inlineGrid:
      return "inline-grid"
    case .flowRoot:
      return "flow-root"
    case .none:
      return "none"
    case .contents:
      return "contents"
    case .multiKeyword(let outer, let inner):
      return "\(outer) \(inner)"
    case .listItem(let outer, let inner):
      var result = ""
      if let outer = outer {
        result += "\(outer) "
      }
      if let inner = inner {
        result += "\(inner) "
      }
      result += "list-item"
      return result
    case .table:
      return "table"
    case .inlineTable:
      return "inline-table"
    case .tableRowGroup:
      return "table-row-group"
    case .tableHeaderGroup:
      return "table-header-group"
    case .tableFooterGroup:
      return "table-footer-group"
    case .tableRow:
      return "table-row"
    case .tableCell:
      return "table-cell"
    case .tableColumnGroup:
      return "table-column-group"
    case .tableColumn:
      return "table-column"
    case .tableCaption:
      return "table-caption"
    case .ruby:
      return "ruby"
    case .rubyBase:
      return "ruby-base"
    case .rubyText:
      return "ruby-text"
    case .rubyBaseContainer:
      return "ruby-base-container"
    case .rubyTextContainer:
      return "ruby-text-container"
    case .global(let value):
      return value.description
    }
  }
}

/// Outer display types that define how an element participates in flow layout
public enum DisplayOutside: Sendable, CustomStringConvertible {
  /// Element generates a block box
  case block

  /// Element generates one or more inline boxes
  case inline

  public var description: String {
    switch self {
    case .block:
      return "block"
    case .inline:
      return "inline"
    }
  }
}

/// Inner display types that define how an element's contents are laid out
public enum DisplayInside: Sendable, CustomStringConvertible {
  /// Uses flow layout (block-and-inline layout)
  case flow

  /// Creates a block formatting context
  case flowRoot

  /// Uses table layout
  case table

  /// Uses flexbox layout
  case flex

  /// Uses grid layout
  case grid

  /// Uses ruby layout
  case ruby

  public var description: String {
    switch self {
    case .flow:
      return "flow"
    case .flowRoot:
      return "flow-root"
    case .table:
      return "table"
    case .flex:
      return "flex"
    case .grid:
      return "grid"
    case .ruby:
      return "ruby"
    }
  }
}
