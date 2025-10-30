//
//  Isolation.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 28/03/2025.
//

import CSSTypeTypes
import Foundation

/// The isolation CSS property determines whether an element must create a new stacking context.
///
/// This property is especially helpful when used in conjunction with `mix-blend-mode` and `z-index`.
///
/// - SeeAlso: `MixBlendMode`
public enum Isolation: Property {
  public static let property: String = "isolation"

  /// A new stacking context is created only if one of the properties applied to the element requires it.
  case auto

  /// A new stacking context must be created.
  case isolate

  /// Global CSS values
  case global(CSSTypeTypes.Global)

  public var description: String {
    switch self {
    case .auto:
      return "auto"
    case .isolate:
      return "isolate"
    case .global(let global):
      return global.description
    }
  }
}
