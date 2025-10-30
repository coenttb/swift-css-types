import CSSTypeTypes
import Foundation

//
//  PrintColorAdjust.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

public enum PrintColorAdjust: Property {
  public static let property: String = "print-color-adjust"

  /// The browser is allowed to make adjustments as it deems appropriate for the output device
  case economy

  /// The appearance of the content should not be changed except by user request
  case exact

  /// Global value
  case global(CSSTypeTypes.Global)

  public var description: String {
    switch self {
    case .economy:
      return "economy"
    case .exact:
      return "exact"
    case .global(let global):
      return global.description
    }
  }
}
