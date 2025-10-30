import CSSTypeTypes
import Foundation

/// Represents the CSS `background-attachment` property, which determines how a background image is attached to the viewport.
///
/// This property sets whether a background image's position is fixed within the viewport,
/// or scrolls with its containing block or with the element's contents.
///
/// Visual Reference:
/// ```
/// ┌───────────────────────────┐  ┌───────────────────────────┐
/// │                           │  │                           │
/// │   Background with         │  │   Background with         │
/// │   attachment: scroll      │  │   attachment: fixed       │
/// │   (scrolls with element)  │  │   (fixed to viewport)     │
/// │                           │  │                           │
/// └───────────────────────────┘  └───────────────────────────┘
///
/// ┌───────────────────────────┐
/// │                           │
/// │   Background with         │
/// │   attachment: local       │
/// │   (scrolls with content)  │
/// │                           │
/// └───────────────────────────┘
/// ```
///
/// Example:
/// ```swift
/// // Fixed background (stays in place when scrolling)
/// .backgroundAttachment(.fixed)
///
/// // Default scrolling behavior
/// .backgroundAttachment(.scroll)
///
/// // Scrolls with content in scrollable elements
/// .backgroundAttachment(.local)
///
/// // Multiple backgrounds with different attachment behaviors
/// .backgroundAttachment([.fixed, .scroll])
/// ```
///
/// - SeeAlso: [MDN Web Docs on background-attachment](https://developer.mozilla.org/en-US/docs/Web/CSS/background-attachment)
public enum BackgroundAttachment: Property {
  public static let property: String = "background-attachment"

  /// The background scrolls with the element's content (default)
  ///
  /// The background is fixed relative to the element itself and does not scroll with its contents.
  /// It is effectively attached to the element's border.
  case scroll

  /// The background is fixed relative to the viewport
  ///
  /// Even if an element has a scrolling mechanism, the background doesn't move with the element.
  case fixed

  /// The background scrolls with the element's contents
  ///
  /// If the element has a scrolling mechanism, the background scrolls with the element's contents.
  case local

  /// A list of attachment values for multiple backgrounds
  case multiple([BackgroundAttachment])

  /// Global CSS values
  case global(CSSTypeTypes.Global)
}

/// Provides string conversion for CSS output
extension BackgroundAttachment: CustomStringConvertible {
  /// Converts the background-attachment value to its CSS string representation
  ///
  /// This method generates CSS like:
  /// ```css
  /// background-attachment: scroll;
  /// background-attachment: fixed;
  /// background-attachment: local;
  /// background-attachment: fixed, scroll;
  /// ```
  public var description: String {
    switch self {
    case .scroll:
      return "scroll"
    case .fixed:
      return "fixed"
    case .local:
      return "local"
    case .multiple(let attachments):
      return attachments.map { $0.description }.joined(separator: ", ")
    case .global(let global):
      return global.description
    }
  }
}

/// Default value and array conversion
extension BackgroundAttachment {
  /// The default value for background-attachment (`scroll`)
  public static let `default` = BackgroundAttachment.scroll

  /// Creates a background-attachment with multiple values
  ///
  /// - Parameter attachments: The background attachment values
  /// - Returns: A background-attachment with multiple values
  public static func values(_ attachments: [BackgroundAttachment]) -> BackgroundAttachment {
    if attachments.count == 1, case let attachment = attachments[0] {
      return attachment
    }
    return .multiple(attachments)
  }

  /// Creates a background-attachment with multiple values
  ///
  /// - Parameter attachments: The background attachment values
  /// - Returns: A background-attachment with multiple values
  public static func values(_ attachments: BackgroundAttachment...) -> BackgroundAttachment {
    values(attachments)
  }
}
