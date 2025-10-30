import CSSTypeTypes
import Foundation

/// The CSS align-content property sets the distribution of space between and around content items
/// along a flexbox's cross axis, or a grid or block-level element's block axis.
///
/// This property has no effect on single line flex containers (i.e. ones with flex-wrap: nowrap).
///
/// Example:
/// ```swift
/// .alignContent(.spaceBetween)         // align-content: space-between
/// .alignContent(.center)               // align-content: center
/// .alignContent(.safe, .start)         // align-content: safe start
/// .alignContent(.firstBaseline)        // align-content: first baseline
/// ```
///
/// - Note: In block layout, child elements are treated as a single element, meaning
///         space-between, space-around, and space-evenly behave differently.
///
/// - SeeAlso: [MDN Web Docs on align-content](https://developer.mozilla.org/en-US/docs/Web/CSS/align-content)
public enum AlignContent: Property, BaselinePositionConvertible {
  public static let property: String = "align-content"

  /// Default alignment for the layout mode
  case normal

  /// Baseline alignment
  case baseline(BaselinePosition)

  /// Distribution alignment values
  case distribution(ContentDistribution)

  /// Positional alignment with optional overflow safety
  case position(OverflowPosition?, ContentPosition)

  /// Global values
  case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension AlignContent {
  /// Converts the alignment value to its CSS string representation
  public var description: String {
    switch self {
    case .normal:
      return "normal"

    case .baseline(let position):
      return position.description

    case .distribution(let distribution):
      return distribution.description

    case .position(let overflow, let position):
      if let overflow = overflow {
        return "\(overflow) \(position)"
      } else {
        return position.description
      }

    case .global(let global):
      return global.description
    }
  }
}

// Convenience properties and initializers
extension AlignContent {
  /// Simple baseline alignment
  public static let baseline = Self.baseline(.baseline)

  /// First baseline alignment
  public static let firstBaseline = Self.baseline(.firstBaseline)

  /// Last baseline alignment
  public static let lastBaseline = Self.baseline(.lastBaseline)

  /// Space-between distribution
  public static let spaceBetween = Self.distribution(.spaceBetween)

  /// Space-around distribution
  public static let spaceAround = Self.distribution(.spaceAround)

  /// Space-evenly distribution
  public static let spaceEvenly = Self.distribution(.spaceEvenly)

  /// Stretch distribution
  public static let stretch = Self.distribution(.stretch)

  /// Center position
  public static let center = Self.position(nil, .center)

  /// Start position
  public static let start = Self.position(nil, .start)

  /// End position
  public static let end = Self.position(nil, .end)

  /// Flex-start position
  public static let flexStart = Self.position(nil, .flexStart)

  /// Flex-end position
  public static let flexEnd = Self.position(nil, .flexEnd)

  /// Creates a safe position alignment
  public static func safe(_ position: ContentPosition) -> Self {
    return .position(.safe, position)
  }

  /// Creates an unsafe position alignment
  public static func unsafe(_ position: ContentPosition) -> Self {
    return .position(.unsafe, position)
  }
}
