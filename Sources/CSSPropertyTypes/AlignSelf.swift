import CSSTypeTypes
import Foundation

/// The CSS align-self property overrides a grid or flex item's align-items value.
///
/// In grid, it aligns the item inside the grid area. In flexbox, it aligns the item on the cross axis.
/// The property doesn't apply to block-level boxes, or to table cells. If a flexbox item's cross-axis
/// margin is auto, then align-self is ignored.
///
/// Example:
/// ```swift
/// .alignSelf(.auto)                  // align-self: auto
/// .alignSelf(.stretch)               // align-self: stretch
/// .alignSelf(.center)                // align-self: center
/// .alignSelf(.flexEnd)               // align-self: flex-end
/// .alignSelf(.safe, .center)         // align-self: safe center
/// ```
///
/// - SeeAlso: [MDN Web Docs on align-self](https://developer.mozilla.org/en-US/docs/Web/CSS/align-self)
public enum AlignSelf: Property, SelfPositionConvertible, BaselinePositionConvertible {
  public static let property: String = "align-self"

  /// Uses the parent's align-items value
  case auto

  /// Default alignment for the layout mode
  case normal

  /// Stretches items to fill the container
  case stretch

  /// Baseline alignment
  case baseline(BaselinePosition)

  /// Positional alignment with optional overflow safety
  case position(OverflowPosition?, SelfPosition)

  /// Aligns item to the center of an anchor element
  case anchorCenter

  /// Global values
  case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension AlignSelf {
  /// Converts the alignment value to its CSS string representation
  public var description: String {
    switch self {
    case .auto:
      return "auto"

    case .normal:
      return "normal"

    case .stretch:
      return "stretch"

    case .baseline(let position):
      return position.description

    case .position(let overflow, let position):
      if let overflow = overflow {
        return "\(overflow) \(position)"
      } else {
        return position.description
      }

    case .anchorCenter:
      return "anchor-center"

    case .global(let global):
      return global.description
    }
  }
}
