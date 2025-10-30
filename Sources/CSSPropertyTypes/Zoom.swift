//
//  Zoom.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `zoom` property controls the magnification level of an element.
///
/// The zoom property scales the targeted element, which can affect the page layout. When scaling,
/// the zoomed element scales from top and center when using the default writing-mode.
///
/// - Note: `transform: scale()` can be used as an alternative to this property.
///
/// In contrast, an element scaled using `scale()` will not cause layout recalculation or move other elements
/// on the page. If using `scale()` makes the contents larger than the containing element, then overflow
/// comes into effect.
///
/// - SeeAlso: [MDN Web Docs on zoom](https://developer.mozilla.org/en-US/docs/Web/CSS/zoom)
public enum Zoom: Property {
  public static let property: String = "zoom"

  /// Zoom factor as a percentage. 100% is equivalent to normal.
  /// Values larger than 100% zoom in. Values smaller than 100% zoom out.
  case percentage(Percentage)

  /// Zoom factor as a number. 1.0 is equivalent to 100% (normal).
  /// Values larger than 1.0 zoom in. Values smaller than 1.0 zoom out.
  case number(Number)

  /// Render the element at its normal size; equal to zoom: 1
  case normal

  /// Resets the value to zoom: 1 and prevents the element from being (de)magnified
  /// if the user applies non-pinch-based zooming
  ///
  /// - Note: This value is deprecated and not recommended for use
  case reset

  /// Global value
  case global(CSSTypeTypes.Global)

  public var description: String {
    switch self {
    case .percentage(let percentage):
      return percentage.description
    case .number(let number):
      return number.description
    case .normal:
      return "normal"
    case .reset:
      return "reset"
    case .global(let global):
      return global.description
    }
  }
}
