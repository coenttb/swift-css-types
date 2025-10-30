//
//  MozUserFocus.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 28/03/2025.
//

import CSSTypeTypes
import Foundation

/// The non-standard CSS `-moz-user-focus` property is used to indicate whether an element can have the focus.
///
/// This property allows controlling whether elements can receive focus, which affects keyboard navigation
/// and tab sequence. It can be used to disable focusing on elements or to modify how focus is handled.
///
/// Example:
/// ```swift
/// // Element cannot receive focus and is skipped in tab sequence
/// .mozUserFocus(.ignore)
///
/// // Element can receive keyboard focus
/// .mozUserFocus(.normal)
///
/// // Element cannot receive focus, and attempts to select it remove focus from other elements
/// .mozUserFocus(.none)
/// ```
///
/// - Note: This is a non-standard Mozilla-specific property that is deprecated. It was primarily
///         supported in Firefox. For modern focus control, use the standard CSS `tabindex` attribute
///         and `:focus` pseudo-class instead.
///
/// - SeeAlso: [MDN Web Docs on -moz-user-focus](https://developer.mozilla.org/en-US/docs/Web/CSS/-moz-user-focus)
public enum MozUserFocus: Property {
  public static let property: String = "-moz-user-focus"

  /// The element does not accept keyboard focus. Attempting to select the element removes focus from any other element.
  case none

  /// The element can accept keyboard focus
  case normal

  /// The element does not accept keyboard focus and will be skipped in the tab order
  case ignore

  /// Global CSS value
  case global(CSSTypeTypes.Global)

  public var description: String {
    switch self {
    case .none:
      return "none"
    case .normal:
      return "normal"
    case .ignore:
      return "ignore"
    case .global(let global):
      return global.description
    }
  }
}
