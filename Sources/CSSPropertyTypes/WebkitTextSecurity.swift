//
//  WebkitTextSecurity.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 28/03/2025.
//

import CSSTypeTypes
import Foundation

/// The non-standard CSS `-webkit-text-security` property is used to obscure text content by
/// replacing each character with a shape.
///
/// This property is often used for password fields or other sensitive data,
/// providing an alternative to using the `type="password"` attribute on input elements.
/// It can be applied to any text element, not just form controls.
///
/// Example:
/// ```swift
/// // Replace characters with disc symbols (bullets)
/// .webkitTextSecurity(.disc)
///
/// // Replace characters with circle symbols (hollow circles)
/// .webkitTextSecurity(.circle)
///
/// // Replace characters with square symbols
/// .webkitTextSecurity(.square)
///
/// // Do not obscure text (default)
/// .webkitTextSecurity(.none)
/// ```
///
/// - Note: This is a non-standard WebKit-specific property. For standard HTML password fields,
///         you should use `<input type="password">` instead. This property is useful when you
///         need to obscure text in elements that aren't input fields, or when you want a different
///         masking symbol than the standard bullet.
///
/// - SeeAlso: [CSS-Tricks article on -webkit-text-security](https://css-tricks.com/almanac/properties/t/text-security/)
public enum WebkitTextSecurity: Property {
  public static let property: String = "-webkit-text-security"

  /// Do not obscure text (default)
  case none

  /// Replace each character with a disc (filled circle/bullet symbol)
  case disc

  /// Replace each character with a circle (hollow circle symbol)
  case circle

  /// Replace each character with a square symbol
  case square

  /// Global CSS values
  case global(CSSTypeTypes.Global)

  public var description: String {
    switch self {
    case .none:
      return "none"
    case .disc:
      return "disc"
    case .circle:
      return "circle"
    case .square:
      return "square"
    case .global(let global):
      return global.description
    }
  }
}
