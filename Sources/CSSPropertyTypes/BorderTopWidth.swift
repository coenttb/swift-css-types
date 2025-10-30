import CSSTypeTypes
import Foundation

/// Represents the CSS `border-top-width` property, which sets the width of the top border.
///
/// This property sets the width for the top border of an element.
///
/// Visual Reference:
/// ```
/// Different width values:
/// ┌───────────────────────────┐
/// │                           │
/// │                           │
/// │                           │
/// │                           │
/// └───────────────────────────┘   ← border-top-width: thin
///
/// ┌═══════════════════════════┐
/// │                           │
/// │                           │
/// │                           │
/// │                           │
/// └───────────────────────────┘   ← border-top-width: thick
/// ```
///
/// Example:
/// ```swift
/// // Set the top border width to thin
/// .borderTopWidth(.thin)
///
/// // Set the top border width to medium
/// .borderTopWidth(.medium)
///
/// // Set the top border width to thick
/// .borderTopWidth(.thick)
///
/// // Set the top border width to a specific pixel value
/// .borderTopWidth(.px(3))
/// ```
///
/// - Note: For the border to be visible, you must also set `border-top-style` to a value other than `none`.
///
/// - SeeAlso: [MDN Web Docs on border-top-width](https://developer.mozilla.org/en-US/docs/Web/CSS/border-top-width)
public enum BorderTopWidth: Property {
  public static let property: String = "border-top-width"

  /// A specific width for the top border
  case width(BorderWidth)

  /// Global CSS values
  case global(CSSTypeTypes.Global)

  /// Creates a border-top-width with a specific border width
  ///
  /// - Parameter width: The width for the top border
  public init(_ width: BorderWidth) {
    self = .width(width)
  }
}

/// Provides string conversion for CSS output
extension BorderTopWidth: CustomStringConvertible {
  /// Converts the border-top-width to its CSS string representation
  ///
  /// This method generates CSS like:
  /// ```css
  /// border-top-width: thin;
  /// border-top-width: medium;
  /// border-top-width: thick;
  /// border-top-width: 3px;
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
extension BorderTopWidth: LengthConvertible {
  public static func length(_ length: CSSTypeTypes.Length) -> BorderTopWidth {
    .width(.length(length))
  }
}

/// Convenience methods for creating BorderTopWidth values
extension BorderTopWidth {
  /// The default border-top-width value (medium)
  public static let `default` = BorderTopWidth(.medium)

  /// Creates a thin border-top-width
  public static let thin = BorderTopWidth(.thin)

  /// Creates a medium border-top-width
  public static let medium = BorderTopWidth(.medium)

  /// Creates a thick border-top-width
  public static let thick = BorderTopWidth(.thick)

}
