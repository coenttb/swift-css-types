//
//  ColumnFill.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `column-fill` property controls how an element's contents are balanced when broken into columns.
///
/// This property specifies how content should be distributed across columns in a multi-column layout.
///
/// - SeeAlso: [MDN Web Docs on column-fill](https://developer.mozilla.org/en-US/docs/Web/CSS/column-fill)
public enum ColumnFill: Property {
  public static let property: String = "column-fill"
  /// Columns are filled sequentially. Content takes up only the room it needs,
  /// possibly resulting in some columns remaining empty.
  case auto

  /// Content is equally divided between columns. In fragmented contexts, such as paged media,
  /// only the last fragment is balanced.
  case balance

  /// Content is equally divided between columns in all fragments in fragmented contexts.
  /// Note: This value is defined in the spec but not yet supported in browsers.
  case balanceAll

  /// Global CSS values
  case global(CSSTypeTypes.Global)
}

extension ColumnFill: CustomStringConvertible {
  /// String representation of the column-fill value
  public var description: String {
    switch self {
    case .auto:
      return "auto"
    case .balance:
      return "balance"
    case .balanceAll:
      return "balance-all"
    case .global(let global):
      return global.description
    }
  }
}
