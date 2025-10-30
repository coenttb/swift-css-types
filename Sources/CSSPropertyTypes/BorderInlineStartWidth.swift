import CSSTypeTypes
import Foundation

/// Represents the CSS `border-inline-start-width` property, which defines the width of the logical
/// inline-start border of an element.
///
/// This logical property maps to a physical border width depending on the element's writing mode,
/// directionality, and text orientation. It corresponds to one of `border-top-width`, `border-right-width`,
/// `border-bottom-width`, or `border-left-width` properties.
///
/// Visual Reference:
/// ```
/// horizontal-tb + ltr:          horizontal-tb + rtl:
/// ┌─────────────────────┐       ┌─────────────────────┐
/// │                     │       │                     │
/// │                     │       │                     │
/// │                     │       │                     │
/// │                     │       │                     │
/// └─────────────────────┘       └─────────────────────┘
///  ▲                                                ▲
/// border-inline-start-width     border-inline-start-width
///        (left)                         (right)
///
/// vertical-rl:                vertical-lr:
/// ┌─────────────────────┐     ┌─────────────────────┐
/// │                     │     │                     │
/// ├─────────────────────┤     ├─────────────────────┤
/// │                     │     │                     │
/// │                     │     │                     │
/// └─────────────────────┘     └─────────────────────┘
///                     ▲        ▲
///   border-inline-start-width   border-inline-start-width
///           (top)                   (bottom)
/// ```
///
/// Example:
/// ```swift
/// // Set the inline-start border width to medium
/// .borderInlineStartWidth(.medium)
///
/// // Set the inline-start border width to a specific pixel value
/// .borderInlineStartWidth(.px(4))
///
/// // Set the inline-start border width to thick
/// .borderInlineStartWidth(.thick)
/// ```
///
/// - SeeAlso: [MDN Web Docs on border-inline-start-width](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-start-width)
public enum BorderInlineStartWidth: Property {

  public static let property: String = "border-inline-start-width"

  /// Use a specific width value for the inline-start border
  case width(BorderWidth.Width)

  /// Global CSS values
  case global(CSSTypeTypes.Global)

  /// Creates a border-inline-start-width with a specific width value
  ///
  /// - Parameter width: The width value for the inline-start border
  public init(_ width: BorderWidth.Width) {
    self = .width(width)
  }
}

/// Provides string conversion for CSS output
extension BorderInlineStartWidth: CustomStringConvertible {
  /// Converts the border-inline-start-width to its CSS string representation
  ///
  /// This method generates CSS like:
  /// ```css
  /// border-inline-start-width: medium;
  /// border-inline-start-width: 4px;
  /// border-inline-start-width: thick;
  /// ```
  public var description: String {
    switch self {
    case .width(let width):
      return width.description
    case .global(let global):
      return global.description
    }
  }
}

extension BorderInlineStartWidth: LengthConvertible {
  public static func length(_ length: CSSTypeTypes.Length) -> BorderInlineStartWidth {
    BorderInlineStartWidth.width(.length(length))
  }

}
/// Convenience methods for creating BorderInlineStartWidth values
extension BorderInlineStartWidth {
  /// The default border-inline-start-width value (medium)
  public static let `default` = BorderInlineStartWidth(.medium)

  /// A thin border-inline-start-width
  public static let thin = BorderInlineStartWidth(.thin)

  /// A medium border-inline-start-width
  public static let medium = BorderInlineStartWidth(.medium)

  /// A thick border-inline-start-width
  public static let thick = BorderInlineStartWidth(.thick)
}
