//
// ScrollPaddingInlineEnd.swift

import CSSTypeTypes

/// The `scroll-padding-inline-end` CSS property defines offsets for the end edge in the inline dimension of the optimal
/// viewing region of the scrollport: the region used as the target region for placing things in view of the user. This allows
/// the author to exclude regions of the scrollport that are obscured by other content (such as fixed-positioned toolbars or sidebars)
/// or to put more breathing room between a targeted element and the edges of the scrollport.
///
/// ```css
/// scroll-padding-inline-end: auto;
/// scroll-padding-inline-end: 10px;
/// scroll-padding-inline-end: 1em;
/// scroll-padding-inline-end: 10%;
/// ```
public enum ScrollPaddingInlineEnd: Property, LengthPercentageConvertible, CustomStringConvertible {
  public static let property: String = "scroll-padding-inline-end"

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
}
