//
//  Ry.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `ry` property defines the y-axis (vertical) radius of an SVG ellipse
/// and the vertical curve of the corners of an SVG rectangle.
///
/// This property only applies to `<ellipse>` and `<rect>` elements nested in an `<svg>`.
/// If present, it overrides the shape's `ry` attribute.
///
/// Example:
/// ```swift
/// .ry(.px(30))           // ry: 30px
/// .ry(.percentage(30))   // ry: 30%
/// .ry(.auto)             // ry: auto
/// ```
///
/// - Note: The `ry` property doesn't apply to other SVG elements, HTML elements, or pseudo-elements.
///
/// - SeeAlso: [MDN Web Docs on ry](https://developer.mozilla.org/en-US/docs/Web/CSS/ry)
public enum Ry: Property, LengthPercentageConvertible {
  public static let property: String = "ry"

  /// A length-percentage value for the vertical radius
  case lengthPercentage(LengthPercentage)

  /// Auto value (uses the rx value, or 0 if both are auto)
  case auto

  /// Global value
  case global(CSSTypeTypes.Global)

  public var description: String {
    switch self {
    case .lengthPercentage(let lengthPercentage):
      return lengthPercentage.description
    case .auto:
      return "auto"
    case .global(let global):
      return global.description
    }
  }
}
