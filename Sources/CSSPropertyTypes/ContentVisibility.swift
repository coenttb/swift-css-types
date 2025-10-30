import CSSTypeTypes
import Foundation

/// The `content-visibility` CSS property controls whether or not an element renders its contents,
/// along with forcing a strong set of containments.
///
/// This property allows user agents to potentially skip rendering work until it's needed,
/// which can significantly improve initial page load performance. When the element is not
/// relevant to the user, it can skip its contents entirely.
///
/// - SeeAlso: [MDN Web Docs](https://developer.mozilla.org/en-US/docs/Web/CSS/content-visibility)
public enum ContentVisibility: Property {
  public static let property: String = "content-visibility"

  /// No effect. The element's contents are laid out and rendered as normal.
  case visible

  /// The element skips its contents. The skipped contents must not be accessible to user-agent
  /// features like find-in-page or tab-order navigation. Similar to `display: none`.
  case hidden

  /// The element applies layout containment, style containment, and paint containment.
  /// If the element is not relevant to the user, it also skips its contents.
  /// Unlike hidden, the skipped contents must still be available to user-agent features.
  case auto

  /// Global values
  case global(CSSTypeTypes.Global)

  public var description: String {
    switch self {
    case .visible:
      return "visible"
    case .hidden:
      return "hidden"
    case .auto:
      return "auto"
    case .global(let value):
      return value.description
    }
  }
}
