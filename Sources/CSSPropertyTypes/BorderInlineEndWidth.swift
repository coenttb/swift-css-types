import CSSTypeTypes
import Foundation

/// Represents the CSS `border-inline-end-width` property, which defines the width of the logical
/// inline-end border of an element.
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
///                    ▲         ▲
///  border-inline-end-width    border-inline-end-width
///         (right)                    (left)
///
/// vertical-rl:                vertical-lr:
/// ┌─────────────────────┐     ┌─────────────────────┐
/// │                     │     │                     │
/// ├─────────────────────┤     ├─────────────────────┤
/// │                     │     │                     │
/// │                     │     │                     │
/// └─────────────────────┘     └─────────────────────┘
///  ▲                                               ▲
/// border-inline-end-width              border-inline-end-width
///     (bottom)                              (top)
/// ```
///
/// Example:
/// ```swift
/// // Set the inline-end border width to medium
/// .borderInlineEndWidth(.medium)
///
/// // Set the inline-end border width to a specific pixel value
/// .borderInlineEndWidth(.px(4))
///
/// // Set the inline-end border width to thick
/// .borderInlineEndWidth(.thick)
/// ```
///
/// - SeeAlso: [MDN Web Docs on border-inline-end-width](https://developer.mozilla.org/en-US/docs/Web/CSS/border-inline-end-width)
public enum BorderInlineEndWidth: Property {

  public static let property: String = "border-inline-end-width"

  /// Use a specific width value for the inline-end border
  case width(BorderWidth.Width)

  /// Global CSS values
  case global(CSSTypeTypes.Global)

  /// Creates a border-inline-end-width with a specific width value
  ///
  /// - Parameter width: The width value for the inline-end border
  public init(_ width: BorderWidth.Width) {
    self = .width(width)
  }
}

/// Provides string conversion for CSS output
extension BorderInlineEndWidth: CustomStringConvertible {
  /// Converts the border-inline-end-width to its CSS string representation
  ///
  /// This method generates CSS like:
  /// ```css
  /// border-inline-end-width: medium;
  /// border-inline-end-width: 4px;
  /// border-inline-end-width: thick;
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

/// Convenience methods for creating BorderInlineEndWidth values
extension BorderInlineEndWidth {
  /// The default border-inline-end-width value (medium)
  public static let `default` = BorderInlineEndWidth(.medium)

  /// A thin border-inline-end-width
  public static let thin = BorderInlineEndWidth(.thin)

  /// A medium border-inline-end-width
  public static let medium = BorderInlineEndWidth(.medium)

  /// A thick border-inline-end-width
  public static let thick = BorderInlineEndWidth(.thick)
}

extension BorderInlineEndWidth: LengthConvertible {
  public static func length(_ length: CSSTypeTypes.Length) -> BorderInlineEndWidth {
    .width(.length(length))
  }
}
