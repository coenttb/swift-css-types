import CSSTypeTypes
import Foundation

/// The `overflow-block` CSS property sets what shows when content overflows the block start
/// and block end edges of a box. This may be nothing, a scroll bar, or the overflow content.
///
/// This is a logical property that maps to `overflow-x` or `overflow-y` depending on the element's
/// writing mode, direction, and text orientation.
///
/// Example:
/// ```swift
/// .overflowBlock(.visible)   // overflow-block: visible
/// .overflowBlock(.hidden)    // overflow-block: hidden
/// .overflowBlock(.clip)      // overflow-block: clip
/// .overflowBlock(.scroll)    // overflow-block: scroll
/// .overflowBlock(.auto)      // overflow-block: auto
/// ```
///
/// - Note: In horizontal writing modes like English, `overflow-block` is equivalent to `overflow-y`.
///         In vertical writing modes, it's equivalent to `overflow-x`.
///
/// - SeeAlso: [MDN Web Docs on overflow-block](https://developer.mozilla.org/en-US/docs/Web/CSS/overflow-block)
public enum OverflowBlock: Property {
  public static let property: String = "overflow-block"

  /// Content is not clipped and may be visible outside the block edges of the element's box
  case visible

  /// Content is clipped if necessary to fit in the block dimension, no scrollbars
  case hidden

  /// Content is clipped at the element's overflow clip edge defined using overflow-clip-margin
  case clip

  /// Content is clipped if necessary to fit in the block dimension, scrollbars always visible
  case scroll

  /// Content clipped if necessary, scrollbars only shown when needed
  case auto

  /// Global CSS value
  case global(CSSTypeTypes.Global)

  /// CSS string representation
  public var description: String {
    switch self {
    case .visible:
      return "visible"
    case .hidden:
      return "hidden"
    case .clip:
      return "clip"
    case .scroll:
      return "scroll"
    case .auto:
      return "auto"
    case .global(let global):
      return global.description
    }
  }
}
