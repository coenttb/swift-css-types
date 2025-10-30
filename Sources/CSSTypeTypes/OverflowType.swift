import Foundation

/// Represents CSS overflow type values.
///
/// The `Overflow` type represents keyword values used for the overflow properties
/// (overflow, overflow-x, overflow-y, overflow-block, overflow-inline) that control
/// how content that overflows the element's box is handled.
///
/// Example:
/// ```swift
/// .overflow(.hidden)               // overflow: hidden
/// .overflowX(.scroll)              // overflow-x: scroll
/// .overflowY(.auto)                // overflow-y: auto
/// ```
///
/// - Note: When content overflows an element's box, the overflow property specifies
///         whether to clip the content, show scrollbars, or display the content outside the box.
///
/// - SeeAlso: [MDN Web Docs on overflow](https://developer.mozilla.org/en-US/docs/Web/CSS/overflow)
public enum Overflow: String, Sendable, Hashable, CaseIterable {
  public static let allCases: [Overflow] = [.visible, .hidden, .clip, .scroll, .auto]

  /// Content is not clipped and may be visible outside the padding box.
  ///
  /// This is the default value. The element box is not a scroll container.
  case visible

  /// Content is clipped at the padding box. No scrollbars are provided.
  ///
  /// Clipped content is not visible, but the content still exists.
  /// The element box is a scroll container.
  case hidden

  /// Content is clipped at the overflow clip edge defined by overflow-clip-margin.
  ///
  /// User agents do not add scrollbars and programmatic scrolling is not supported.
  /// No new formatting context is created.
  case clip

  /// Content is clipped at the padding box, but scrollbars are added to see the content.
  ///
  /// Scrollbars are always displayed, whether or not content is actually overflowing.
  /// The element box is a scroll container.
  case scroll

  /// If content overflows, it will be clipped but scrollbars appear as needed.
  ///
  /// Unlike scroll, user agents display scrollbars only if content is overflowing.
  /// The element box is a scroll container.
  case auto

  /// Legacy alias for auto (deprecated).
  ///
  /// With overlay, scrollbars are drawn on top of content instead of taking up space.
  /// This value is deprecated and should not be used in new code.
  @available(*, deprecated, message: "The overlay value is deprecated. Use auto instead.")
  case overlay
}

/// Provides string conversion for CSS output
extension Overflow: CustomStringConvertible {
  /// Converts the overflow type to its CSS string representation
  public var description: String {
    return rawValue
  }
}
