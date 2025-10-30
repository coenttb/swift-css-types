import CSSTypeTypes
import Foundation

//
//  PositionTryFallbacks.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 26/03/2025.
//

public enum PositionTryFallbacks: Property {
  public static let property: String = "position-try-fallbacks"

  /// No position try fallback options
  case none

  /// A single predefined tactic
  case tactic(TryTactic)

  /// Multiple predefined tactics as separate options
  case tactics([TryTactic])

  /// A position area value
  case positionArea(CSSString)

  /// A custom option name
  case customOption(CSSString)

  /// A combination of different fallback options
  case combined([FallbackOption])

  /// Global value
  case global(CSSTypeTypes.Global)

  /// Predefined position fallback tactics
  public enum TryTactic: String, Sendable, Hashable {
    /// Flips the element's position along the block axis
    case flipBlock = "flip-block"

    /// Flips the element's position along the inline axis
    case flipInline = "flip-inline"

    /// Flips the element's position in both the inline and block directions
    case flipStart = "flip-start"
  }

  /// A single fallback option (can be a tactic, position area, or custom option)
  public enum FallbackOption: Sendable, Hashable {
    /// A predefined tactic
    case tactic(TryTactic)

    /// A position area value
    case positionArea(CSSString)

    /// A custom option name
    case customOption(CSSString)

    /// String representation of the fallback option
    var description: String {
      switch self {
      case .tactic(let tactic):
        return tactic.rawValue
      case .positionArea(let area):
        return area.description
      case .customOption(let option):
        return option.description
      }
    }
  }

  public var description: String {
    switch self {
    case .none:
      return "none"
    case .tactic(let tactic):
      return tactic.rawValue
    case .tactics(let tactics):
      return tactics.map { $0.rawValue }.joined(separator: ", ")
    case .positionArea(let area):
      return area.description
    case .customOption(let option):
      return option.description
    case .combined(let options):
      return options.map { $0.description }.joined(separator: ", ")
    case .global(let global):
      return global.description
    }
  }

  /// Create a combined fallback with tactics and position areas
  public static func combine(_ options: FallbackOption...) -> PositionTryFallbacks {
    .combined(options)
  }
}
