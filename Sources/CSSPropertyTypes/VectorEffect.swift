//
//  VectorEffect.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

import CSSTypeTypes
import Foundation

/// The CSS `vector-effect` property suppresses specific transformation effects in SVG.
///
/// This allows effects like a road on a map staying the same width no matter how the map is zoomed,
/// or a diagram key retaining its position and size regardless of other transforms.
///
/// - Note: This property can only be used with SVG elements that accept the vector-effect attribute.
///         When used, the CSS value overrides any values of the element's vector-effect attribute.
///
/// - SeeAlso: [MDN Web Docs on vector-effect](https://developer.mozilla.org/en-US/docs/Web/CSS/vector-effect)
public enum VectorEffect: Property {
  public static let property: String = "vector-effect"
  /// No vector effects are applied to the element, meaning it will be fully affected by transforms as normal.
  case none

  /// The element's drawn stroke width will be physically equal in size to its defined stroke width,
  /// even if the element has been scaled up or down in size due to transforms of either itself or
  /// its coordinate system.
  case nonScalingStroke

  /// Global value
  case global(CSSTypeTypes.Global)

  public var description: String {
    switch self {
    case .none: return "none"
    case .nonScalingStroke: return "non-scaling-stroke"
    case .global(let global): return global.description
    }
  }
}
