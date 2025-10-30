import CSSTypeTypes
import Foundation

//
//  PositionTryOrder.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

public enum PositionTryOrder: Property {
  public static let property: String = "position-try-order"

  /// Default value. No position-try fallback options will be tried when the element is first displayed.
  case normal

  /// Apply the fallback that gives the element's containing block the most height
  case mostHeight

  /// Apply the fallback that gives the element's containing block the most width
  case mostWidth

  /// Apply the fallback that gives the element's containing block the largest block size
  case mostBlockSize

  /// Apply the fallback that gives the element's containing block the largest inline size
  case mostInlineSize

  /// Global value
  case global(CSSTypeTypes.Global)

  public var description: String {
    switch self {
    case .normal:
      return "normal"
    case .mostHeight:
      return "most-height"
    case .mostWidth:
      return "most-width"
    case .mostBlockSize:
      return "most-block-size"
    case .mostInlineSize:
      return "most-inline-size"
    case .global(let global):
      return global.description
    }
  }
}
