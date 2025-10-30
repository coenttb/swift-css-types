//
// ScrollPaddingRight.swift

import CSSTypeTypes

/// The `scroll-padding-right` CSS property defines offsets for the right of the optimal viewing region of the scrollport:
/// the region used as the target region for placing things in view of the user. This allows the author to exclude
/// regions of the scrollport that are obscured by other content (such as fixed-positioned toolbars or sidebars)
/// or to put more breathing room between a targeted element and the edges of the scrollport.
///
/// ```css
/// scroll-padding-right: auto;
/// scroll-padding-right: 10px;
/// scroll-padding-right: 1em;
/// scroll-padding-right: 10%;
/// ```
public enum ScrollPaddingRight: Property, LengthPercentageConvertible, CustomStringConvertible {
  public static let property: String = "scroll-padding-right"

  /// Keyword values
  case auto

  case lengthPercentage(LengthPercentage)

  /// Global CSS value
  case global(CSSTypeTypes.Global)

  public var description: String {
    switch self {
    case .auto: return "auto"
    case .lengthPercentage(let lengthPercentage): return lengthPercentage.description
    case .global(let global): return global.description
    }
  }

  /// Creates a ScrollPaddingRight using a length
  public static func px(_ value: Double) -> Self {
    .length(.px(value))
  }

  /// Creates a ScrollPaddingRight using a percentage
  public static func percent(_ value: Double) -> Self {
    .percentage(.init(value))
  }
}
