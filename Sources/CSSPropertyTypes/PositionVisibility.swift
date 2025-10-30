import CSSTypeTypes
import Foundation

//
//  PositionVisibility.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

public enum PositionVisibility: Property {
  public static let property: String = "position-visibility"

  /// The positioned element is always displayed
  case always

  /// Element is hidden if its anchor is completely hidden
  case anchorsVisible

  /// Element is hidden if it starts to overflow its containing element or viewport
  case noOverflow

  /// Multiple visibility conditions combined
  case combined([Condition])

  /// Global value
  case global(CSSTypeTypes.Global)

  /// Individual visibility conditions
  public enum Condition: String, Sendable, Hashable {
    /// Element is hidden if its anchor is completely hidden
    case anchorsVisible = "anchors-visible"

    /// Element is hidden if it starts to overflow its containing element or viewport
    case noOverflow = "no-overflow"
  }

  public var description: String {
    switch self {
    case .always:
      return "always"
    case .anchorsVisible:
      return "anchors-visible"
    case .noOverflow:
      return "no-overflow"
    case .combined(let conditions):
      return conditions.map { $0.rawValue }.joined(separator: " ")
    case .global(let global):
      return global.description
    }
  }
}
