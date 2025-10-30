//
//  MathStyle.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `math-style` property indicates whether MathML equations should render
/// with normal or compact height.
///
/// This property affects the vertical layout of mathematical formulas, with compact style
/// trying to minimize the logical height of the formula.
///
/// - SeeAlso: [MDN Web Docs on math-style](https://developer.mozilla.org/en-US/docs/Web/CSS/math-style)
public enum MathStyle: Property, GlobalConvertible {
  public static let property: String = "math-style"

  /// The initial value, indicates normal rendering.
  case normal

  /// The math layout on descendants tries to minimize the logical height.
  case compact

  /// Global value
  case global(CSSTypeTypes.Global)

  public var description: String {
    switch self {
    case .normal:
      return "normal"
    case .compact:
      return "compact"
    case .global(let global):
      return global.description
    }
  }
}
