import CSSTypeTypes
import Foundation

/// The CSS justify-self property sets the way a box is justified inside its alignment container along the inline axis.
///
/// In grid layouts, it aligns an item inside its grid area on the inline axis. In block-level layouts, it aligns
/// an item inside its containing block on the inline axis. For absolutely-positioned elements, it aligns an item
/// inside its containing block on the inline axis, accounting for the offset values. This property is ignored in
/// flexbox layouts and table cell layouts.
///
/// Example:
/// ```swift
/// .justifySelf(.auto)                  // justify-self: auto
/// .justifySelf(.stretch)               // justify-self: stretch
/// .justifySelf(.center)                // justify-self: center
/// .justifySelf(.left)                  // justify-self: left
/// .justifySelf(.safe, .center)         // justify-self: safe center
/// ```
///
/// - SeeAlso: [MDN Web Docs on justify-self](https://developer.mozilla.org/en-US/docs/Web/CSS/justify-self)
public enum JustifySelf: Property, SelfPositionConvertible, BaselinePositionConvertible {
  public static let property: String = "justify-self"
  /// Uses the parent's justify-items value
  case auto

  /// Default alignment for the layout mode
  case normal

  /// Stretches items to fill the container
  case stretch

  /// Baseline alignment
  case baseline(BaselinePosition)

  /// Positional alignment with optional overflow safety
  case position(OverflowPosition?, SelfPosition)

  /// Left alignment
  case left

  /// Right alignment
  case right

  /// Aligns item to the center of an anchor element
  case anchorCenter

  /// Global values
  case global(CSSTypeTypes.Global)
}

/// CSS Output conversion
extension JustifySelf: CustomStringConvertible {
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

    case .left:
      return "left"

    case .right:
      return "right"

    case .anchorCenter:
      return "anchor-center"

    case .global(let global):
      return global.description
    }
  }
}
