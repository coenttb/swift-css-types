//
//  Rx.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `rx` property defines the x-axis (horizontal) radius of an SVG ellipse
/// and the horizontal curve of the corners of an SVG rectangle.
///
/// This property only applies to `<ellipse>` and `<rect>` elements nested in an `<svg>`.
/// If present, it overrides the shape's `rx` attribute.
///
/// Example:
/// ```swift
/// .rx(.px(20))           // rx: 20px
/// .rx(.percentage(30))   // rx: 30%
/// .rx(.auto)             // rx: auto
/// ```
///
/// - Note: The `rx` property doesn't apply to other SVG elements, HTML elements, or pseudo-elements.
///
/// - SeeAlso: [MDN Web Docs on rx](https://developer.mozilla.org/en-US/docs/Web/CSS/rx)
public enum Rx: Property, LengthPercentageConvertible {
  public static let property: String = "rx"

  /// A length-percentage value for the horizontal radius
  case lengthPercentage(LengthPercentage)

  /// Auto value (uses the ry value, or 0 if both are auto)
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

extension Rx: LengthConvertible {
  public static func length(_ length: CSSTypeTypes.Length) -> Rx {
    .lengthPercentage(.length(length))
  }
}
extension Rx: PercentageConvertible {
  public static func percentage(_ percentage: CSSTypeTypes.Percentage) -> Rx {
    .lengthPercentage(.percentage(percentage))
  }
}
